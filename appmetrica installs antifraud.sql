SELECT DISTINCT correct_appmetrica_device_id
FROM
(
    SELECT DISTINCT
        appmetrica_profiles.appmetrica_device_id AS correct_appmetrica_device_id,

        nullIf(trimBoth(appmetrica_profiles.device_id),
 '') AS device_id,

        ifNull(sessions.mcc_mnc,
 1) AS mcc_mnc,

        appmetrica_installs.os_name AS os_name,

        appmetrica_profiles.os_name AS profiles_os_name,

        nullIf(trimBoth(appmetrica_profiles.client_id),
 '') AS client_id,

        nullIf(trimBoth(appmetrica_profiles.gold_id),
 '') AS gold_id

    FROM appmetrica_profiles
    INNER JOIN appmetrica_installs ON appmetrica_installs.appmetrica_device_id = appmetrica_profiles.appmetrica_device_id
    LEFT JOIN
    (
        SELECT
            appmetrica_device_id AS event_device_id,
            max(mcc + mnc) AS mcc_mnc
        FROM appmetrica_sessions
        WHERE os_name = 'android'
        GROUP BY 1
    ) AS sessions ON sessions.event_device_id = appmetrica_profiles.appmetrica_device_id
    SETTINGS join_use_nulls = 1
)
WHERE
(client_id IS NOT NULL) OR (gold_id IS NOT NULL)
OR
((device_id IS NOT NULL) AND (mcc_mnc > 0) AND (os_name = profiles_os_name))

