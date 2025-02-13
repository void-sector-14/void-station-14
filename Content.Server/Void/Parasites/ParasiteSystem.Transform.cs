using Content.Shared.Mobs;
using Content.Shared.Mobs.Components;
using Content.Shared.Popups;
using Content.Shared.Void.Parasites;
using Robust.Shared.Prototypes;

namespace Content.Server.Void.Parasites;

public sealed partial class ParasiteSystem
{
    [ValidatePrototypeId<EntityPrototype>]
    public const string ParasitePrototypeName = "MobParasite";

    /// <summary>
    /// Handles an entity spawning a parasite when they die
    /// </summary>
    private void OnMobStateChanged(EntityUid uid, ParasiteOnDeathComponent component, MobStateChangedEvent args)
    {
        // don't spawn if they aren't going straight from crit to dead
        if (args.NewMobState != MobState.Dead || args.OldMobState != MobState.Critical)
        {
            ParasifyEntity(uid, args.Component);
        }
    }
    public void ParasifyEntity(EntityUid target, MobStateComponent? mobState = null)
    {
        RemComp<PendingParasiteComponent>(target);
        RemComp<ParasiteOnDeathComponent>(target);
        var coords = Transform(target).Coordinates;
        EntityManager.SpawnAtPosition(ParasitePrototypeName, coords);
        EntityManager.SpawnAtPosition(ParasitePrototypeName, coords);
        EntityManager.SpawnAtPosition(ParasitePrototypeName, coords);

        _popup.PopupEntity(Loc.GetString("parasite-transform", ("target", target)), target, PopupType.LargeCaution);
    }
}
