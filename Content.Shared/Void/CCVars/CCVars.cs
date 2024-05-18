using Robust.Shared.Configuration;

namespace Content.Shared.Void.CCVar;

[CVarDefs]
public sealed class VoidCVars
{
    /// <summary>
    /// Whether or not respawning is enabled.
    /// </summary>
    public static readonly CVarDef<bool> RespawnEnabled =
        CVarDef.Create("void.respawn.enabled", true, CVar.SERVER | CVar.REPLICATED);

    /// <summary>
    /// Respawn time, how long the player has to wait in seconds after death.
    /// </summary>
    public static readonly CVarDef<float> RespawnTime =
        CVarDef.Create("void.respawn.time", 600.0f, CVar.SERVER | CVar.REPLICATED);
}
