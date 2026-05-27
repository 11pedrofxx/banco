create database dueto;
use dueto;

CREATE TABLE vendas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    produto VARCHAR(50),
    categoria VARCHAR(50),
    vendedor VARCHAR(50),
    quantidade INT,
    preco DECIMAL(10,2),
    cidade VARCHAR(50),
    data_venda DATE
);


INSERT INTO vendas (produto, categoria, vendedor, quantidade, preco, cidade, data_venda) 
VALUES
('Notebook', 'Informática', 'Carlos', 2, 3500.00, 'São Paulo', '2026-01-10'),
('Mouse', 'Informática', 'Ana', 10, 80.00, 'Campinas', '2026-01-12'),
('Teclado', 'Informática', 'Carlos', 5, 150.00, 'São Paulo', '2026-01-15'),
('Celular', 'Eletrônicos', 'Marcos', 3, 2200.00, 'Rio de Janeiro', '2026-01-20'),
('TV', 'Eletrônicos', 'Ana', 1, 4500.00, 'Campinas', '2026-01-22'),
('Geladeira', 'Eletrodomésticos', 'Julia', 2, 3200.00, 'Curitiba', '2026-01-25'),
('Fogão', 'Eletrodomésticos', 'Carlos', 1, 1800.00, 'São Paulo', '2026-01-28'),
('Notebook', 'Informática', 'Julia', 1, 3700.00, 'Curitiba', '2026-02-01'),
('Mouse', 'Informática', 'Marcos', 8, 90.00, 'Rio de Janeiro', '2026-02-03'),
('TV', 'Eletrônicos', 'Carlos', 2, 4700.00, 'São Paulo', '2026-02-05'),
('Celular', 'Eletrônicos', 'Ana', 4, 2100.00, 'Campinas', '2026-02-08'),
('Teclado', 'Informática', 'Julia', 6, 140.00, 'Curitiba', '2026-02-10'),
('Fogão', 'Eletrodomésticos', 'Marcos', 2, 1900.00, 'Rio de Janeiro', '2026-02-12'),
('Geladeira', 'Eletrodomésticos', 'Ana', 1, 3300.00, 'Campinas', '2026-02-15'),
('Notebook', 'Informática', 'Carlos', 3, 3600.00, 'São Paulo', '2026-02-18');


-- 1. Liste todos os produtos e preços em ordem crescente de preço.

select produto,preco from vendas
order by preco asc;

-- 2. Liste os vendedores em ordem alfabética decrescente.

select * from vendas
order by vendedor desc;

-- 3. Mostre o maior preço cadastrado na tabela.

select max(preco) as maior_preco from vendas;

-- 4. Mostre o menor preço cadastrado.

select min(preco) as menor_preco from vendas;

-- 5. Calcule a média de preços dos produtos.

select round(avg(preco)) as media_produtos from vendas;

-- 6. Mostre a soma total das quantidades vendidas.

select round(sum(quantidade)) as soma_qntd_vendidas from vendas;

-- 7. Conte quantas vendas foram realizadas.

select count(quantidade) from vendas;

-- 8. Liste a quantidade total vendida por vendedor usando GROUP BY.

select vendedor, sum(quantidade) as total_vendido_por_vendedor from vendas
group by vendedor;

-- 9. Mostre o valor médio dos produtos por categoria.

select categoria, round(avg(preco)) as valor_medio_por_categoria from vendas
group by categoria;

-- 10. Liste o maior preço de produto por categoria.

select categoria, max(preco) as maior_preco_categoria from vendas
group by categoria;

-- 11. Mostre quantas vendas cada cidade realizou.

select cidade, count(id) as vendas_por_cidade from vendas
group by cidade;


-- 12. Liste o total arrecadado por vendedor usando:
-- SUM(quantidade * preco)

select vendedor, round(sum(quantidade * preco)) from vendas
group by vendedor;

-- Ordene do maior para o menor valor arrecadado.

select produto, sum(quantidade * preco)  from vendas
group by id
order by preco desc;

-- 13. Mostre a quantidade total vendida de cada produto.

select produto, quantidade from vendas;

-- 14. Liste as categorias e o total de produtos vendidos em cada uma, ordenando da maior para a menor quantidade.

select categoria, SUM(quantidade) as total_vendido from vendas
group by categoria
order by total_vendido desc;

-- 15. Mostre a média de preços dos produtos por cidade e ordene pelo maior valor médio.

select cidade, round(avg(preco)) as media_preco from vendas
group by cidade
order by media_preco desc;
