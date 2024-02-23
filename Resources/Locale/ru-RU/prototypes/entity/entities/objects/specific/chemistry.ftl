ent-BaseBeaker = { ent-BaseItem }
    .desc = { ent-BaseItem.desc }
    .suffix = { ent-BaseItem.suffix }

ent-BaseBeakerMetallic = { ent-BaseItem }
    .desc = { ent-BaseItem.desc }
    .suffix = { ent-BaseItem.suffix }

ent-Beaker = мензурка
    .desc = Используется для хранения среднего количества химикатов и растворов.
    .suffix = { ent-BaseBeaker.suffix }

ent-CryoxadoneBeakerSmall = мензурка криоксадона
    .desc = Наполнена реагентом, используемым в криогенных капсулах.
    .suffix = { ent-Beaker.suffix }

ent-LargeBeaker = большая мензурка
    .desc = Используется для хранения большого количества химикатов и растворов.
    .suffix = { ent-BaseBeaker.suffix }

ent-CryostasisBeaker = криостазисная мензурка
    .desc = Используется для хранения химикатов и растворов без протекания реакции.
    .suffix = { ent-BaseBeakerMetallic.suffix }

ent-BluespaceBeaker = блюспейс мензурка
    .desc = Работает на экспериментальной блюспейс технологии.
    .suffix = { ent-BaseBeakerMetallic.suffix }

ent-Dropper = пипетка
    .desc = Используется для перемещения небольших объемов реагентов между ёмкостями.
    .suffix = { ent-BaseItem.suffix }

ent-BorgDropper = боргпетка
    .desc = Используется для перемещения небольших объемов реагентов между ёмкостями. Исключительно для использования медицинскими боргами.
    .suffix = { "" }

ent-BaseSyringe = шприц
    .desc = Используется для забора образцов крови у существ, или для введения им реагентов.
    .suffix = { ent-BaseItem.suffix }

ent-Syringe = { ent-BaseSyringe }
    .desc = { ent-BaseSyringe.desc }
    .suffix = { ent-BaseSyringe.suffix }

ent-SyringeBluespace = блюспейс-шприц
    .desc = Инъекции с использованием передовой блюспейс-технологии.
    .suffix = { ent-BaseSyringe.suffix }

ent-Pill = таблетка
    .desc = Это не свеча.
    .suffix = { ent-BaseItem.suffix }

ent-PillCanister = баночка для таблеток
    .desc = Вмещает до 9 таблеток.
    .suffix = { ent-BaseStorageItem.suffix }
