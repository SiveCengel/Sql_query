--CREATE KOMUTU
CREATE DATABASE YAVUZ  --databse olu�turan komuttur

CREATE TABLE denemetab3 (ID INT NOT NULL, ISIM VARCHAR(50) NOT NULL)
-- tablo olu�turan komut bu komutta ID alan�n� integer �s�m alan�n� varchar
--�eklinde olustursun tabloyada denemetb2 ismini versin ve not null ile
--bo� b�rakmaya izin vermesin �eklinde komut yazarak olu�turduk.
CREATE TABLE denemetab4 (ID INT IDENTITY(1,1) NOT NULL ,ISIM VARCHAR(50) NOT NULL)
-- eger tabloda IS �dentitysini IDENTITY(1,1) �eklinde yazar �sek �dent�ty yes olarak degi�ir

CREATE TABLE denemetab5 (ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY, ISIM VARCHAR(50) NOT NULL)
E�er sonuna primery key yazar isek komut ile primery key olusturlmu� olur.

---DROP KOMUTU
DROP DATABASE Deneme1
-- bu komut  ile Deneme1 databaseni silme i�lemi yap�yoruz

DROP TABLE denemetab --tablosunu silmi� oluyoruz.
--E�er query bo� query olarak a��lm�� ise database ad� ve tablo ad�n� birlikte yaz�yoruz.

--SELECT KOMUTU
--Databasede bulunan verileri istenilen �zellikte �a��rmaya yarayan bir komuttur.

SELECT *
FROM Northwind.dbo.Customers

SELECT CompanyName,ContactName,City,ContactTitle
FROM Northwind.dbo.Customers

---WHERE Komutu Kullan�m�

SELECT CompanyName,ContactName,City,ContactTitle
FROM Northwind.dbo.Customers
WHERE ContactTitle='Owner' 

SELECT 
--WHERE �ARTLARI UYGULAMALAR
-- = bir de�ere e�it oldugunda kullan�l�r

SELECT *
FROM Northwind.dbo.Customers
WHERE City='Paris'


ALTER DATABASE NORTHW�ND MODIFY NAME = Northwind;

-- <>  e�it de�ildir
 SELECT *
 FROM Northwind.dbo.Customers
 WHERE City<> 'Paris'

-- > b�y�kt�r
SELECT *
FROM [Northwind].[dbo].[Products]
WHERE SupplierID > 15
-- < k���kt�r
SELECT *
FROM [Northwind].[dbo].[Products]
WHERE SupplierID < 15
-- >= B�y�k e�it
SELECT *
FROM [Northwind].[dbo].[Products]
WHERE SupplierID >=15
-- <= K���k e�it
SELECT *
FROM [Northwind].[dbo].[Products]
WHERE SupplierID <=15
--BETWEEN aras�ndad�r
SELECT *
FROM [Northwind].[dbo].[Products]
WHERE SupplierID BETWEEN 10 AND 15

 SELECT *
 FROM [Northwind].[dbo].[Orders] 
 WHERE EmployeeID BETWEEN 5 AND 6
--LIKE ile ba�lar ile biter i�erir
 SELECT *
 FROM [Northwind].[dbo].[Orders] 
 WHERE CustomerID LIKE 'AR%'
  SELECT *
 FROM [Northwind].[dbo].[Orders] 
 WHERE CustomerID LIKE '%AR'
  SELECT *
 FROM [Northwind].[dbo].[Orders] 
 WHERE CustomerID LIKE '%AR%'

-- IN ��inde birden fazla alan� g�r�nt�lemek istedi�imizde or kullanmak yerine bu kullan�labilir
   SELECT *
 FROM [Northwind].[dbo].[Orders] 
 WHERE ShipCity IN ('Graz','Lille','London')
 --NOT LIKE ile ba�lamaz ile bitmez i�ermez
  SELECT *
 FROM [Northwind].[dbo].[Orders] 
 WHERE CustomerID NOT LIKE '%AR%'
   SELECT *
 FROM [Northwind].[dbo].[Orders] 
 WHERE ShipCity NOT LIKE 'London'
  --NOT IN i�inde de�ildir bulunmaz.
      SELECT *
 FROM [Northwind].[dbo].[Orders] 
 WHERE ShipCity NOT IN ('Graz','Lille','London')

