# Loading Screen

replay-loading = Загрузка ({ $cur }/{ $total })
replay-loading-reading = Чтение файлов
replay-loading-processing = Обработка файлов
replay-loading-spawning = Спавн ентити
replay-loading-initializing = Инициализация ентити
replay-loading-starting = Запуск ентити
replay-loading-failed =
    Не удалось загрузить реплей:
    { $reason }
# Main Menu
replay-menu-subtext = Реплей клиент
replay-menu-load = Загрузить выбранный реплей
replay-menu-select = Выбрать реплей
replay-menu-open = Открыть папку реплеев
replay-menu-none = Не найдено реплеев.
# Main Menu Info Box
replay-info-title = Информация реплея
replay-info-none-selected = Реплеи не выбраны
replay-info-invalid = [color=red]Требуется выбранный реплей[/color]
replay-info-info =
    { "[" }color=gray]Selected:[/color]  { $name } ({ $file })
    { "[" }color=gray]Time:[/color]   { $time }
    { "[" }color=gray]Round ID:[/color]   { $roundId }
    { "[" }color=gray]Duration:[/color]   { $duration }
    { "[" }color=gray]ForkId:[/color]   { $forkId }
    { "[" }color=gray]Version:[/color]   { $version }
    { "[" }color=gray]Engine:[/color]   { $engVersion }
    { "[" }color=gray]Type Hash:[/color]   { $hash }
    { "[" }color=gray]Comp Hash:[/color]   { $compHash }
# Replay selection window
replay-menu-select-title = Выбрать реплей
# Replay related verbs
replay-verb-spectate = Наблюдать
# command
cmd-replay-spectate-help = Реплей_наблюдатель [optional entity]
cmd-replay-spectate-desc = Закрепляет или открепляет локального игрока к выбранной uid ентити.
cmd-replay-spectate-hint = Возможный EntityUid
