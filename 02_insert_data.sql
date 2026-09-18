-- Sunrise Supermarket - PL/SQL Assignment One
-- File: 02_insert_data.sql

-- 6 customers; Grace has no orders so Q3 demonstrates LEFT JOIN correctly.
INSERT INTO customers VALUES (1, 'Alice Uwase', 'alice.uwase@email.com', 'Kigali');
INSERT INTO customers VALUES (2, 'Brian Niyonzima', 'brian.n@email.com', 'Musanze');
INSERT INTO customers VALUES (3, 'Claudine Mukamana', 'claudine.m@email.com', 'Huye');
INSERT INTO customers VALUES (4, 'David Habimana', 'david.h@email.com', 'Rubavu');
INSERT INTO customers VALUES (5, 'Eric Tuyisenge', 'eric.t@email.com', 'Kigali');
INSERT INTO customers VALUES (6, 'Grace Ingabire', 'grace.i@email.com', 'Muhanga');

-- 10 products across 4 categories.
INSERT INTO products VALUES (101, 'Premium Rice 5kg', 'Groceries', 8500.00);
INSERT INTO products VALUES (102, 'Cooking Oil 2L', 'Groceries', 6500.00);
INSERT INTO products VALUES (103, 'Sugar 2kg', 'Groceries', 3000.00);
INSERT INTO products VALUES (104, 'Milk 1L', 'Dairy', 1500.00);
INSERT INTO products VALUES (105, 'Yoghurt 500ml', 'Dairy', 2200.00);
INSERT INTO products VALUES (106, 'Laundry Soap', 'Household', 1800.00);
INSERT INTO products VALUES (107, 'Dishwashing Liquid', 'Household', 3500.00);
INSERT INTO products VALUES (108, 'Mineral Water 1.5L', 'Beverages', 1000.00);
INSERT INTO products VALUES (109, 'Orange Juice 1L', 'Beverages', 2800.00);
INSERT INTO products VALUES (110, 'Coffee 250g', 'Beverages', 4500.00);

-- 18 orders distributed across several dates.
INSERT INTO orders VALUES (1001, 1, DATE '2026-08-01');
INSERT INTO orders VALUES (1002, 2, DATE '2026-08-02');
INSERT INTO orders VALUES (1003, 1, DATE '2026-08-05');
INSERT INTO orders VALUES (1004, 3, DATE '2026-08-06');
INSERT INTO orders VALUES (1005, 4, DATE '2026-08-08');
INSERT INTO orders VALUES (1006, 5, DATE '2026-08-10');
INSERT INTO orders VALUES (1007, 2, DATE '2026-08-12');
INSERT INTO orders VALUES (1008, 3, DATE '2026-08-15');
INSERT INTO orders VALUES (1009, 1, DATE '2026-08-18');
INSERT INTO orders VALUES (1010, 4, DATE '2026-08-20');
INSERT INTO orders VALUES (1011, 5, DATE '2026-08-22');
INSERT INTO orders VALUES (1012, 2, DATE '2026-08-25');
INSERT INTO orders VALUES (1013, 3, DATE '2026-08-27');
INSERT INTO orders VALUES (1014, 4, DATE '2026-08-29');
INSERT INTO orders VALUES (1015, 5, DATE '2026-09-01');
INSERT INTO orders VALUES (1016, 1, DATE '2026-09-03');
INSERT INTO orders VALUES (1017, 2, DATE '2026-09-05');
INSERT INTO orders VALUES (1018, 4, DATE '2026-09-07');

-- 36 order items.
INSERT INTO order_items VALUES (1, 1001, 101, 2);
INSERT INTO order_items VALUES (2, 1001, 104, 4);
INSERT INTO order_items VALUES (3, 1002, 102, 2);
INSERT INTO order_items VALUES (4, 1002, 108, 6);
INSERT INTO order_items VALUES (5, 1003, 110, 2);
INSERT INTO order_items VALUES (6, 1003, 105, 3);
INSERT INTO order_items VALUES (7, 1004, 101, 1);
INSERT INTO order_items VALUES (8, 1004, 103, 4);
INSERT INTO order_items VALUES (9, 1005, 107, 2);
INSERT INTO order_items VALUES (10, 1005, 106, 5);
INSERT INTO order_items VALUES (11, 1006, 109, 3);
INSERT INTO order_items VALUES (12, 1006, 104, 5);
INSERT INTO order_items VALUES (13, 1007, 101, 3);
INSERT INTO order_items VALUES (14, 1007, 102, 1);
INSERT INTO order_items VALUES (15, 1008, 110, 1);
INSERT INTO order_items VALUES (16, 1008, 109, 2);
INSERT INTO order_items VALUES (17, 1009, 101, 2);
INSERT INTO order_items VALUES (18, 1009, 107, 3);
INSERT INTO order_items VALUES (19, 1010, 102, 3);
INSERT INTO order_items VALUES (20, 1010, 103, 5);
INSERT INTO order_items VALUES (21, 1011, 105, 4);
INSERT INTO order_items VALUES (22, 1011, 108, 8);
INSERT INTO order_items VALUES (23, 1012, 110, 2);
INSERT INTO order_items VALUES (24, 1012, 106, 4);
INSERT INTO order_items VALUES (25, 1013, 101, 2);
INSERT INTO order_items VALUES (26, 1013, 109, 3);
INSERT INTO order_items VALUES (27, 1014, 107, 3);
INSERT INTO order_items VALUES (28, 1014, 104, 6);
INSERT INTO order_items VALUES (29, 1015, 102, 2);
INSERT INTO order_items VALUES (30, 1015, 105, 5);
INSERT INTO order_items VALUES (31, 1016, 101, 4);
INSERT INTO order_items VALUES (32, 1016, 110, 1);
INSERT INTO order_items VALUES (33, 1017, 103, 6);
INSERT INTO order_items VALUES (34, 1017, 108, 10);
INSERT INTO order_items VALUES (35, 1018, 106, 6);
INSERT INTO order_items VALUES (36, 1018, 109, 4);

COMMIT;
