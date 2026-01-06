using Content.Server.Chat.Managers;
using Content.Server.Chat.Systems;
using Content.Shared.ADT.Language;
using Content.Shared.Chat;
using Content.Shared.IdentityManagement;
using Content.Shared.Speech;
using Robust.Server.Audio;
using Robust.Shared.Audio;
using Robust.Shared.Prototypes;
using Robust.Shared.Random;
using Robust.Shared.Utility;

namespace Content.Server.ADT.Language;

[DataDefinition]
public sealed partial class Emotes : ILanguageType
{
    public ProtoId<LanguagePrototype> Language { get; set; }

    [DataField]
    public Color? Color { get; set; }

    [DataField]
    public Color? WhisperColor { get; set; }

    [DataField]
    public bool RaiseEvent { get; set; }

    /// <inheritdoc/>
    [DataField("verbs")]
    public Dictionary<string, List<string>> SuffixSpeechVerbs { get; set; } = new()
    {
        { "chat-speech-verb-suffix-exclamation-strong", []},
        { "chat-speech-verb-suffix-exclamation", []},
        { "chat-speech-verb-suffix-question", []},
        { "chat-speech-verb-suffix-stutter", []},
        { "chat-speech-verb-suffix-mumble", []},
    };

    /// <inheritdoc/>
    [DataField]
    public int? FontSize { get; set; }

    /// <inheritdoc/>
    [DataField]
    public string? Font { get; set; }

    [DataField(required: true)]
    public List<string> Replacement = [];

    [DataField]
    public SoundSpecifier? Sound;

    public void Speak(EntityUid uid, string message, string name, SpeechVerbPrototype verb, ChatTransmitRange range, IEntityManager entMan, out bool success, out string resultMessage)
    {
        var lang = entMan.System<LanguageSystem>();
        var chat = entMan.System<ChatSystem>();
        var audio = entMan.System<AudioSystem>();
        var random = IoCManager.Resolve<IRobustRandom>();
        var chatMan = IoCManager.Resolve<IChatManager>();
        success = false;

        chat.TryProccessRadioMessage(uid, message, out message, out _);
        string coloredMessage = lang.AccentuateMessage(uid, Language, message);

        // We dont want to generate emotes
        string coloredLanguageMessage = random.Pick(Replacement);
        resultMessage = FormattedMessage.EscapeText(coloredMessage);

        if (string.IsNullOrEmpty(coloredMessage))
            return;

        // Apply language color
        if (Color != null)
        {
            coloredMessage = $"[color={Color.Value.ToHex()}]{coloredMessage}[/color]";
        }

        // Getting verbs
        List<string> verbStrings = verb.SpeechVerbStrings;
        bool verbsReplaced = false;
        foreach (var str in ILanguageType.SpeechSuffixes)
        {
            if (message.EndsWith(Loc.GetString(str)) && SuffixSpeechVerbs.TryGetValue(str, out var strings) && strings.Count > 0)
            {
                verbStrings = strings;
                verbsReplaced = true;
            }
        }

        if (!verbsReplaced && SuffixSpeechVerbs.TryGetValue("Default", out var defaultStrings) && defaultStrings.Count > 0)
            verbStrings = defaultStrings;

        int fontSize = FontSize.HasValue ? FontSize.Value : verb.FontSize;
        string font = Font != null && Font != "" ? Font : verb.FontId;

        name = FormattedMessage.EscapeText(name);

        // Build messages
        var wrappedMessage = Loc.GetString(verb.Bold ? "chat-manager-entity-say-bold-wrap-message" : "chat-manager-entity-say-wrap-message",
            ("entityName", name),
            ("verb", Loc.GetString(random.Pick(verbStrings))),
            ("fontType", font),
            ("fontSize", fontSize),
            ("defaultFont", verb.FontId),
            ("defaultSize", verb.FontSize),
            ("message", coloredMessage));

        var wrappedLanguageMessage = Loc.GetString("chat-manager-entity-me-wrap-message",
            ("entityName", name),
            ("entity", Identity.Entity(uid, entMan)),
            ("message", FormattedMessage.RemoveMarkupOrThrow(coloredLanguageMessage)));

        foreach (var (session, data) in chat.GetRecipients(uid, ChatSystem.VoiceRange))
        {
            EntityUid listener;

            if (session.AttachedEntity is not { Valid: true })
                continue;
            listener = session.AttachedEntity.Value;

            var entRange = chat.MessageRangeCheck(session, data, range);
            if (entRange == ChatSystem.MessageRangeCheckResult.Disallowed)
                continue;
            var entHideChat = entRange == ChatSystem.MessageRangeCheckResult.HideChat;

            if (!lang.CanUnderstand(listener, Language))
                chatMan.ChatMessageToOne(ChatChannel.Emotes, message, wrappedLanguageMessage, uid, entHideChat, session.Channel, author: session.UserId);
            else
                chatMan.ChatMessageToOne(ChatChannel.Local, message, wrappedMessage, uid, entHideChat, session.Channel, author: session.UserId);
        }

        audio.PlayPvs(Sound, uid);
        success = true;
    }

