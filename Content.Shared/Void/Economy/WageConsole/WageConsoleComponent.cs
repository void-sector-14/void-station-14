using Robust.Shared.GameStates;

namespace Content.Shared.Void.Economy.WageConsole;

[RegisterComponent, NetworkedComponent, Access(typeof(SharedWageConsoleSystem))]
public sealed partial class WageConsoleComponent : Component
{

}