--INSERT
-- veri giri�iile tabloya kay�t atmaya yarar.
SELECT * 
FROM Northwind.dbo.Categories

INSERT INTO Categories
(CategoryName,Description)
VALUES
('Deneme','XlueOil'),
('SoftIto','ABC')

INSERT INTO Categories
(CategoryName,Description,Picture)
VALUES
('Food','BlueOil','ABC'),
('ABC','Yoil','XSA'),
('Meat','Moil','asad'),
('Suger','Abc','MSK'),
('Food','BlueOil','ABC'),
('ABC','Yoil','XSA')

--UPDATE KOMUTU KULLANIMI
SELECT *
FROM Northwind.dbo.Suppliers
WHERE Country='UK'


UPDATE Northwind.dbo.Suppliers
SET Region='ABCD'
WHERE Country='UK'

UPDATE Northwind.dbo.Suppliers
SET Region='BayerMunih'
WHERE Country='Germany'

UPDATE Northwind.dbo.Suppliers
SET Fax=123456789
WHERE Fax IS NULL

UPDATE Northwind.dbo.Suppliers
SET Fax= NULL
WHERE Fax='123456789'

SELECT *
FROM Northwind.dbo.Suppliers
WHERE Fax IS NULL

--DELETE KOMUTU ile sat�r silme

SELECT * 
FROM Northwind.dbo.Categories

DELETE FROM Northwind.dbo.Categories
WHERE CategoryID=24 OR CategoryID=23
--�rnek komut my SQL
ALTER TABLE `karar-verme`.`tablenames`
AUTO_INCREMENT = 2 ;

--AND ve OR operat�rleri
-- Or ifadesi �ehri hem london hemde paris olanlar� toplayarak getirdi
--Birle�im k�mesi olarak getiriyor
Select *
FROM Northwind.dbo.Suppliers
WHERE City='London' OR City='Paris'
--fakat And operat�r� bir �ehir ayn� anda hem london hemde paris ismini alamayacag�ndan dolay� 
--ifade bo� geliyor dolay�s� ile alttaki komut bo� gelir
Select *
FROM Northwind.dbo.Suppliers
WHERE City='London' AND City='Paris'

-- iki ayr� ifadeyi ayr� ayr� filtrelemek i�in kullanabiliriz
Select *
FROM Northwind.dbo.Suppliers
WHERE Country='UK' AND City='London'

SELECT *
FROM Suppliers
WHERE Country='Germany' AND ContactTitle='Sales Manager'

SELECT *
FROM Suppliers
WHERE Country='Germany' OR ContactTitle='Sales Manager'

SELECT *
FROM Suppliers
WHERE Country='USA' OR ContactTitle LIKE '%Manager%'

SELECT *
FROM Suppliers
WHERE Country='USA' AND ContactTitle LIKE '%Manager%'

--DISTINCT KOMUTU bir tablodaki stundaki verileri tekille�tirip 
--ka� adet veri �e�idi oldu�unu g�sterir. Birden fazla ge�en veriyi tekille�tirir.
SELECT Country
FROM Suppliers

SELECT DISTINCT Country
FROM Suppliers

SELECT DISTINCT City
FROM Suppliers

SELECT DISTINCT ContactTitle
FROM Suppliers

SELECT DISTINCT ProductID
FROM [Northwind].[dbo].[Order Details]

