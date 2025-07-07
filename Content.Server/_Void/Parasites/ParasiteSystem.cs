using Content.Shared.Damage;
using Content.Shared.Mobs;
using Content.Shared.Mobs.Components;
using Content.Shared.Mobs.Systems;
using Content.Shared.Popups;
using Content.Shared._Void.Parasites;
using Robust.Shared.Random;
using Robust.Shared.Timing;

namespace Content.Server._Void.Parasites
{
    public sealed partial class ParasiteSystem : SharedParasiteSystem
    {
        [Dependency] private readonly IGameTiming _timing = default!;
        [Dependency] private readonly IRobustRandom _random = default!;
        [Dependency] private readonly DamageableSystem _damageable = default!;
        [Dependency] private readonly MobStateSystem _mobState = default!;
        [Dependency] private readonly SharedPopupSystem _popup = default!;

        public override void Initialize()
        {
            base.Initialize();

            SubscribeLocalEvent<PendingParasiteComponent, MapInitEvent>(OnPendingMapInit);

            SubscribeLocalEvent<ParasiteOnDeathComponent, MobStateChangedEvent>(OnMobStateChanged);

        }

        private void OnPendingMapInit(EntityUid uid, PendingParasiteComponent component, MapInitEvent args)
        {
            if (_mobState.IsDead(uid))
            {
                var entityManager = IoCManager.Resolve<IEntityManager>();
                entityManager.SpawnEntity(ParasitePrototypeName, entityManager.GetComponent<TransformComponent>(uid).Coordinates);
            }

            component.NextTick = _timing.CurTime + TimeSpan.FromSeconds(1f);
            component.GracePeriod = _random.Next(component.MinInitialInfectedGrace, component.MaxInitialInfectedGrace);
        }

        public override void Update(float frameTime)
        {
            base.Update(frameTime);
            var curTime = _timing.CurTime;

            // Hurt the living infected
            var query = EntityQueryEnumerator<PendingParasiteComponent, DamageableComponent, MobStateComponent>();
            while (query.MoveNext(out var uid, out var comp, out var damage, out var mobState))
            {
                // Process only once per second
                if (comp.NextTick > curTime)
                    continue;

                comp.NextTick = curTime + TimeSpan.FromSeconds(1f);

                comp.GracePeriod -= TimeSpan.FromSeconds(1f);
                if (comp.GracePeriod > TimeSpan.Zero)
                    continue;

                if (_random.Prob(comp.InfectionWarningChance))
                    _popup.PopupEntity(Loc.GetString(_random.Pick(comp.InfectionWarnings)), uid, uid);

                var multiplier = _mobState.IsCritical(uid, mobState)
                    ? comp.CritDamageMultiplier
                    : 1f;

                _damageable.TryChangeDamage(uid, comp.Damage * multiplier, true, false, damage);
            }
        }
    }
}
