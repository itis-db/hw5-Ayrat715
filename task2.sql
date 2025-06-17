--- Task 2 ---
-- Классически используем оконную функцию AVG(...) OVER (PARTITION BY ...)
-- AVG(price) OVER (PARTITION BY category) считает среднюю цену внутри каждой категории,
-- а price - AVG(...) вычисляет отклонение от средней: если > 0, то продукт дороже среднего, если < 0 — дешевле
SELECT
  id,
  category,
  price,
  price - AVG(price) OVER (PARTITION BY category) AS price_deviation
FROM products;
-- p.s. Можно также округлить результат до определенного кол-ва знаков ROUND(..., 2)

--- Данные для теста
INSERT INTO products (id, category, price) VALUES
  (1, 'A', 40),
  (2, 'A', 65),
  (3, 'B', 50),
  (4, 'B', 55),
  (5, 'B', 60),
  (6, 'C', 70);