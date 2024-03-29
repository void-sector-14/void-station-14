# Вспомогательный инструментарий локализации

Данный инструментарий поможет облегчить локализацию **Space Station 14**.

Инструментарий разработан проектом **"Станция Чешуйка"** за авторством [Voomra](https://github.com/DmitriyMX).

## Требования

- Bash-like среда окружения (Linux shell, [GitBash](https://git-scm.com/downloads) или [WSL](https://learn.microsoft.com/ru-ru/windows/wsl/))
- Установленный [NodeJS](https://nodejs.org)
- Запуск всех инструментов производится из корня проекта **Space Station 14**.

## Предварительная сборка

Сборку необходимо выполнить один раз.

```shell
bash Czeshuika.Tools/entities_localization.sh build
```

## Описание инструментов

### remove-utf8-bom.sh

Удаляет метку UTF-8 BOM из прототипов (`*.yml`). Она мешает инструментам локализации.  
Рекомендуется запускать инструмент сразу после загрузки "апстрима".

- [Что такое BOM символы и как с ними бороться](https://help.reg.ru/support/hosting/sayt-ne-rabotayet/chto-takoye-bom-simvoly-i-kak-s-nimi-borotsya)

Запуск:

```shell
bash Czeshuika.Tools/remove-utf8-bom.sh
```

### alerts_localization.sh

Определает дельту между EN и RU локализациями для **alert** прототипов.

Запуск:

```shell
bash Czeshuika.Tools/alerts_localization.sh --prototypes=Resources/Prototypes --ftl=Resources/Locale/ru-RU/prototypes/alerts --save=Resources/Locale/ru-RU/prototypes/alerts_new
```

Результат:

- в папке `Resources/Locale/ru-RU/prototypes/alerts_new` будет находиться обновлённые файлы локализации;
- иерархия и сортировка будет такой же, как и у прототипов.

### construction_graphnodes_localization.sh

Определает дельту между EN и RU локализациями для "узлов" чертежей/рецептов.

Запуск:

```shell
bash Czeshuika.Tools/construction_graphnodes_localization.sh --prototypes=Resources/Prototypes --ftl=Resources/Locale/ru-RU/prototypes/construction_graph.ftl
```

### constructions_localization.sh

Определает дельту между EN и RU локализациями для прототипов чертежей/рецептов.

Запуск:

```shell
bash Czeshuika.Tools/constructions_localization.sh --prototypes=Resources/Prototypes --ftl=Resources/Locale/ru-RU/prototypes/construction --save=Resources/Locale/ru-RU/prototypes/construction_new
```

Результат:

- в папке `Resources/Locale/ru-RU/prototypes/construction_new` будет находиться обновлённые файлы локализации;
- иерархия и сортировка будет такой же, как и у прототипов.

### entities_localization.sh

Определает дельту между EN и RU локализациями для прототипов сущностей.

Запуск:

```shell
bash Czeshuika.Tools/entities_localization.sh --prototypes=Resources/Prototypes --ftl=Resources/Locale/ru-RU/prototypes/entity --save=Resources/Locale/ru-RU/prototypes/entity_new
```

- в папке `Resources/Locale/ru-RU/prototypes/entity_new` будет находиться обновлённые файлы локализации;
- иерархия и сортировка будет такой же, как и у прототипов.
