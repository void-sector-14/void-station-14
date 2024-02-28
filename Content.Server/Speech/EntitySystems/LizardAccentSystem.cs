using System.Text.RegularExpressions;
using Content.Server.Speech.Components;
using Robust.Shared.Random;

namespace Content.Server.Speech.EntitySystems;

public sealed class LizardAccentSystem : EntitySystem
{
    [Dependency] private readonly IRobustRandom _random = default!;

    private readonly List<string> _sssList1 = new() { "Сс", "Ссс" };
    private readonly List<string> _sssList2 = new() { "сс", "ссс" };
    private readonly List<string> _shList1 = new() { "Шш", "Шшш" };
    private readonly List<string> _shList2 = new() { "шш", "шшш" };
    private readonly List<string> _sсhList1 = new() { "Щщ", "Щщщ" };
    private readonly List<string> _sсhList2 = new() { "щщ", "щщщ" };
    public override void Initialize()
    {
        base.Initialize();
        SubscribeLocalEvent<LizardAccentComponent, AccentGetEvent>(OnAccent);
    }

    private void OnAccent(EntityUid uid, LizardAccentComponent component, AccentGetEvent args)
    {
        var message = args.Message;

        // c => ссс
        message = Regex.Replace(message, "с+", _random.Pick(_sssList2));
        // С => CCC
        message = Regex.Replace(message, "С+", _random.Pick(_sssList1));
        // з => ссс
        message = Regex.Replace(message, "з+", _random.Pick(_sssList2));
        // З => CCC
        message = Regex.Replace(message, "З+", _random.Pick(_sssList1));
        // ш => шшш
        message = Regex.Replace(message, "ш+", _random.Pick(_shList2));
        // Ш => ШШШ
        message = Regex.Replace(message,"Ш+",_random.Pick(_shList1));
        // ч => щщщ
        message = Regex.Replace(message, "ч+", _random.Pick(_sсhList2));
        // Ч => ЩЩЩ
        message = Regex.Replace(message, "Ч+", _random.Pick(_sсhList1));

        args.Message = message;
    }
}
