ent-GasTankBase = { ent-BaseItem }
    .desc = { ent-BaseItem.desc }
    .suffix = { "" }

ent-GasTankRoundBase = { ent-GasTankBase }
    .desc = { ent-GasTankBase.desc }
    .suffix = { "" }

ent-OxygenTank = кислородный баллон
    .desc = Стандартный цилиндрический газовый баллон для кислорода.
    .suffix = { "" }

ent-NitrogenTank = азотный баллон
    .desc = Стандартный цилиндрический газовый баллон для азота.
    .suffix = { "" }

ent-EmergencyOxygenTank = аварийный кислородный баллон
    .desc = Лёгкий переносной баллон для чрезвычайных ситуаций. Содержит очень мало кислорода, предназначен только для выживания.
    .suffix = { "" }

ent-EmergencyNitrogenTank = аварийный азотный баллон
    .desc = Используется в чрезвычайных ситуациях. Содержит очень мало азота, поэтому постарайтесь сохранить его до тех пор, пока он вам действительно не понадобится.
    .suffix = { ent-NitrogenTank.suffix }

ent-ExtendedEmergencyOxygenTank = аварийный кислородный баллон повышенной ёмкости
    .desc = Аварийный баллон повышенной ёмкости. Технически рассчитан на длительное использование.
    .suffix = { "" }

ent-ExtendedEmergencyNitrogenTank = аварийный азотный баллон повышенной ёмкости
    .desc = Используется в чрезвычайных ситуациях. Содержит мало азотный, поэтому постарайтесь сохранить его до тех пор, пока он вам действительно не понадобится.
    .suffix = { ent-EmergencyNitrogenTank.suffix }

ent-DoubleEmergencyOxygenTank = двойной аварийный кислородный баллон
    .desc = Высококлассный двухбаллонный резервуар аварийного жизнеобеспечения. Вмещает приличное для своих небольших размеров количество кислорода.
    .suffix = { "" }

ent-DoubleEmergencyNitrogenTank = двойной аварийный азотный баллон
    .desc = { ent-ExtendedEmergencyNitrogenTank.desc }
    .suffix = { ent-ExtendedEmergencyNitrogenTank.suffix }

ent-EmergencyFunnyOxygenTank = весёлый аварийный кислородный баллон
    .desc = Лёгкий переносной баллон для чрезвычайных ситуаций. Содержит очень мало кислорода и чуточку веселящего газа, предназначен только для выживания.
    .suffix = { "" }

ent-AirTank = баллон воздуха
    .desc = Какая-то смесь?
    .suffix = { "" }

ent-NitrousOxideTank = баллон оксида азота
    .desc = Содержит смесь воздуха и оксида азота. Убедитесь, что вы не заправляете его чистым N2O.
    .suffix = { "" }

ent-PlasmaTank = баллон плазмы
    .desc = Содержит опасную плазму. Не вдыхать. Чрезвычайно огнеопасен.
    .suffix = { "" }
