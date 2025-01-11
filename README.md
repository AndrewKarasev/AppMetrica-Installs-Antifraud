# AppMetrica Installs Antifraud
 Антифрод для новых установок на базе AppMetrica

> **Решаемая проблема**<br>
> После запуска рекламных in-app кампаний
 
 Код возвращает id настоящих пользователей

## Описание используемых таблиц и полей
|Таблица|Описание|
| --- | --- |
|appmetrica_installs|Выгрузка Logs API /logs/v1/export/installations|
|appmetrica_profiles|Выгрузка Logs API /logs/v1/export/profiles|
|appmetrica_sessions|Выгрузка Logs API /logs/v1/export/sessions_starts|

<br>

|Кастомное поле в таблице appmetrica_profiles|Описание|
| --- | --- |
|device_id|Уточнить как присваивается device_id|
|client_id|Идентификатор авторизованного пользователя из CRM #1|
|gold_id|Идентификатор авторизованного пользователя из CRM #2|

## Описание логики фильтрации корректных установок