--ORDER BY KOMUTU
--Bu komut belirtilen stune g�re A dan Z ye yada Z den A ya dogru s�ralama yapar.
select *
from Northwind.dbo.Suppliers
--COuntry g�re A dan Z ye varsay�lan olarak s�ralar ASC yazmak ile ayn�d�r
SELECT *
FROM Northwind.dbo.Suppliers
ORDER BY Country 
-- A dan Z ye g�re s�ralar
SELECT *
FROM Northwind.dbo.Suppliers
ORDER BY Country ASC
--- z den A ya g�re s�ralar
SELECT *
FROM Northwind.dbo.Suppliers
ORDER BY Country DESC
-- Where komutu order by komutundan �nce yaz�l�r ilk olarak fransa ve almanya kay�tlar� geldi
-- daha sonra bu kay�tlardan ulkelere gore z den a ya s�ralad� s�ralanm�� kay�tlar i�inde
--ayr�ca country z den a ya gore s�ralad�.

select *
from Northwind.dbo.Suppliers
WHERE Country='France' OR Country='Germany'
ORDER BY Country DESC, City DESC

SELECT *
FROM [Northwind].[dbo].[Orders]
WHERE ShipVia=1 OR ShipVia=2
ORDER by ShipCountry DESC, ShipVia ASC

--TOP komutu kullan�m�
SELECT TOP 10*
FROM Suppliers

SELECT TOP 10
SupplierID,CompanyName
FROM Suppliers
Order by SupplierID ASC
-- 20 ile 30 aras�nda 29 kadar kay�t oldugundan dolay� Toptaki miktar fazla olsa bile 
--bulunan miktar kadar kay�t gosterir.
SELECT TOP 13
SupplierID,CompanyName
FROM Suppliers
WHERE SupplierID BETWEEN 20 AND 30
Order by SupplierID ASC

--AGGREGATE FUNCTIONS (SUM,MIN,MAX,AVG,COUNT)SUM(PRICE) COUNT (ID) MIN (PRICE) MAX (PRICE) AVG (PRICE)

SELECT *
FROM Northwind.dbo.Orders

SELECT SUM(Freight),MIN(Freight),MAX(Freight),COUNT(OrderID),AVG(Freight)
FROM Northwind.dbo.Orders

SELECT SUM(Freight) AS ToplamYuk,
MIN(Freight) As MinumumYuk,
MAX(Freight) As MaxYuk,
COUNT (Freight) AS YukAdeti,
AVG(Freight) AS OrtYukAdeti
FROM Northwind.dbo.Orders

SELECT Freight,ShipCountry
FROM Northwind.dbo.Orders
ORDER BY ShipCountry
-- Where ko�ulu ile sat�r baz�nda istedi�imiz ulkeyi agg fonksiyonlar� sayesinde getirtebiliyoruz.
--Fakat hangi ulke bilgisini bu fonksiyon ile where ko�ulu kulland�g�m�zdan dolay� yan�na
--yaz�dr�am�yoruz bunun i�in group by kullan�m� gerekiyor
SELECT SUM(Freight) AS ToplamFreight,
MIN(Freight) As MinumumYuk,
MAX(Freight) As MaxYuk,
COUNT (Freight) AS YukAdeti,
AVG(Freight) AS OrtYukAdeti
FROM Northwind.dbo.Orders
WHERE ShipCountry='France'

--GROUP BY KULLANIMI
--Sat�rlar� grupland�raak toplam ve say� alma i�lemlerini yapar. Grup baz�nda min max count
--toplam ve ortalama degerlerini where kosulundan farkl� olarak tekil degilde tum
---gruplar i�in getirir.
SELECT *
FROM Northwind.dbo.Orders

SELECT ShipCountry,SUM(Freight) AS ToplamFreight,
MIN(Freight) As MinumumYuk,
MAX(Freight) As MaxYuk,
COUNT (Freight) AS YukAdeti,
AVG(Freight) AS OrtYukAdeti
FROM Northwind.dbo.Orders
Group By ShipCountry

