ent-BaseLogicItem = { ent-BaseItem }
    .desc = { ent-BaseItem.desc }
    .suffix = { ent-BaseItem.suffix }

ent-LogicGate = логический модуль
    .desc = Логический модуль с двумя входами и одним выходом. Инженеры могут изменить его режим используя отвёртку.
    .suffix = { ent-BaseLogicItem.suffix }

ent-EdgeDetector = детектор границ
    .desc = Разделяет нарастающие и спадающие грани на уникальные импульсы и определяет, насколько вы раздражительны.
    .suffix = { ent-BaseLogicItem.suffix }
