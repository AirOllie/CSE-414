DROP TABLE IF EXISTS Frumble;
DROP TABLE IF EXISTS namePrice;
DROP TABLE IF EXISTS discountMonth;
DROP TABLE IF EXISTS nameMonth;
-- Part 4(a)
CREATE TABLE Frumble (
    name VARCHAR(256),
    discount VARCHAR(256),
    month VARCHAR(256),
    price INT
);
.separator "\t"
.import -skip 1 mrFrumbleData.txt Frumble

-- Part 4(b)
SELECT * FROM Frumble AS A, Frumble AS B
WHERE A.name = B.name AND A.price != B.price;
-- name -> price

SELECT * FROM Frumble AS A, Frumble AS B
WHERE A.name = B.name AND A.month != B.month;
-- name -x> month (functional dependency does not exist)

SELECT * FROM Frumble AS A, Frumble AS B
WHERE A.name = B.name AND A.discount != B.discount;
-- name -X> discount (functional dependency does not exist)

SELECT * FROM Frumble AS A, Frumble AS B
WHERE A.month = B.month AND A.discount != B.discount;
-- month -> discount

SELECT * FROM Frumble AS A, Frumble AS B
WHERE A.name = B.name AND A.discount = B.discount
AND A.month != B.month AND A.price != B.price;
-- name, discount -> month, price

SELECT * FROM Frumble AS A, Frumble AS B
WHERE A.month = B.month AND A.price = B.price
AND A.name != B.name AND A.discount != B.discount;
-- month, price -> name, discount

-- Part 4(c)
/*
Notation: N: name, D: discount, M: month, P: price
R(N, D, M, P) with functional dependencies: N -> P, M -> D, ND -> MP, MP -> ND
Starting with N:
N+ = {NP}
R1 = {NP}
R2 = {NDM}
We need to continue decomposing R2:
R3 = {DM}
R4 = {NM}
The final decomposition is R1, R3 and R4, i.e. {name, price} key is name, 
{discount, month} key is month, {name, month} key is name, month
*/

CREATE TABLE namePrice (
    name VARCHAR(256) PRIMARY KEY,
    price INT
);

CREATE TABLE discountMonth (
    month VARCHAR(256) PRIMARY KEY,
    discount VARCHAR(256)
);

CREATE TABLE nameMonth (
    name VARCHAR(256),
    month VARCHAR(256),
    PRIMARY KEY (name, month),
    FOREIGN KEY (name) REFERENCES namePrice(name),
    FOREIGN KEY (month) REFERENCES discountMonth(month)
);

-- Part 4(d)
INSERT INTO namePrice
SELECT DISTINCT name, price FROM Frumble;
-- 36 rows

INSERT INTO discountMonth
SELECT DISTINCT month, discount FROM Frumble;
-- 12 rows

INSERT INTO nameMonth
SELECT DISTINCT name, month FROM Frumble;
-- 426 rows