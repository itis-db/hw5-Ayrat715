--- Task 3 ---
-- Здесь мы берем функцию AVG(...) OVER (...)
-- и указываем границы окна ROWS BETWEEN 2 PRECEDING AND CURRENT ROW (текущая + 2 предыдушие строки),
-- а ORDER BY log_time задаёт хронологический порядок записей
SELECT
  log_time,
  temperature,
  AVG(temperature) OVER (
    ORDER BY log_time
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS moving_avg
FROM temperature_logs
ORDER BY log_time;
-- p.s. В первых двух строках будет учитываться меньше записей, так как "истории" ещё недостаточно

--- Данные для теста
INSERT INTO temperature_logs (log_time, temperature) VALUES
  ('2025-06-14 08:00:00'::timestamp, 18),
  ('2025-06-14 03:00:00'::timestamp, 14),
  ('2025-06-14 19:00:00'::timestamp, 22),
  ('2025-06-15 08:00:00'::timestamp, 20),
  ('2025-06-15 03:00:00'::timestamp, 15);