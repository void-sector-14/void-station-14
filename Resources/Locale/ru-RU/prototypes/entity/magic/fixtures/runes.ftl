ent-BaseRune = руна
    .desc = { "" }
    .suffix = { "" }

ent-CollideRune = руна столкновения
    .desc = { ent-BaseRune.desc }
    .suffix = { ent-BaseRune.suffix }

ent-ActivateRune = руна активации
    .desc = { ent-CollideRune.desc }
    .suffix = { ent-CollideRune.suffix }

ent-CollideTimerRune = отложенная руна столкновения
    .desc = { ent-CollideRune.desc }
    .suffix = { ent-CollideRune.suffix }

ent-ExplosionRune = руна взрыва
    .desc = { ent-CollideRune.desc }
    .suffix = { ent-CollideRune.suffix }

ent-StunRune = руна оглушения
    .desc = { ent-CollideRune.desc }
    .suffix = { ent-CollideRune.suffix }

ent-IgniteRune = руна воспламенения
    .desc = { ent-CollideRune.desc }
    .suffix = { ent-CollideRune.suffix }

ent-ExplosionTimedRune = отложенная руна взрыва
    .desc = { ent-CollideTimerRune.desc }
    .suffix = { ent-CollideTimerRune.suffix }

ent-ExplosionActivateRune = руна активации взрыва
    .desc = { ent-ActivateRune.desc }
    .suffix = { ent-ActivateRune.suffix }

ent-FlashRune = руна вспышки
    .desc = { ent-ActivateRune.desc }
    .suffix = { ent-ActivateRune.suffix }

ent-FlashRuneTimer = отложенная руна вспышки
    .desc = { ent-CollideTimerRune.desc }
    .suffix = { ent-CollideTimerRune.suffix }
