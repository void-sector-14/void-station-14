using Content.Server.Speech.Components;
using Robust.Shared.Random;

namespace Content.Server.Speech.EntitySystems
{
    public sealed class OwOAccentSystem : EntitySystem
    {
        [Dependency] private readonly IRobustRandom _random = default!;

        private static readonly IReadOnlyDictionary<string, string> SpecialWords = new Dictionary<string, string>()
        {
            { "ты", "ти" },
        };

        public override void Initialize()
        {
            SubscribeLocalEvent<OwOAccentComponent, AccentGetEvent>(OnAccent);
        }

        public string Accentuate(string message)
        {
            foreach (var (word, repl) in SpecialWords)
            {
                message = message.Replace(word, repl);
            }

            return message
                .Replace("р", "в").Replace("Р", "В")
                .Replace("л", "в").Replace("Л", "В");
        }

        private void OnAccent(EntityUid uid, OwOAccentComponent component, AccentGetEvent args)
        {
            args.Message = Accentuate(args.Message);
        }
    }
}
