using Content.Shared.Database;

namespace Content.Client._AntiqueSpace.UserInterface
{
    public sealed class LogsList
    {
        public readonly SortedDictionary<string, List<LogType>> TypesDictionary = new()
        {
            {
                "health-log-type", new List<LogType>
                {
                    LogType.Damaged, LogType.Healed
                }
            },
            {
                "damage-log-type", new List<LogType>
                {
                    LogType.Barotrauma, LogType.Asphyxiation, LogType.Temperature, LogType.Explosion, LogType.Radiation, LogType.Electrocution
                }
            },
            {
                "hits-log-type", new List<LogType>
                {
                    LogType.MeleeHit, LogType.ThrowHit, LogType.BulletHit, LogType.HitScanHit, LogType.ExplosionHit
                }
            },
            {
                "events-log-type", new List<LogType>
                {
                    LogType.EventAnnounced, LogType.EventStarted, LogType.EventRan, LogType.EventStopped
                }
            },
            {
                "chat-log-type", new List<LogType>
                {
                    LogType.Chat, LogType.ChatRateLimited
                }
            },
            {
                "shuttle-log-type", new List<LogType>
                {
                    LogType.ShuttleCalled, LogType.ShuttleRecalled, LogType.EmergencyShuttle
                }
            },
            {
                "adminabuse-log-type", new List<LogType>
                {
                    LogType.Respawn, LogType.EntitySpawn, LogType.EntityDelete, LogType.AdminMessage, LogType.Teleport
                }
            },
            {
                "round-log-type", new List<LogType>
                {
                    LogType.RoundStartJoin, LogType.LateJoin, LogType.Vote
                }
            },
            {
                "canister-log-type", new List<LogType>
                {
                    LogType.CanisterValve, LogType.CanisterPressure, LogType.CanisterPurged, LogType.CanisterTankEjected, LogType.CanisterTankInserted
                }
            },
            {
                "atmosdevice-log-type", new List<LogType>
                {
                    LogType.AtmosPressureChanged, LogType.AtmosPowerChanged, LogType.AtmosVolumeChanged, LogType.AtmosFilterChanged, LogType.AtmosRatioChanged, LogType.AtmosTemperatureChanged
                }
            },
            {
                "medical-log-type", new List<LogType>
                {
                    LogType.ChemicalReaction, LogType.ReagentEffect, LogType.Ingestion
                }
            },
            {
                "interactions-log-type", new List<LogType>
                {
                    LogType.Action, LogType.DisarmedAction, LogType.ForceFeed, LogType.InteractActivate, LogType.InteractUsing, LogType.InteractHand, LogType.RateLimited, LogType.Identity, LogType.Stripping
                }
            },
            {
                "items-log-type", new List<LogType>
                {
                    LogType.Throw, LogType.Landed, LogType.Pickup, LogType.Drop
                }
            },
            {
                "roles-log-type", new List<LogType>
                {
                    LogType.Mind, LogType.GhostRoleTaken
                }
            },
            {
                "construct-log-type", new List<LogType>
                {
                    LogType.Construction, LogType.CableCut, LogType.Anchor, LogType.Unanchor, LogType.LatticeCut, LogType.ItemConfigure, LogType.DeviceLinking, LogType.DeviceNetwork, LogType.Tile, LogType.RCD
                }
            },
            {
                "hack-log-type", new List<LogType>
                {
                    LogType.WireHacking, LogType.Emag
                }
            },
            {
                "nockdown-log-type", new List<LogType>
                {
                    LogType.DisarmedAction, LogType.AttackArmedClick, LogType.AttackArmedWide, LogType.AttackUnarmedClick, LogType.AttackUnarmedWide
                }
            },
            {
                "other-log-type", new List<LogType>
                {
                    LogType.StorePurchase
                }
            }
        };
    }
}
