--- Task 4 ---
-- Здесь мы используем функции FIRST_VALUE и LAST_VALUE
-- FIRST_VALUE(start_date) OVER (… ORDER BY start_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) даёт
-- первое значение даты во всём окне,
-- а LAST_VALUE(start_date) OVER (… ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) — последнее
SELECT
  task_id,
  project_id,
  start_date,
  FIRST_VALUE(start_date) OVER (
    PARTITION BY project_id
    ORDER BY start_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS first_start_date,
  LAST_VALUE(start_date) OVER (
    PARTITION BY project_id
    ORDER BY start_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
  ) AS last_start_date
FROM project_tasks
ORDER BY project_id, start_date;
-- p.s. это задание можно также сделать через MIN/MAX(start_date) OVER (PARTITION BY project_id) AS first/last_start_date

--- Данные для теста
INSERT INTO project_tasks (task_id, project_id, start_date) VALUES
  (1, 581, '2023-05-19'),
  (2, 581, '2010-12-12'),
  (3, 581, '2025-06-16'),
  (4, 623, '2005-29-11'),
  (5, 623, '2025-06-10'),
  (6, 623, '2017-11-11');