whitelist-not-whitelisted = Вас нет в белом списке.
# proper handling for having a min/max or not
whitelist-playercount-invalid =
    { $min ->
        [0] Белый список для этого сервера применяется только при количестве игроков меньше { $max }.
       *[other]
            Белый список для этого сервера применяется только при количестве игроков больше { $min } { $max ->
                [2147483647] -> так что, возможно, Вы сможете присоединиться позже.
               *[other] -> и меньше { $max }, так что ,возможно, Вы сможете присоединиться позже.
            }
    }
whitelist-not-whitelisted-rp = Вас нет в белом списке. Чтобы попасть в белый список, посетите наш Discord.
cmd-whitelistadd-desc = Adds the player with the given username to the server whitelist.
cmd-whitelistadd-help = Usage: whitelistadd <username>
cmd-whitelistadd-existing = { $username } is already on the whitelist!
cmd-whitelistadd-added = { $username } added to the whitelist
cmd-whitelistadd-not-found = Unable to find '{ $username }'
cmd-whitelistadd-arg-player = [player]
cmd-whitelistremove-desc = Removes the player with the given username from the server whitelist.
cmd-whitelistremove-help = Usage: whitelistremove <username>
cmd-whitelistremove-existing = { $username } is not on the whitelist!
cmd-whitelistremove-removed = { $username } removed from the whitelist
cmd-whitelistremove-not-found = Unable to find '{ $username }'
cmd-whitelistremove-arg-player = [player]
cmd-kicknonwhitelisted-desc = Kicks all non-whitelisted players from the server.
cmd-kicknonwhitelisted-help = Usage: kicknonwhitelisted
command-whitelistadd-description = Добавить игрока с указанным именем в белый список.
command-whitelistadd-help = whitelistadd <username>
command-whitelistadd-existing = { $username } уже в белом списке!
command-whitelistadd-added = { $username } добавлен в белый список.
command-whitelistadd-not-found = Пользователь '{ $username }' не найден.
command-whitelistremove-description = Удалить игрока с указанным именем из белого списка.
command-whitelistremove-help = whitelistremove <username>
command-whitelistremove-existing = { $username } не в белом списке!
command-whitelistremove-removed = Пользователь { $username } удалён из белого списка.
command-whitelistremove-not-found = Пользователь '{ $username }' не найден.
command-kicknonwhitelisted-description = Кикнуть с сервера всех пользователей не из белого списка.
command-kicknonwhitelisted-help = kicknonwhitelisted
ban-banned-permanent = Этот бан можно только обжаловать.
ban-banned-permanent-appeal = Этот бан можно только обжаловать. Вы можете подать обжалование на { $link }
ban-expires = Вы получили бан на { $duration } минут, и он истечёт { $time } по UTC (для московского времени добавьте 3 часа).
ban-banned-1 = Вам, или другому пользователю этого компьютера или соединения, запрещено здесь играть.
ban-banned-2 = Причина бана: "{ $reason }"
ban-banned-3 = Попытки обойти этот бан через создание новых аккаунтов будут залогированы.
soft-player-cap-full = Сервер заполнен!
panic-bunker-account-denied = Этот сервер находится в режиме панического бункера. В настоящее время новые подключения не принимаются. Попробуйте позже
panic-bunker-account-denied-reason = Этот сервер находится в режиме панического бункера, и Вы были отклонены. Причина: "{ $reason }"
panic-bunker-account-reason-account = Возраст учетной записи должен быть старше { $minutes } минут
panic-bunker-account-reason-overall =
    Необходимо минимальное отыгранное время — { $hours } { $hours ->
        [one] час
        [few] часа
       *[other] часов
    }.
