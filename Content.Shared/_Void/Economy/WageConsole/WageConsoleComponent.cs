using Robust.Shared.GameStates;

namespace Content.Shared._Void.Economy.WageConsole;

[RegisterComponent, NetworkedComponent, Access(typeof(SharedWageConsoleSystem))]
public sealed partial class WageConsoleComponent : Component
{

}
