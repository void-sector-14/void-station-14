ent-GasUnaryBase = { ent-GasPipeBase }
    .desc = { ent-GasPipeBase.desc }
    .suffix = { ent-GasPipeBase.suffix }

ent-GasVentPump = вентиляция
    .desc = Имеет клапан и прикрепленный к нему насос.
    .suffix = { ent-GasUnaryBase.suffix }

ent-GasPassiveVent = пассивная вентиляция
    .desc = Это открытая вентиляция.
    .suffix = { ent-GasUnaryBase.suffix }

ent-GasVentScrubber = скруббер
    .desc = Он же вытяжка. Имеет клапан и прикрепленный к нему насос.
    .suffix = { ent-GasUnaryBase.suffix }

ent-GasOutletInjector = инжектор
    .desc = Он же форсунка. Имеет клапан и прикрепленный к нему насос.
    .suffix = { ent-GasUnaryBase.suffix }

ent-BaseGasThermoMachine = термомашина
    .desc = Нагревает или охлаждает газ в подсоединенных трубах.
    .suffix = { ent-BaseMachinePowered.suffix }

ent-GasThermoMachineFreezer = охладитель
    .desc = { ent-BaseGasThermoMachine.desc }
    .suffix = { ent-BaseGasThermoMachine.suffix }

ent-GasThermoMachineFreezerEnabled = { ent-GasThermoMachineFreezer }
    .desc = { ent-GasThermoMachineFreezer.desc }
    .suffix = Включено

ent-GasThermoMachineHeater = нагреватель
    .desc = { ent-BaseGasThermoMachine.desc }
    .suffix = { ent-BaseGasThermoMachine.suffix }

ent-GasThermoMachineHeaterEnabled = { ent-GasThermoMachineHeater }
    .desc = { ent-GasThermoMachineHeater.desc }
    .suffix = Включено
