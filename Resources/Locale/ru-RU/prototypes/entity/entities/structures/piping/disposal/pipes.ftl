ent-DisposalPipeBase = { "" }
    .desc = { "" }
    .suffix = { "" }

ent-DisposalHolder = держатель утилизационного блока
    .desc = { "" }
    .suffix = { "" }

ent-DisposalPipeBroken = поврежденная утилизационная труба
    .desc = БПТ (большая повреждённая труба).
    .suffix = { ent-DisposalPipeBase.suffix }

ent-DisposalPipe = участок утилизационной трубы
    .desc = Большой сегмент трубы, используемый при создании системы утилизации.
    .suffix = { ent-DisposalPipeBase.suffix }

ent-DisposalTagger = маркировщик утилизационной трубы
    .desc = Труба, маркирующая объекты для отправки определённому адресату.
    .suffix = { ent-DisposalPipeBase.suffix }

ent-DisposalTrunk = ствол утилизационной трубы
    .desc = Труба, используемая в качестве точки входа в систему утилизации.
    .suffix = { ent-DisposalPipeBase.suffix }

ent-DisposalRouter = маршрутизатор утилизационной трубы
    .desc = Трехсторонний маршрутизатор. Объекты с совпадающими маркерами уходят в сторону с помощью настраиваемых фильтров.
    .suffix = { ent-DisposalPipeBase.suffix }

ent-DisposalRouterFlipped = { ent-DisposalRouter }
    .desc = { ent-DisposalRouter.desc }
    .suffix = Перевёрнутый

ent-DisposalJunction = развязка утилизационной трубы
    .desc = Трехсторонняя развязка. Стрелка указывает на место выхода объектов.
    .suffix = { ent-DisposalPipeBase.suffix }

ent-DisposalJunctionFlipped = { ent-DisposalJunction }
    .desc = { ent-DisposalJunction.desc }
    .suffix = Перевёрнутый

ent-DisposalYJunction = Y-развязка утилизационной трубы
    .desc = Трёхсторонняя развязка с альтернативным местом выхода.
    .suffix = { ent-DisposalPipeBase.suffix }

ent-DisposalBend = изгиб утилизационной трубы
    .desc = Труба, согнутая под прямым углом.
    .suffix = { ent-DisposalPipeBase.suffix }