SELECT ShipName,
SUM(Freight) AS ToplamFreight,
MIN(Freight) As MinumumYuk,
MAX(Freight) As MaxYuk,
COUNT (Freight) AS YukAdeti,
AVG(Freight) AS OrtYukAdeti
FROM Northwind.dbo.Orders
Group By ShipName
Order by ToplamFreight desc
--Product tablada �r�nlerin katagori baz�nda toplam tutarlar�n� katagori baz�nda �e�itlerini ve katagori ortalamalar�n� getir 
--daha sonra bunlar� toplam tutar baz�nda s�rala
SELECT CategoryID,
SUm(UnitPrice) As ToplamUrunTutar�,
Count(UnitPrice) As ToplamUrun�e�idi,
AVG(UnitPrice) AS Ortalama�r�nTutar�
FROM [Northwind].[dbo].[Products]
Group By CategoryID
Order By ToplamUrunTutar� DESC

---HAV�NG KULLANIMI
--where filtreleyemedigimiz durumlarda HAV�NG fonksiyonu kullan�l�r.
--bu fonksiyon ile tum tablodaki degerler degilde belli ko�ulu saglayan agg fonk degerleri
--getirtilir

SELECT CategoryID,
SUm(UnitPrice) As ToplamUrunTutar�,
Count(UnitPrice) As ToplamUrun�e�idi,
AVG(UnitPrice) AS Ortalama�r�nTutar�
FROM [Northwind].[dbo].[Products]
Group By CategoryID
HAVING SUM(UnitPrice)>300 AND COUNT(UnitPrice)>10
Order By ToplamUrunTutar� DESC
--Where kosulunda oldugu gibi araya AND yada OR operatorleri konularak i�lem yap�l�r
--Select alan�nda hesaplama gosterilmese bile Having alan�nda hesaplanm�� alanlar dahil edilir
--Ve selenct yap�l�nca gosterilmi� olur yani selecte dahil edip ayn� zamanda having ile filtre edilir.
SELECT CategoryID,
SUm(UnitPrice) As ToplamUrunTutar�,
Count(UnitPrice) As ToplamUrun�e�idi,
AVG(UnitPrice) AS Ortalama�r�nTutar�
FROM [Northwind].[dbo].[Products]
Group By CategoryID
HAVING SUM(UnitPrice)>300 OR COUNT(UnitPrice)>10
Order By ToplamUrunTutar� DESC


SELECT CategoryID,
SUm(UnitPrice) As ToplamUrunTutar�,
Count(UnitPrice) As ToplamUrun�e�idi,
AVG(UnitPrice) AS Ortalama�r�nTutar�,
MAX(UnitPrice) AS MaximumTutar
FROM [Northwind].[dbo].[Products]
Group By CategoryID
HAVING SUM(UnitPrice)>300 OR COUNT(UnitPrice)>100 OR MAX(UnitPrice)>10
Order By ToplamUrunTutar� DESC

--ORder tablosunda hangi shipte ne kadar fright var ve bu frigtlar kac adet yukleme yapm�� 
--buyukten kucuge dogru toplam freigte gore s�ralay�n ilk 10 degeri al�n

SELECT *
FROM Northwind.dbo.Orders

SELECT  TOP 10 ShipName,
SUM(Freight) AS ToplamFreigt, 
COUNT(Freight)AS ToplmFreightSay�s�
FROM Northwind.dbo.Orders
GROUP BY ShipName
ORDER BY ToplamFreigt DESC

SELECT TOP 10 ShipCity,
SUM(Freight) as ToplamFreight,
MIN(Freight) as MinFreight,
MAX(Freight) as MaxFreight,
COUNT(ShipCity) as City
FROM Northwind.dbo.Orders
Group By ShipCity HAVING SUM(Freight)>350
Order By ToplamFreight DESC

