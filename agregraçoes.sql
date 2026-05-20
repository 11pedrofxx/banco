CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto VARCHAR(100),
    categoria VARCHAR(100),
    vendedor VARCHAR(100),
    quantidade INT,
    preco DECIMAL(10,2),
    valor_venda DECIMAL(10,2),
    data_venda DATE
);

INSERT INTO vendas 
(produto, categoria, vendedor, quantidade, preco, valor_venda, data_venda)
VALUES
('Notebook Dell', 'Informática', 'Carlos', 2, 3500.00, 7000.00, '2026-01-10'),
('Mouse Gamer', 'Informática', 'Ana', 5, 150.00, 750.00, '2026-01-11'),
('Teclado Mecânico', 'Informática', 'Carlos', 3, 300.00, 900.00, '2026-01-12'),
('Cadeira Office', 'Móveis', 'Bruno', 1, 1200.00, 1200.00, '2026-01-13'),
('Mesa Escritório', 'Móveis', 'Ana', 2, 800.00, 1600.00, '2026-01-14'),
('Monitor LG', 'Informática', 'Carlos', 4, 900.00, 3600.00, '2026-01-15'),
('Celular Samsung', 'Eletrônicos', 'Bruno', 2, 2500.00, 5000.00, '2026-01-16'),
('Fone Bluetooth', 'Eletrônicos', 'Ana', 6, 200.00, 1200.00, '2026-01-17'),
('Impressora HP', 'Informática', 'Carlos', 1, 700.00, 700.00, '2026-01-18'),
('Smart TV', 'Eletrônicos', 'Bruno', 1, 4000.00, 4000.00, '2026-01-19'),
('Notebook Lenovo', 'Informática', 'Ana', 1, 3200.00, 3200.00, '2026-01-20'),
('Webcam HD', 'Informática', 'Carlos', 8, 180.00, 1440.00, '2026-01-21'),
('Armário', 'Móveis', 'Bruno', 1, 1500.00, 1500.00, '2026-01-22'),
('Tablet Samsung', 'Eletrônicos', 'Ana', 2, 1800.00, 3600.00, '2026-01-23'),
('SSD 1TB', 'Informática', 'Carlos', 5, 450.00, 2250.00, '2026-01-24');


-- 1. Soma total dos valores vendidos

select sum(valor_venda) from vendas as valores;

-- 2. Média de valor dos produtos
select avg(preco) as valor_produtos from vendas;

-- 3. Maior valor de venda

select max(valor_venda) from vendas;

-- 4. Menor valor de venda

select min(valor_venda) from vendas;

-- 5. Quantidade de registros

select count(id) as registros from vendas;

-- 6. Quantidade total de produtos vendidos

select sum(quantidade) from vendas;

-- 7. Média de quantidade vendida

select avg(quantidade) from vendas;

-- 8. Total vendido por vendedor

select vendedor, sum(valor_venda) as vendas
from vendas
group by vendedor;

-- 9. Quantidade de vendas por vendedor

SELECT vendedor, COUNT(*) AS quantidade_vendas
FROM vendas
GROUP BY vendedor;

-- 10. Maior valor vendido por vendedor

select vendedor, max(valor_venda) as maior_valor
from vendas
group by vendedor;


-- 11. Menor valor por categoria

select categoria, min(preco) as menor_valor from vendas
group by categoria;

-- 12. Média de preços por categoria

select categoria, avg(preco) as media_preco_categoria
from vendas
group by categoria;

-- 13. Total de produtos vendidos por categoria.

select categoria, sum(quantidade) as produtos_vendidos_p_categoria from vendas 
group by categoria;

-- 14. Quantidade de produtos diferentes

select produto, count(distinct quantidade) as produtos_diferentes
from vendas
group by produto;

-- 15. Total arrecadado em Informática

select categoria, round(sum(valor_venda)) as arrecadado_em_info from vendas
where categoria = ('Informática');

-- 16. Total vendido maior que 3000

select produto, valor_venda from vendas
where valor_venda > 3000;


-- 17. Média de vendas por vendedor

select vendedor, round(avg(valor_venda)) as media_venda_pvendedor from vendas
group by vendedor;


-- 18. Soma das quantidades por vendedor

select vendedor, round(sum(quantidade)) as quant_por_vendedor from vendas
group by vendedor;

-- 19. Categoria com maior total de vendas

select categoria, max(valor_venda) as maior_valor
from vendas
group by categoria;


-- 20. Vendedor com maior número de vendas

select vendedor, max(quantidade) as vendedor_vendas
from vendas
group by vendedor
limit 1;