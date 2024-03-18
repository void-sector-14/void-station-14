using System.Threading;

// ReSharper disable IdentifierTypo

namespace Content.Server.Czeshuika.Carrying.Components;

[RegisterComponent]
public sealed partial class CarriableComponent : Component
{
    /// <summary>
    /// Количество свободных рук, необходимых для взятия на руки.
    /// </summary>
    [DataField("freeHandsRequired")]
    public int FreeHandsRequired = 2;

    public CancellationTokenSource? CancelToken;
}
