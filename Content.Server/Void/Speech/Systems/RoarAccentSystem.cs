using System.Text.RegularExpressions;
using Content.Server.Czeshuika.Speech.Components;
using Content.Server.Speech;
using Robust.Shared.Random;

namespace Content.Server.Czeshuika.Speech.Systems;

public sealed class RoarAccentSystem : EntitySystem
{
    [Dependency] private readonly IRobustRandom _random = default!;

    private readonly List<string> _rrrList1 = new() { "Рр", "Ррр" };
    private readonly List<string> _rrrList2 = new() { "рр", "ррр" };

    public override void Initialize()
    {
        base.Initialize();
        SubscribeLocalEvent<RoarAccentComponent, AccentGetEvent>(OnAccent);
    }

    private void OnAccent(EntityUid uid, RoarAccentComponent component, AccentGetEvent args)
    {
        var message = args.Message;
        message = Regex.Replace(message, "Р+", _random.Pick(_rrrList1));
        message = Regex.Replace(message, "р+", _random.Pick(_rrrList2));
        args.Message = message;
    }
}