SELECT ShipName,Freight,OrderDate,ShipCity,ShipVia
FROM Northwind.dbo.Orders
WHERE ShipName='Save-a-lot Markets'
ORDER BY Freight DESC
--Order by komutunda art�k agg fonksiyonlar�nda hesaplanm�� stun yeni stun olarka al�n�r
-- hesaplanmadan onceki halinin ismi kullan�lmaz.
--Yani Order By freigh yerine --Order by Totalfreight kullan�l�r
SELECT ShipName,
SUM(Freight) AS TotalFreight
FROM Northwind.dbo.Orders
GROUP BY ShipName
ORder BY SUM(Freight) DESC
--yada bu �ekilde yaz�lacak
ORDER BY TotalFreight DESC

-- �rnekten farkl� olarak gemi baz�nda ship vialar� kucukten buyuge gore s�ralayal�m 
--gemilleride alfabatik s�raya gore s�ralayal�m

SELECT ShipName, ShipVia,
COUNT(Freight) AS FreighSay�s�,
SUM(Freight) AS TotalFreight
FROM Northwind.dbo.Orders
GROUP BY ShipVia,ShipName
ORDER BY ShipName ASC

--Eger Gruoup by order by kullan�lmadan yaz�lcak ise alfabetik s�raya gore grupland�rmas�n� istedigimiz
--sona yaz�l�r burada shipname yukar�da goruldugu gibi ikinci s�raya yazd�k
--Yukar�daki yaz�m �eklinde shipname asc yazmaya gerek kalm�yor.

SELECT *
FROM [Northwind].[dbo].[Products]
--Hangi katgoride ka� adet �r�n var ve bu urunler�n bririm fiyat toplam�
-- catagory �d sine gore s�ralay�n bilgi olarak sadece catagory �d toplam ve kac adet unit pr�ce
-- olmas� yeterli

Select CategoryID,
SUM(UnitPrice) AS Toplam, Count(ProductID) �r�nsay�s�
From [Northwind].[dbo].[Products]
Group By CategoryID
Order By Toplam DESC

SELECT CategoryID,COUNT(CategoryID) KategoriSay�s�,SUM(UnitPrice) Toplam
FROM Products
GROUP BY CategoryID
ORDER BY Toplam DESC

--VER� T�PLER�
--TAM SAYI VER� T�PLER�
-- eger tabloda olusturacag�m�z alan tam say� ise bu veri tipini kullan�r�z
--Tiny int, small int,int,big int gibi ihtiyaca yonelik olarak kullanabilirsiniz.
--integer yetecekken big int kullanmak veri taban�n kaplad�g� alan� art�rcakt�r.

--ONDALIK VER� T�PLER�
--Decimal Numeric 5 bytten 17 byte kadar
--Money 8 byte 922337685477,5808
--small moneyde 4 byte 214748,3648
--float 7 basamaga kadar 4 byte 15 basama kadar 8 byte
--Real 4 byte 1848 ile 3438 +-

--MET�N VER� T�PLER�
--CHAR
--NCHAR
--VARCHAR(50)
--NVARCHAR
--TEXT
--NTEXT
--NVARCHAR(MAX)
-- �u tabloya bir alan a�al�m harfli bir ifade olsun ama ad� isim
--lsun ve 40haneye kadar isim izin varsin

--TAR�H SAAT VER� T�PLER�
--date 4 byte
--smalldate 3 byte
--datetime 8 byte
--datetime2 6-8 byte aras�
--datetimeofset 9-10 byte aras�
-- time 5 byte

--D��ER VER� T�PLER�
--image
--binary veri tiplerinin tamam�n� say�sal olarak tutulmas� istendiginde kullan�l�r sbt uzunluklu
--varbinary
--varbinary(max)
--xml veriler i�in

--Soru ulkelere g�re hangi contact titleda kac ki�i �al���yor
--bunu ulkelere g�re ve contact title g�re grupland�ral�m say�s�n� bulal�m.
--buyukten kucuge gore s�ralayal�m ki�i say�s�na gore

SELECT *
FROM [Northwind].[dbo].[Suppliers]

SELECT Country,ContactTitle,COUNT(ContactName) KisiSayisi
FROM [Northwind].[dbo].[Suppliers]
GROUP BY ContactTitle,Country
ORDER BY 3 DESC

