using Content.Shared.EntityEffects;
using Robust.Shared.Prototypes;
using Content.Shared.Void.Parasites;

namespace Content.Server.Void.EntityEffects.Effects;

public sealed partial class CauseParasiteInfection : EntityEffect
{
    protected override string? ReagentEffectGuidebookText(IPrototypeManager prototype, IEntitySystemManager entSys)
        => Loc.GetString("reagent-effect-guidebook-cause-parasite-infection", ("chance", Probability));

    // Adds the Parasite Infection Components
    public override void Effect(EntityEffectBaseArgs args)
    {
        var entityManager = args.EntityManager;
        entityManager.EnsureComponent<ParasiteOnDeathComponent>(args.TargetEntity);
        entityManager.EnsureComponent<PendingParasiteComponent>(args.TargetEntity);
    }
}
