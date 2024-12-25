using Content.Server._AntiqueSpace.Administration.UI;
using Content.Server.Administration;
using Content.Server.EUI;
using Content.Shared.Administration;
using Robust.Shared.Console;

namespace Content.Server._AntiqueSpace.Administration.Commands;

[AdminCommand(AdminFlags.Logs)]
public sealed class OpenAdministrationLogsWindow : IConsoleCommand
{
    public string Command => "Админ_Логи";
    public string Description => "Открывает тестовое окно, очевидно для тестов.";
    public string Help => $"Usage: {Command}";

    public void Execute(IConsoleShell shell, string argStr, string[] args)
    {
        if (shell.Player is not { } player)
        {
            shell.WriteError(Loc.GetString("shell-cannot-run-command-from-server"));
            return;
        }

        var eui = IoCManager.Resolve<EuiManager>();
        var ui = new ModerationLogsEui();
        eui.OpenEui(ui, player);
    }
}
