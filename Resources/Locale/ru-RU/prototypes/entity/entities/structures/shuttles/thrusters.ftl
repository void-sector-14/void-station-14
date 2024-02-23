ent-BaseThruster = двигатель
    .desc = Ускоритель, заставляющий шаттл двигаться.
    .suffix = { ent-BaseStructureDynamic.suffix }

ent-Thruster = { ent-BaseThruster }
    .desc = { ent-BaseThruster.desc }
    .suffix = { ent-BaseThruster.suffix }

ent-ThrusterUnanchored = { ent-Thruster }
    .desc = { "" }
    .suffix = { "" }

ent-DebugThruster = DEBUG двигатель
    .desc = Делает ньооооооом. Не требует ни питания, ни свободного места.
    .suffix = DEBUG

ent-Gyroscope = гироскоп
    .desc = Увеличивает потенциальное угловое вращение шаттла.
    .suffix = { ent-BaseThruster.suffix }

ent-GyroscopeUnanchored = { ent-Gyroscope }
    .desc = { "" }
    .suffix = { "" }

ent-DebugGyroscope = DEBUG гироскоп
    .desc = { ent-Gyroscope.desc }
    .suffix = DEBUG