SELECT Country, ContactTitle,
COUNT(ContactTitle) AS ContactTitleSay�s�
FROM [Northwind].[dbo].[Suppliers]
GROUP BY ContactTitle,Country
ORDER BY COUNT(ContactTitle) DESC

--RELATION KAVRAMI

SELECT *
fROM SoftITO.dbo.CITIES

SELECT *
fROM SoftITO.dbo.TOWN

DELETE FROM SoftITO.dbo.CITIES
WHERE ID=11  

DELETE FROM SoftITO.dbo.CITIES
WHERE ID=10

DELETE FROM SoftITO.dbo.CITIES
WHERE ID=4

---RELAT�ON KAVRAMI
--�li�ki nas�l kurulur....
--Relation olu�tururken ilk olarak foreign keyin bulundugu tabloya sag click design 
--yap�l�r daha sonra ac�lan sayfadan primary key yapt�g�m�z yerden relation sag click ile secilir
-- daha sonra relation penceresinden add diyerek ili�ki secilir foreign keyden foreign key alan� primary 
--key tablosundan ise �d ve primary key tablo ismi secilir foreign key tablosu zaten otomatik
--secili gelmektedir. biz sadece foreign keydeki foreign id k�sm�n� primary keyin �d ile e�leitirerek 
--ili�kiyi tamamlam�� oluyoruz kaydedip kapat�yoruz.

--Relation tablosunda insert and update specfication k�sm�nda a�a��daki secenekelerde
--No action se�ilirse eger primary keyin bulundugu tabloda bir kay�t silinirse foreign keyin bulundgu tablodaki 
--ili�kili t�m kay�tlar silinir.
--fORein key tablosundan bir kay�t silindiginde primary key tablosundaki kay�tlar silinmez

--Cascalate : primery  keyden bir kay�t silindiginde ili�ikili oldugu di�er kay�tlar�da silmektedir.
--fORein key tablosundan bir kay�t silindiginde primary key tablosundaki kay�tlar silinmez

--Set NULL : Primary keydeki kay�tlar� sildi fakat foreign key tablosundaki ili�kili kay�tlar�daki kay�tlar� silmedi 
--ili�ki kuruldugu CITY �d k�sm�na set null bast�.
--fORein key tablosundan bir kay�t silindiginde primary key tablosundaki kay�tlar silinmez


SELECT *
fROM SoftITO.dbo.CITIES

SELECT *
fROM SoftITO.dbo.TOWN

DELETE FROM SoftITO.dbo.TOWN
WHERE ID=28

DELETE FROM SoftITO.dbo.TOWN
WHERE ID=23

DELETE FROM SoftITO.dbo.TOWN
WHERE ID=20

--TABLOLARI B�RLE�T�RME

SELECT *
FROM SoftITO.dbo.COUNTRIES

SELECT *
FROM SoftITO.dbo.CITIES

SELECT CITIES.*,COUNTRIES.*
FROM SoftITO.dbo.CITIES,SoftITO.dbo.COUNTRIES
WHERE CITIES.COUNTRYID=COUNTRIES.ID

SELECT CITIES.ID,CITIES.CITY,COUNTRIES.COUNTRY
FROM SoftITO.dbo.CITIES,SoftITO.dbo.COUNTRIES
WHERE CITIES.COUNTRYID=COUNTRIES.ID


Select *
FROM [SoftITO].[dbo].[ITEMS]

Select *
FROM [SoftITO].[dbo].[ORDERDETAILS]

SELECT ORDERDETAILS.*,ITEMS.ITEMNAME
FROM [SoftITO].[dbo].[ITEMS],[SoftITO].[dbo].[ORDERDETAILS]
WHERE ITEMS.ID=ORDERDETAILS.ITEMID

