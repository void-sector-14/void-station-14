ent-BaseVehicle = { "" }
    .desc = { "" }
    .suffix = { "" }

ent-BaseVehicleRideable = Транспорт
    .desc = { ent-BaseVehicle.desc }
    .suffix = { ent-BaseVehicle.suffix }

ent-VehicleJanicart = уборочная машина
    .desc = Верный скакун уборщика.
    .suffix = { ent-BaseVehicleRideable.suffix }

ent-VehicleJanicartDestroyed = уничтоженная уборочная машина
    .desc = { ent-MachineFrameDestroyed.desc }
    .suffix = { "" }

ent-VehicleSecway = секвей
    .desc = Будущее перемещения. Популяризирован святым Иаковом, покровителем сотрудников службы безопасности и модераторов интернет-форумов.
    .suffix = { ent-BaseVehicleRideable.suffix }

ent-VehicleATV = квадроцикл
    .desc = Все-клеточное транспортное средство.
    .suffix = { ent-BaseVehicleRideable.suffix }

ent-VehicleSyndicateSegway = сегвей синдиката
    .desc = Будьте врагом корпорации на стиле.
    .suffix = { ent-BaseVehicleRideable.suffix }

ent-VehicleSkeletonMotorcycle = скелетонский мотоцикл
    .desc = Плохой до мозга костей.
    .suffix = { ent-BaseVehicleRideable.suffix }

ent-VehicleUnicycle = уницикл
    .desc = У него всего одно колесо!
    .suffix = { ent-BaseVehicleRideable.suffix }

ent-VehicleUnicycleFolded = { ent-VehicleUnicycle }
    .desc = { ent-VehicleUnicycle.desc }
    .suffix = Сложенный

ent-VehicleWheelchair = кресло-коляска
    .desc = Кресло с большими колесами. Похоже, что на нём вы можете передвигаться самостоятельно.
    .suffix = { ent-BaseVehicleRideable.suffix }

ent-VehicleWheelchairFolded = { ent-VehicleWheelchair }
    .desc = { ent-VehicleWheelchair.desc }
    .suffix = Сложенный
