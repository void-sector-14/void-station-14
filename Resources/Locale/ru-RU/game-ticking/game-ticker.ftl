game-ticker-restart-round = Перезапуск раунда...
game-ticker-start-round = Раунд начинается...
game-ticker-start-round-cannot-start-game-mode-fallback = Не удалось запустить режим { $failedGameMode }! Запускаем { $fallbackMode }...
game-ticker-start-round-cannot-start-game-mode-restart = Не удалось запустить режим { $failedGameMode }! Перезапуск раунда...
game-ticker-start-round-invalid-map = Выбранная карта { $map } не подходит для игрового режима { $mode }. Игровой режим может не функционировать как задумано...
game-ticker-unknown-role = Неизвестный
game-ticker-delay-start = Начало раунда было отложено на { $seconds } секунд.
game-ticker-pause-start = Начало раунда было приостановлено.
game-ticker-pause-start-resumed = Отсчет начала раунда возобновлен.
game-ticker-player-join-game-message = Добро пожаловать на Void Sector! Если вы играете впервые, обязательно нажмите ESC на клавиатуре и прочитайте правила игры, а также не бойтесь просить помощи в "Админ помощь".
game-ticker-get-info-text =
    Привет и добро пожаловать на проект [color=white]Void Sector![/color]
    Текущий раунд: [color=white]#{ $roundId }[/color]
    Текущее количество игроков: [color=white]{ $playerCount }[/color]
    Текущая карта: [color=white]{ $mapName }[/color]
    Текущий режим игры: [color=white]{ $gmTitle }[/color]
    >[color=yellow]{ $desc }[/color]
game-ticker-get-info-preround-text =
    Привет и добро пожаловать на проект [color=white]Void Sector![/color]
    Текущий раунд: [color=white]#{ $roundId }[/color]
    Текущее количество игроков: [color=white]{ $playerCount }[/color] ([color=white]{ $readyCount }[/color] { $readyCount ->
        [one] готов
       *[other] готовы
    })
    Текущая карта: [color=white]{ $mapName }[/color]
    Текущий режим игры: [color=white]{ $gmTitle }[/color]
    >[color=yellow]{ $desc }[/color]
game-ticker-no-map-selected = [color=red]Карта не выбрана![/color]
game-ticker-player-no-jobs-available-when-joining = При попытке присоединиться к игре ни одной роли не было доступно.
# Displayed in chat to admins when a player joins
player-join-message = Игрок { $name } подключился.
player-first-join-message = Игрок { $name } зашёл на сервер впервые!
# Displayed in chat to admins when a player leaves
player-leave-message = Игрок { $name } отключился.
latejoin-arrival-announcement =
    { $character } ({ $job }) { $gender ->
        [male] прибыл
        [female] прибыла
        [epicene] прибыли
       *[neuter] прибыл
    } на станцию!
latejoin-arrival-announcement-special = { $job } { $character } на борту!
latejoin-arrival-sender = Станции
latejoin-arrivals-direction = Вскоре прибудет шаттл, который доставит вас на станцию.
latejoin-arrivals-direction-time = Шаттл, который доставит вас на станцию, прибудет через { $time }.
latejoin-arrivals-dumped-from-shuttle = Таинственная сила не дает вам улететь на транзитном шаттле.
latejoin-arrivals-teleport-to-spawn = Таинственная сила телепортирует вас из шаттла прибытия. Удачной смены!
preset-not-enough-ready-players = Невозможно начать { $presetName }. Готово { $readyPlayersCount } из { $minimumPlayers }.
preset-no-one-ready = Невозможно начать { $presetName }. Ни один игрок не готов.
game-run-level-PreRoundLobby = Лобби
game-run-level-InRound = Раунд
game-run-level-PostRound = Постраунд
