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

    /// <summary>
    /// Включены ли заплаты.
    /// </summary>
    public static readonly CVarDef<bool> EconomyWagesEnabled =
        CVarDef.Create("economy.wages_enabled", true, CVar.SERVERONLY);

    /// <summary>
    /// Прототип станции ЦентКомма.
    /// </summary>
    public static readonly CVarDef<string> CentcommStation =
        CVarDef.Create("void.centcomm_station", "VoidCentComm", CVar.SERVERONLY);

    /*
     * _CorvaxNext Bind Standing and Laying System
     */

    public static readonly CVarDef<bool> AutoGetUp =
        CVarDef.Create("laying.auto_get_up", true, CVar.CLIENT | CVar.ARCHIVE | CVar.REPLICATED);

    /// <summary>
    ///     When true, entities that fall to the ground will be able to crawl under tables and
    ///     plastic flaps, allowing them to take cover from gunshots.
    /// </summary>
    public static readonly CVarDef<bool> CrawlUnderTables =
        CVarDef.Create("laying.crawlundertables", true, CVar.REPLICATED);

}
