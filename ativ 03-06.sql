
create database gustavo;
use gustavo;
CREATE TABLE PEDIDOS (
    id_pedido INT PRIMARY KEY,
    cliente VARCHAR(100),
    livro VARCHAR(100),
    genero VARCHAR(50),
    preco DECIMAL(10, 2),
    quantidade INT,
    cidade VARCHAR(50),
    data_pedido DATE
);

INSERT INTO PEDIDOS (id_pedido, cliente, livro, genero, preco, quantidade, cidade, data_pedido)
VALUES

(1, 'Carlos Silva', 'O Senhor dos Anéis', 'Fantasia', 75.00, 2, 'São Paulo', '2026-03-06'),
(2, 'Carlos Silva', 'O Hobbit', 'Fantasia', 55.00, 4, 'São Paulo', '2026-03-07'), 
(3, 'Ana Souza', 'Duna', 'Ficção Científica', 90.00, 1, 'Rio de Janeiro', '2026-03-05'),
(4, 'Ana Souza', 'Neuromancer', 'Ficção Científica', 45.00, 2, 'Rio de Janeiro', '2026-03-10'),
(5, 'Bruno Lima', 'Crônicas de Nárnia', 'Fantasia', 80.00, 3, 'São Paulo', '2026-03-08'),
(6, 'Bruno Lima', 'Harry Potter', 'Fantasia', 65.00, 4, 'São Paulo', '2026-03-12'),
(7, 'Mariana Costa', 'Corte de Espinhos', 'Fantasia', 49.90, 1, 'Belo Horizonte', '2026-02-20'),
(8, 'Mariana Costa', 'Fundação', 'Ficção Científica', 70.00, 1, 'Belo Horizonte', '2026-03-01'),
(9, 'Roberto Alves', '1984', 'Distopia', 35.00, 3, 'Curitiba', '2026-03-11'), 
(10, 'Juliana Reis', 'Admirável Mundo Novo', 'Distopia', 42.00, 1, 'São Paulo', '2026-03-15'),
(11, 'Carlos Silva', 'Fahrenheit 451', 'Distopia', 50.00, 2, 'São Paulo', '2026-03-18');


-- 1. Listar os livros com preço entre R$ 50 e R$ 80. -- Utilize BETWEEN

select * from pedidos
where preco between 50 and 80 ;

-- 2. Mostrar todos os pedidos realizados na cidade de São Paulo. -- Utilize WHERE

select * from pedidos
where cidade = 'São Paulo';

-- 3. Exibir os livros do gênero Fantasia com preço superior a R$ 60. -- Utilize WHERE e AND

select * from pedidos where preco >60 and genero = 'Fantasia';


-- 4. Mostrar os pedidos realizados entre os dias 05/03/2026 e 12/03/2026. -- Utilize BETWEEN para datas

select * from pedidos
where data_pedido between '2026/03/05' and '2026/03/12';

-- 5. Listar os clientes que compraram mais de 2 livros em um único pedido. -- Utilize WHERE

select * from pedidos 
where quantidade > 2;

-- 6. Exibir a quantidade total de livros vendidos por cliente. -- Utilize GROUP BY e SUM

select cliente, sum(quantidade) from pedidos
group by cliente;

-- 7. Mostrar apenas os clientes que compraram mais de 5 livros no total. -- Utilize GROUP BY e HAVING

select cliente, sum(quantidade) as compra_maior5 from pedidos
group by cliente
having (compra_maior5) > 5;

-- 8. Calcular a média de preço dos livros por gênero. -- Utilize GROUP BY e AVG

select genero, round(avg(preco),2) as media from pedidos 
group by genero;

-- 9. Mostrar apenas os gêneros cuja média de preço seja maior que R$ 60. -- Utilize GROUP BY e HAVING

select genero, round(avg(preco),2) as media from pedidos 
group by genero
having (media) > 60;


-- 10. Exibir o faturamento total por cidade. -- Utilize SUM(QUANTIDADE * PRECO)

select cidade, sum(quantidade * preco) as faturamento from pedidos
group by cidade;

-- 11. Mostrar apenas as cidades cujo faturamento ultrapasse R$ 500. -- Utilize GROUP BY e HAVING

select cidade, sum(quantidade * preco)  as faturamento from pedidos
group by cidade
having faturamento >= 500;

-- 12. Contar quantos pedidos foram realizados por gênero. -- Utilize COUNT e GROUP BY

select genero, count(id_pedido) as pedidos from pedidos
group by genero;
	
-- 13. Mostrar apenas os gêneros com mais de 3 pedidos registrados. -- Utilize HAVING

select genero, count(id_pedido) as pedidos from pedidos
group by genero
having pedidos > 3;

-- 14. Exibir o maior preço de livro de cada gênero. -- Utilize MAX e GROUP BY

select genero, max(preco) from pedidos
group by genero;

-- 15. Mostrar os clientes cujo gasto total esteja entre R$ 400 e R$ 600. -- Utilize SUM, GROUP BY e HAVING com BETWEEN

select cliente, sum(preco * quantidade) as gasto_total from pedidos
group by cliente
having (gasto_total) between 400 and 600;

-- Desafio Extra (16). Exibir: Cliente, Quantidade total comprada, Valor total gasto. Mostrando apenas clientes que 
-- compraram mais de 5 livros, gastaram mais de R$ 450. Ordene do maior gasto para o menor.
 
SELECT cliente,  SUM(quantidade * preco) AS valor_total_gasto, SUM(quantidade) AS quantidade_total_comprada FROM pedidos
GROUP BY cliente
HAVING SUM(quantidade * preco) > 450 AND SUM(quantidade) > 5
ORDER BY valor_total_gasto DESC;
 