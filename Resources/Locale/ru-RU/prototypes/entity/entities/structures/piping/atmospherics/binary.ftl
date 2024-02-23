ent-GasBinaryBase = { ent-GasPipeBase }
    .desc = { ent-GasPipeBase.desc }
    .suffix = { ent-GasPipeBase.suffix }

ent-GasPressurePump = газовый насос
    .desc = Насос, перемещающий газ под определенным давлением.
    .suffix = { ent-GasBinaryBase.suffix }

ent-GasVolumePump = объёмный газовый насос
    .desc = Насос, перемещающий газ с определенным объёмом.
    .suffix = { ent-GasBinaryBase.suffix }

ent-GasPassiveGate = пассивный клапан
    .desc = Односторонний воздушный клапан, не требующий питания.
    .suffix = { ent-GasBinaryBase.suffix }

ent-GasValve = ручной клапан
    .desc = Труба с клапаном, которым можно перекрыть поток проходящего по ней газа.
    .suffix = { ent-GasBinaryBase.suffix }

ent-SignalControlledValve = сигнальный клапан
    .desc = Труба с клапаном, который можно контролировать при помощи сигналов.
    .suffix = { ent-GasBinaryBase.suffix }

ent-GasPort = соединительный порт
    .desc = Для подключения портативных устройств, связанных с управлением атмосферой.
    .suffix = { ent-GasBinaryBase.suffix }

ent-GasDualPortVentPump = двухпортовая вентиляция
    .desc = Имеет клапан и прикрепленный к нему насос. Один вход для закачивания воздуха, другой - для откачивания.
    .suffix = { ent-GasVentPump.suffix }

ent-GasRecycler = переработчик газа
    .desc = Перерабатывает углекислый газ и оксид азота. Нагреватель и компрессор в комплект не входят.
    .suffix = { ent-BaseMachine.suffix }

ent-HeatExchanger = радиатор
    .desc = Переносит тепло между трубой и окружающей средой.
    .suffix = { ent-GasBinaryBase.suffix }
