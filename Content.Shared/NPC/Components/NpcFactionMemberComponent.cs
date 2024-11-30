using Content.Shared.Mech.EntitySystems;
using Content.Shared.NPC.Prototypes;
using Content.Shared.NPC.Systems;
using Robust.Shared.GameStates;
using Robust.Shared.Prototypes;

namespace Content.Shared.NPC.Components;

[RegisterComponent, NetworkedComponent, Access(typeof(NpcFactionSystem), typeof(SharedMechSystem))]
public sealed partial class NpcFactionMemberComponent : Component
{
    /// <summary>
    /// Factions this entity is a part of.
    /// </summary>
    [DataField]
    public HashSet<ProtoId<NpcFactionPrototype>> Factions = new();

    /// <summary>
    /// Cached friendly factions.
    /// </summary>
    [ViewVariables]
    public HashSet<ProtoId<NpcFactionPrototype>> FriendlyFactions = new();

    /// <summary>
    /// Cached hostile factions.
    /// </summary>
    [ViewVariables]
    public HashSet<ProtoId<NpcFactionPrototype>> HostileFactions = new();

    /// <summary>
    /// Used to add friendly factions in prototypes.
    /// </summary>
    [DataField, ViewVariables]
    public HashSet<ProtoId<NpcFactionPrototype>>? AddFriendlyFactions;

    /// <summary>
    /// Used to add hostile factions in prototypes.
    /// </summary>
    [DataField, ViewVariables]
    public HashSet<ProtoId<NpcFactionPrototype>>? AddHostileFactions;
}
