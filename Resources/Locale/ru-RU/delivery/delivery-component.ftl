delivery-recipient-examine = Это адресовано { $recipient }, { $job }.
delivery-already-opened-examine = Это уже открыто.
delivery-recipient-no-name = Безымянный
delivery-recipient-no-job = Неизвестно
delivery-unlocked-self = Вы разблокировали { $delivery } с помощью отпечатка своего отпечатка пальца.
delivery-opened-self = Вы открываете { $delivery }.
delivery-unlocked-others = { CAPITALIZE($recipient) } разблокирует { $delivery } с помощью { POSS-ADJ($possadj) } отпечатка пальца.
delivery-opened-others = { CAPITALIZE($recipient) } открывает { $delivery }.
delivery-unlock-verb = Разблокировать
delivery-open-verb = Открыть
delivery-slice-verb = Slice open
delivery-teleporter-amount-examine =
    { $amount ->
        [one] Содержит [color=yellow]{ $amount }[/color] посылку.
        [few] Содержит [color=yellow]{ $amount }[/color] посылки.
       *[other] Содержит [color=yellow]{ $amount }[/color] посылок.
    }
delivery-teleporter-empty = { $entity } пустой.
delivery-teleporter-empty-verb = Взять почту
