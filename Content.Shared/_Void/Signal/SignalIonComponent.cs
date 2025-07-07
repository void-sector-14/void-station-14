using Robust.Shared.GameStates;

namespace Content.Shared.Void.Signal;

/// <summary>
/// Marker component to identify entities with signals.
/// </summary>
[RegisterComponent, NetworkedComponent]
public sealed partial class SignalIonComponent : Component { }
