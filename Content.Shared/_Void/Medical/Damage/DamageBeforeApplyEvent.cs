using Content.Shared.Damage;

namespace Content.Shared._Void.Medical.Damage;
public sealed class DamageBeforeApplyEvent : EntityEventArgs
{
    public required DamageSpecifier Damage;
    public EntityUid? Origin;

    public bool Cancelled { get; set; }
}
