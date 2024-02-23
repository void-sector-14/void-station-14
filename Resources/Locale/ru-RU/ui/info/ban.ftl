# ban
cmd-ban-desc = Банит кого-либо
cmd-ban-help = Использование: ban <name or user ID> <reason> [продолжительность в минутах, без указания или 0 для пермабана]
cmd-ban-player = Не удалось найти игрока с таким именем.
cmd-ban-invalid-minutes = ${ minutes } is not a valid amount of minutes!
cmd-ban-invalid-severity = ${ severity } is not a valid severity!
cmd-ban-invalid-arguments = Invalid amount of arguments
cmd-ban-hint = <name/user ID>
cmd-ban-hint-reason = <reason>
cmd-ban-hint-severity = [severity]
cmd-ban-hint-duration = [продолжительность]

cmd-ban-hint-duration-1 = Навсегда
cmd-ban-hint-duration-2 = 1 день
cmd-ban-hint-duration-3 = 3 дня
cmd-ban-hint-duration-4 = 1 неделя
cmd-ban-hint-duration-5 = 2 недели
cmd-ban-hint-duration-6 = 1 месяц

# ban panel
cmd-banpanel-desc = Открывает панель банов
cmd-banpanel-help = Использование: banpanel [имя или пользовательский guid]
cmd-banpanel-server = Это не может быть использовано из консоли сервера
cmd-banpanel-player-err = Указанный игрок не найден

# listbans
cmd-banlist-desc = Список активных банов пользователя.
cmd-banlist-help = Использование: banlist <name or user ID>
cmd-banlist-empty = Нет активных банов у пользователя { $user }
cmd-banlistF-hint = <name/user ID>

cmd-ban_exemption_update-desc = Установить исключение на типы банов игрока.
cmd-ban_exemption_update-help =
    Использование: ban_exemption_update <player> <flag> [<flag> [...]]
    Укажите несколько флагов, чтобы дать игроку исключение из нескольких типов банов.
    Чтобы удалить все исключения, выполните эту команду и укажите единственным флагом "None".

cmd-ban_exemption_update-nargs = Ожидалось хотя бы 2 аргумента
cmd-ban_exemption_update-locate = Не удалось найти игрока '{ $player }'.
cmd-ban_exemption_update-invalid-flag = Недопустимый флаг '{ $flag }'.
cmd-ban_exemption_update-success = Обновлены флаги исключений банов для '{ $player }' ({ $uid }).
cmd-ban_exemption_update-arg-player = <player>
cmd-ban_exemption_update-arg-flag = <flag>

cmd-ban_exemption_get-desc = Показать исключения банов для определённого игрока.
cmd-ban_exemption_get-help = Использование: ban_exemption_get <player>

cmd-ban_exemption_get-nargs = Ожидался ровно 1 аргумент
cmd-ban_exemption_get-none = Пользователь не имеет исключений от банов.
cmd-ban_exemption_get-show = Пользователь исключён из банов со следующими флагами: { $flags }.
cmd-ban_exemption_get-arg-player = <player>

# Ban panel
ban-panel-title = Панель бана
ban-panel-player = Игрок
ban-panel-ip = IP
ban-panel-hwid = HWID
ban-panel-reason = Причина
ban-panel-last-conn = Использовать IP и HWID из последнегго присоединения?
ban-panel-submit = Забанить
ban-panel-confirm = Вы уверены?
ban-panel-tabs-basic = Информация о бане
ban-panel-tabs-reason = Причина
ban-panel-tabs-players = Список Игроков
ban-panel-tabs-role = Информация блокировки роли
ban-panel-no-data = Для блокировки вы должны указать пользователя, IP или HWID.создал полную блокировку
ban-panel-invalid-ip = IP-адрес не удалось проанализировать. Пожалуйста, попробуйте еще раз.
ban-panel-select = Выберите тип
ban-panel-server = Полная блокировка
ban-panel-role = Блокировка роли
ban-panel-minutes = Минуты
ban-panel-hours = Часы
ban-panel-days = Дни
ban-panel-weeks = Недели
ban-panel-months = Месяца
ban-panel-years = Года
ban-panel-permanent = Перманентно
ban-panel-ip-hwid-tooltip = Оставьте пустым и установите флажок ниже, чтобы использовать данные последнего подключения.
ban-panel-severity = Критерий:

# Ban string
server-ban-string = { $admin } создал полную блокировку игрока по критерию { $severity } со сроком действия { $expires } для [{ $name }, { $ip }, { $hwid }] по причине: { $reason }
server-ban-string-never = никогда
server-ban-string-no-pii = { $admin } создал полную блокировку игрока по критерию { $severity } со сроком действия { $expires } для { $name } по причине: { $reason }
