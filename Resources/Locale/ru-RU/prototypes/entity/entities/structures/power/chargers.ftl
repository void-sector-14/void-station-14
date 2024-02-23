ent-BaseRecharger = { ent-ConstructibleMachine }
    .desc = { "" }
    .suffix = { "" }

ent-BaseItemRecharger = { ent-BaseRecharger }
    .desc = { "" }
    .suffix = { "" }

ent-PowerCellRecharger = зарядник батарей
    .desc = { ent-ConstructibleMachine.desc }
    .suffix = { ent-ConstructibleMachine.suffix }

ent-WeaponCapacitorRecharger = зарядник энергооружия
    .desc = { ent-PowerCellRecharger.desc }
    .suffix = { ent-PowerCellRecharger.suffix }

ent-WallWeaponCapacitorRecharger = настенный зарядник энергооружия
    .desc = { "" }
    .suffix = { "" }

ent-BorgCharger = станция зарядки киборгов
    .desc = Стационарное устройство для зарядки различных роботов и киборгов. Удивительно вместительное.
    .suffix = { ent-BaseMachinePowered.suffix }
