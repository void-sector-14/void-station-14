ent-SignalTimer = таймер сигнала
    .desc = Это таймер для подачи на устройства сигналов через определенное время.
    .suffix = { "" }

ent-ScreenTimer = таймер сигнала с экраном
    .desc = Это таймер для подачи на устройства сигналов через определенное время, со встроенным экраном.
    .suffix = { ent-SignalTimer.suffix }

ent-BrigTimer = бриг-таймер
    .desc = Это таймер для камер брига.
    .suffix = { ent-ScreenTimer.suffix }

ent-TimerFrame = каркас таймера
    .desc = Каркас для создания таймера.
    .suffix = { "" }
