ent-GasTankBase = { ent-BaseItem }
    .desc = { ent-BaseItem.desc }
    .suffix = { ent-BaseItem.suffix }

ent-GasTankRoundBase = { ent-GasTankBase }
    .desc = { "" }
    .suffix = { "" }

ent-OxygenTank = кислородный баллон
    .desc = Стандартный цилиндрический газовый баллон для кислорода.
    .suffix = { ent-GasTankBase.suffix }

ent-YellowOxygenTank = кислородный баллон
    .desc = Стандартный цилиндрический газовый баллон для кислорода. Жёлтый.
    .suffix = { ent-OxygenTank.suffix }

ent-NitrogenTank = азотный баллон
    .desc = Стандартный цилиндрический газовый баллон для азота.
    .suffix = { ent-GasTankBase.suffix }

ent-EmergencyOxygenTank = аварийный кислородный баллон
    .desc = Легкий переносной баллон для чрезвычайных ситуаций. Содержит очень мало кислорода, предназначен только для выживания.
    .suffix = { ent-GasTankBase.suffix }

ent-ExtendedEmergencyOxygenTank = аварийный кислородный баллон повышенной ёмкости
    .desc = Аварийный баллон повышенной ёмкости. Технически рассчитан на длительное использование.
    .suffix = { ent-EmergencyOxygenTank.suffix }

ent-DoubleEmergencyOxygenTank = двойной аварийный кислородный баллон
    .desc = Высококлассный двухбаллонный резервуар аварийного жизнеобеспечения. Вмещает приличное для своих небольших размеров количество кислорода.
    .suffix = { ent-ExtendedEmergencyOxygenTank.suffix }

ent-AirTank = баллон воздуха
    .desc = Какая-то смесь?
    .suffix = { ent-GasTankBase.suffix }

ent-NitrousOxideTank = баллон оксида азота
    .desc = Содержит смесь воздуха и оксида азота. Убедитесь, что вы не заправляете его чистым N2O.
    .suffix = { ent-GasTankBase.suffix }

ent-PlasmaTank = баллон плазмы
    .desc = Содержит опасную плазму. Не вдыхать. Чрезвычайно огнеопасен.
    .suffix = { ent-GasTankBase.suffix }
