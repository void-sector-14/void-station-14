defusable-examine-defused = { CAPITALIZE(THE($name)) } [color=lime]обезврежена[/color].
defusable-examine-live = { CAPITALIZE(THE($name)) } [color=red]взведена[/color] и таймер показывает [color=red]{ $time }[/color] секунд.
defusable-examine-live-display-off = { CAPITALIZE(THE($name)) } [color=red]взведена[/color], и таймер похоже, выключен.
defusable-examine-inactive = { CAPITALIZE(THE($name)) } [color=lime]неактивна[/color], но все еще может быть взведена.
defusable-examine-bolts =
    Крепления { $down ->
        [true] [color=red]активны[/color]
       *[false] [color=green]отключены[/color]
    }.
