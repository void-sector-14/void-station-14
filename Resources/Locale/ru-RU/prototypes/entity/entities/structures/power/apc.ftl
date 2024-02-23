ent-BaseAPC = ЛКП
    .desc = Локальный Контроллер Питания. Терминал управления электрическими системами.
    .suffix = { "" }

ent-APCFrame = каркас ЛКП
    .desc = Локальный Контроллер Питания. Терминал управления электрическими системами, без электроники.
    .suffix = { "" }

ent-APCConstructed = { ent-BaseAPC }
    .desc = { ent-BaseAPC.desc }
    .suffix = Открыт

ent-APCBasic = { ent-BaseAPC }
    .desc = { ent-BaseAPC.desc }
    .suffix = Базовый, 50кВт

ent-APCHighCapacity = { ent-BaseAPC }
    .desc = { ent-BaseAPC.desc }
    .suffix = Высокая ёмкость, 100кВт

ent-APCSuperCapacity = { ent-BaseAPC }
    .desc = { ent-BaseAPC.desc }
    .suffix = Супер ёмкость, 150кВт

ent-APCHyperCapacity = { ent-BaseAPC }
    .desc = { ent-BaseAPC.desc }
    .suffix = Гипер ёмкость, 200кВт