    public void Whisper(EntityUid uid, string message, string name, string nameIdentity, ChatTransmitRange range, IEntityManager entMan, out bool success, out string resultMessage, out string resultObfMessage)
    {
        var lang = entMan.System<LanguageSystem>();
        var chat = entMan.System<ChatSystem>();
        var audio = entMan.System<AudioSystem>();
        var random = IoCManager.Resolve<IRobustRandom>();
        var chatMan = IoCManager.Resolve<IChatManager>();
        success = false;

        chat.TryProccessRadioMessage(uid, message, out message, out _);
        string coloredMessage = lang.AccentuateMessage(uid, Language, message);
        string coloredLanguageMessage = random.Pick(Replacement);
        resultMessage = FormattedMessage.EscapeText(coloredMessage);
        resultObfMessage = FormattedMessage.EscapeText(coloredMessage);
        if (string.IsNullOrEmpty(coloredMessage))
            return;

        var verb = chat.GetSpeechVerb(uid, message);

        if (Color != null)
        {
            coloredMessage = $"[color={Color.Value.ToHex()}]{coloredMessage}[/color]";
        }

        if (string.IsNullOrEmpty(FormattedMessage.EscapeText(coloredMessage)))
            return;

        // Getting verbs
        List<string> verbStrings = verb.SpeechVerbStrings;
        bool verbsReplaced = false;
        foreach (var str in ILanguageType.SpeechSuffixes)
        {
            if (message.EndsWith(Loc.GetString(str)) && SuffixSpeechVerbs.TryGetValue(str, out var strings))
            {
                verbStrings = strings;
                verbsReplaced = true;
            }
        }

        if (!verbsReplaced && SuffixSpeechVerbs.TryGetValue("Default", out var defaultStrings))
            verbStrings = defaultStrings;

        int fontSize = FontSize.HasValue ? FontSize.Value : verb.FontSize;
        string font = Font != null && Font != "" ? Font : verb.FontId;

        name = FormattedMessage.EscapeText(name);
        var wrappedMessage = Loc.GetString(verb.Bold ? "chat-manager-entity-say-bold-wrap-message" : "chat-manager-entity-say-wrap-message",
            ("entityName", name),
            ("verb", Loc.GetString(random.Pick(verbStrings))),
            ("fontType", font),
            ("fontSize", fontSize),
            ("defaultFont", verb.FontId),
            ("defaultSize", verb.FontSize),
            ("message", coloredMessage));

        var wrappedLanguageMessage = Loc.GetString("chat-manager-entity-me-wrap-message",
            ("entityName", name),
            ("entity", Identity.Entity(uid, entMan)),
            ("message", FormattedMessage.RemoveMarkupOrThrow(coloredLanguageMessage)));

        foreach (var (session, data) in chat.GetRecipients(uid, ChatSystem.VoiceRange))
        {
            EntityUid listener;

            if (session.AttachedEntity is not { Valid: true })
                continue;
            listener = session.AttachedEntity.Value;

            var entRange = chat.MessageRangeCheck(session, data, range);
            if (entRange == ChatSystem.MessageRangeCheckResult.Disallowed)
                continue;
            var entHideChat = entRange == ChatSystem.MessageRangeCheckResult.HideChat;

            if (!lang.CanUnderstand(listener, Language))
                chatMan.ChatMessageToOne(ChatChannel.Emotes, message, wrappedLanguageMessage, uid, entHideChat, session.Channel, author: session.UserId);
            else
                chatMan.ChatMessageToOne(ChatChannel.Local, message, wrappedMessage, uid, entHideChat, session.Channel, author: session.UserId);
        }

        audio.PlayPvs(Sound, uid);
        success = true;
    }
}
