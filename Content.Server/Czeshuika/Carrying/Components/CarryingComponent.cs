namespace Content.Server.Czeshuika.Carrying.Components;

/// <summary>
/// Добавляется к объекту, когда он кого-то несёт.
/// </summary>
[RegisterComponent]
public sealed partial class CarryingComponent : Component
{
    public EntityUid Carried = default!;
}
