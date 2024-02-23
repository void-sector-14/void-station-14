ent-BaseGenerator = генератор
    .desc = Высокоэффективный термоэлектрический генератор.
    .suffix = { "" }

ent-BaseGeneratorWallmount = настенный генератор
    .desc = Высокоэффективный термоэлектрический генератор, помещенный в настенный шкаф.
    .suffix = { ent-BaseGenerator.suffix }

ent-BaseGeneratorWallmountFrame = каркас настенного генератора
    .desc = Строительный каркас для настенного генератора.
    .suffix = { "" }

ent-GeneratorBasic = { ent-BaseGenerator }
    .desc = { ent-BaseGenerator.desc }
    .suffix = Базовый, 3кВт

ent-GeneratorBasic15kW = { ent-BaseGenerator }
    .desc = { ent-BaseGenerator.desc }
    .suffix = Базовый, 15kW

ent-GeneratorWallmountBasic = { ent-BaseGeneratorWallmount }
    .desc = { ent-BaseGeneratorWallmount.desc }
    .suffix = Базовый, 3кВт

ent-GeneratorWallmountAPU = ВСУ шаттла
    .desc = Вспомогательная силовая установка для шаттла - 6кВт.
    .suffix = ВСУ, 6кВт

ent-GeneratorRTG = РИТЭГ
    .desc = Радиоизотопный термоэлектрический генератор для долговременного питания.
    .suffix = 10кВт

ent-GeneratorRTGDamaged = повреждённый РИТЭГ
    .desc = Радиоизотопный термоэлектрический генератор для долговременного питания. У этого повреждено экранирование.
    .suffix = 10кВт
