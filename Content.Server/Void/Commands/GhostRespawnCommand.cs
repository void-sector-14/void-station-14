using Content.Server.GameTicking;
using Content.Server.Mind;
using Content.Shared.Administration;
using Content.Shared.CCVar;
using Content.Shared.Ghost;
using Content.Shared.Mind;
using Content.Shared.Void.CCVar;
using Content.Shared.Roles;
using Robust.Server.Player;
using Robust.Shared.Configuration;
using Robust.Shared.Console;
using Robust.Shared.Player;
using Robust.Shared.Timing;

namespace Content.Server.Void.Commands;

[AnyCommand()]
public sealed class GhostRespawnCommand : IConsoleCommand
{
    [Dependency] private readonly IGameTiming _gameTiming = default!;
    [Dependency] private readonly IEntityManager _entityManager = default!;
    [Dependency] private readonly IConfigurationManager _configurationManager = default!;

    public string Command => "ghostrespawn";
    public string Description => "Позволяет игроку вернуться в лобби, если он был мертв достаточно долго, позволяя повторно войти в раунд ЗА ДРУГОГО ПЕРСОНАЖА.";
    public string Help => $"{Command}";

    public void Execute(IConsoleShell shell, string argStr, string[] args)
    {
        if (!_configurationManager.GetCVar(VoidCVars.RespawnEnabled))
        {
            shell.WriteLine("Возрождение отключено, попросите администрацию возродить вас.");
            return;
        }

        if (shell.Player is null)
        {
            shell.WriteLine("Вы не можете запустить это из консоли!");
            return;
        }

        if (shell.Player.AttachedEntity is null)
        {
            shell.WriteLine("Вы не можете запустить это в лобби или без сущности.");
            return;
        }

        if (!_entityManager.TryGetComponent<GhostComponent>(shell.Player.AttachedEntity, out var ghost))
        {
            shell.WriteLine("Вы не призрак.");
            return;
        }

        var mindSystem = _entityManager.EntitySysManager.GetEntitySystem<MindSystem>();
        if (!mindSystem.TryGetMind(shell.Player, out _, out _))
        {
            shell.WriteLine("You have no mind.");
            return;
        }
        var time = (_gameTiming.CurTime - ghost.TimeOfDeath);
        var respawnTime = _configurationManager.GetCVar(VoidCVars.RespawnTime);

        if (respawnTime > time.TotalSeconds)
        {
            shell.WriteLine($"Вы не мертвы достаточно долго. Вы мертвы в течении {time.TotalSeconds} секунд из требующихся {respawnTime}.");
            return;
        }

        var gameTicker = _entityManager.EntitySysManager.GetEntitySystem<GameTicker>();
        gameTicker.Respawn(shell.Player);
    }
}