SELECT ORDERDETAILS.ORDERID,ORDERDETAILS.ITEMID,ITEMS.ITEMNAME,ORDERDETAILS.AMOUNT,ORDERDETAILS.UNITPRICE,ORDERDETAILS.LINETOTAL
FROM [SoftITO].[dbo].[ITEMS],[SoftITO].[dbo].[ORDERDETAILS]
WHERE ITEMS.ID=ORDERDETAILS.ITEMID

SELECT *
FROM Northwind.dbo.Products
SELECT *
FROM Northwind.dbo.Suppliers
SELECT *
FROM Northwind.dbo.Categories

---Olusturdugumuz tabloda urun kodu tedarikcisi hangi katagor�ye ait oldugu ve  
--ve tutar bilgisi gelsin stoklar�m�zda bu �r�nden kacar adet bulundugu bilgisi 
--tabloda gozuksun. birde bu campany hangi �ehir ve ulkede bilgisi gelsin.

SELECT Products.ProductID,Products.ProductName,Suppliers.CompanyName,Categories.CategoryName,Products.UnitPrice,Products.UnitsInStock,Suppliers.City,Suppliers.Country
FROM Northwind.dbo.Categories,Northwind.dbo.Suppliers,Northwind.dbo.Products
WHERE Products.SupplierID=Suppliers.SupplierID and Products.CategoryID=Categories.CategoryID

SELECT P.ProductID,P.ProductName,UnitPrice,UnitsInStock,S.CompanyName,S.Country,S.City
FROM Products P,Suppliers S,Categories C
WHERE P.CategoryID=C.CategoryID AND P.SupplierID=S.SupplierID


--Bu kodu ulkelere gore s�ral� bicimde getirelim ayn� zamanda c�tylere gore alfabetik s�ralans�n ikinci s�rada 
SELECT P.ProductID,P.ProductName,UnitPrice,UnitsInStock,S.CompanyName,S.Country,S.City
FROM Products P,Suppliers S,Categories C
WHERE P.CategoryID=C.CategoryID AND P.SupplierID=S.SupplierID
ORDER BY Country asc

-- ikinci soru olarak unit pr�ce gore s�ralay�p ilk 20 kayd� getirelim buyukten kucuge

SELECT Top 20 P.ProductID,P.ProductName,UnitPrice,UnitsInStock,S.CompanyName,S.Country,S.City
FROM Products P,Suppliers S,Categories C
WHERE P.CategoryID=C.CategoryID AND P.SupplierID=S.SupplierID
ORDER BY UnitPrice desc

---Unit price 30 ile 50 aras�nda olanlar gelsin unit price gore s�ral� olsun

SELECT P.ProductID,P.ProductName,UnitPrice,UnitsInStock,S.CompanyName,S.Country,S.City
FROM Products P,Suppliers S,Categories C
WHERE P.CategoryID=C.CategoryID AND P.SupplierID=S.SupplierID AND UnitPrice Between 30 and 50
ORDER BY UnitPrice desc

--fakat buyuk kucuk i�aretini and komutu ile kulland�g�m�zda buna gerek yoktur.
select Suppliers.Country,Suppliers.City,Products.ProductID,Suppliers.CompanyName,Categories.CategoryName,Products.UnitPrice,Products.UnitsInStock
from Northwind.dbo.Products,Northwind.dbo.Suppliers,Northwind.dbo.Categories
where Products.SupplierID=Suppliers.SupplierID and Products.CategoryID=Categories.CategoryID AND UnitPrice<50 and UnitPrice>30
order by UnitPrice DESC

--unit�n stok kucuk 15 olanlar ile units �n price 30 dan kuk olanlar� getirelim
SELECT CompanyName,ProductName,ProductID,UnitPrice,CategoryName,Country,City,UnitsInStock
From Northwind.dbo.Products,Northwind.dbo.Categories,Northwind.dbo.Suppliers 
where Products.CategoryID = Categories.CategoryID and Products.SupplierID = Suppliers.SupplierID and UnitPrice<30 and UnitsInStock<15 
ORDER BY UnitPrice desc



