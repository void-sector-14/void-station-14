using System.Threading;
// ReSharper disable IdentifierTypo

namespace Content.Server.Void.Carrying.Components;

[RegisterComponent]
public sealed partial class CarriableComponent : Component
{
    /// <summary>
    ///     Number of free hands required
    ///     to carry the entity
    /// </summary>
    [DataField("freeHandsRequired")]
    public int FreeHandsRequired = 2;

    public CancellationTokenSource? CancelToken;
}
