reagent-effect-condition-guidebook-total-damage =
    { $max ->
        [2147483648] имеется больше чем { NATURALFIXED($min, 2) } общих повреждений
       *[other]
            { $min ->
                [0] имеется меньше чем { NATURALFIXED($max, 2) } общих повреждений
               *[other] имеется между { NATURALFIXED($min, 2) } и { NATURALFIXED($max, 2) } общих повреждений
            }
    }
reagent-effect-condition-guidebook-total-hunger =
    { $max ->
        [2147483648] the target has at least { NATURALFIXED($min, 2) } total hunger
       *[other]
            { $min ->
                [0] the target has at most { NATURALFIXED($max, 2) } total hunger
               *[other] the target has between { NATURALFIXED($min, 2) } and { NATURALFIXED($max, 2) } total hunger
            }
    }
reagent-effect-condition-guidebook-reagent-threshold =
    { $max ->
        [2147483648] больше чем { NATURALFIXED($min, 2) } ед. { $reagent }
       *[other]
            { $min ->
                [0] меньше чем { NATURALFIXED($max, 2) } ед. { $reagent }
               *[other] между { NATURALFIXED($min, 2) } ед. и { NATURALFIXED($max, 2) } ед. { $reagent }
            }
    }
reagent-effect-condition-guidebook-mob-state-condition = состояние существа { $state }
reagent-effect-condition-guidebook-solution-temperature =
    температура раствора { $max ->
        [2147483648] выше { NATURALFIXED($min, 2) }К
       *[other]
            { $min ->
                [0] ниже { NATURALFIXED($max, 2) }К
               *[other] между { NATURALFIXED($min, 2) }К и { NATURALFIXED($max, 2) }К
            }
    }
reagent-effect-condition-guidebook-body-temperature =
    температура тела { $max ->
        [2147483648] выше { NATURALFIXED($min, 2) }К
       *[other]
            { $min ->
                [0] ниже { NATURALFIXED($max, 2) }К
               *[other] между { NATURALFIXED($min, 2) }К и { NATURALFIXED($max, 2) }К
            }
    }
reagent-effect-condition-guidebook-organ-type =
    метаболизирующий орган { $shouldhave ->
        [true] является
       *[false] не является
    } органом { $name }
reagent-effect-condition-guidebook-has-tag =
    цель { $invert ->
        [true] не имеет
       *[false] имеет
    } тэга { $tag }
reagent-effect-condition-guidebook-this-reagent = this reagent
