--CREATE KOMUTU
CREATE DATABASE YAVUZ  --databse oluþturan komuttur

CREATE TABLE denemetab3 (ID INT NOT NULL, ISIM VARCHAR(50) NOT NULL)
-- tablo oluþturan komut bu komutta ID alanýný integer ýsým alanýný varchar
--þeklinde olustursun tabloyada denemetb2 ismini versin ve not null ile
--boþ býrakmaya izin vermesin þeklinde komut yazarak oluþturduk.
CREATE TABLE denemetab4 (ID INT IDENTITY(1,1) NOT NULL ,ISIM VARCHAR(50) NOT NULL)
-- eger tabloda IS ýdentitysini IDENTITY(1,1) þeklinde yazar ýsek ýdentýty yes olarak degiþir

CREATE TABLE denemetab5 (ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY, ISIM VARCHAR(50) NOT NULL)
Eðer sonuna primery key yazar isek komut ile primery key olusturlmuþ olur.

---DROP KOMUTU
DROP DATABASE Deneme1
-- bu komut  ile Deneme1 databaseni silme iþlemi yapýyoruz

DROP TABLE denemetab --tablosunu silmiþ oluyoruz.
--Eðer query boþ query olarak açýlmýþ ise database adý ve tablo adýný birlikte yazýyoruz.

--SELECT KOMUTU
--Databasede bulunan verileri istenilen özellikte çaðýrmaya yarayan bir komuttur.

SELECT *
FROM Northwind.dbo.Customers

SELECT CompanyName,ContactName,City,ContactTitle
FROM Northwind.dbo.Customers

---WHERE Komutu Kullanýmý

SELECT CompanyName,ContactName,City,ContactTitle
FROM Northwind.dbo.Customers
WHERE ContactTitle='Owner' 

SELECT 
--WHERE ÞARTLARI UYGULAMALAR
-- = bir deðere eþit oldugunda kullanýlýr

SELECT *
FROM Northwind.dbo.Customers
WHERE City='Paris'


ALTER DATABASE NORTHWÝND MODIFY NAME = Northwind;

-- <>  eþit deðildir
 SELECT *
 FROM Northwind.dbo.Customers
 WHERE City<> 'Paris'

-- > büyüktür
SELECT *
FROM [Northwind].[dbo].[Products]
WHERE SupplierID > 15
-- < küçüktür
SELECT *
FROM [Northwind].[dbo].[Products]
WHERE SupplierID < 15
-- >= Büyük eþit
SELECT *
FROM [Northwind].[dbo].[Products]
WHERE SupplierID >=15
-- <= Küçük eþit
SELECT *
FROM [Northwind].[dbo].[Products]
WHERE SupplierID <=15
--BETWEEN arasýndadýr
SELECT *
FROM [Northwind].[dbo].[Products]
WHERE SupplierID BETWEEN 10 AND 15

 SELECT *
 FROM [Northwind].[dbo].[Orders] 
 WHERE EmployeeID BETWEEN 5 AND 6
--LIKE ile baþlar ile biter içerir
 SELECT *
 FROM [Northwind].[dbo].[Orders] 
 WHERE CustomerID LIKE 'AR%'
  SELECT *
 FROM [Northwind].[dbo].[Orders] 
 WHERE CustomerID LIKE '%AR'
  SELECT *
 FROM [Northwind].[dbo].[Orders] 
 WHERE CustomerID LIKE '%AR%'

-- IN Ýçinde birden fazla alaný görüntülemek istediðimizde or kullanmak yerine bu kullanýlabilir
   SELECT *
 FROM [Northwind].[dbo].[Orders] 
 WHERE ShipCity IN ('Graz','Lille','London')
 --NOT LIKE ile baþlamaz ile bitmez içermez
  SELECT *
 FROM [Northwind].[dbo].[Orders] 
 WHERE CustomerID NOT LIKE '%AR%'
   SELECT *
 FROM [Northwind].[dbo].[Orders] 
 WHERE ShipCity NOT LIKE 'London'
  --NOT IN içinde deðildir bulunmaz.
      SELECT *
 FROM [Northwind].[dbo].[Orders] 
 WHERE ShipCity NOT IN ('Graz','Lille','London')

--INSERT
-- veri giriþiile tabloya kayýt atmaya yarar.
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

--DELETE KOMUTU ile satýr silme

SELECT * 
FROM Northwind.dbo.Categories

DELETE FROM Northwind.dbo.Categories
WHERE CategoryID=24 OR CategoryID=23
--Örnek komut my SQL
ALTER TABLE `karar-verme`.`tablenames`
AUTO_INCREMENT = 2 ;

--AND ve OR operatörleri
-- Or ifadesi þehri hem london hemde paris olanlarý toplayarak getirdi
--Birleþim kümesi olarak getiriyor
Select *
FROM Northwind.dbo.Suppliers
WHERE City='London' OR City='Paris'
--fakat And operatörü bir þehir ayný anda hem london hemde paris ismini alamayacagýndan dolayý 
--ifade boþ geliyor dolayýsý ile alttaki komut boþ gelir
Select *
FROM Northwind.dbo.Suppliers
WHERE City='London' AND City='Paris'

-- iki ayrý ifadeyi ayrý ayrý filtrelemek için kullanabiliriz
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

--DISTINCT KOMUTU bir tablodaki stundaki verileri tekilleþtirip 
--kaç adet veri çeþidi olduðunu gösterir. Birden fazla geçen veriyi tekilleþtirir.
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
--Bu komut belirtilen stune göre A dan Z ye yada Z den A ya dogru sýralama yapar.
select *
from Northwind.dbo.Suppliers
--COuntry göre A dan Z ye varsayýlan olarak sýralar ASC yazmak ile aynýdýr
SELECT *
FROM Northwind.dbo.Suppliers
ORDER BY Country 
-- A dan Z ye göre sýralar
SELECT *
FROM Northwind.dbo.Suppliers
ORDER BY Country ASC
--- z den A ya göre sýralar
SELECT *
FROM Northwind.dbo.Suppliers
ORDER BY Country DESC
-- Where komutu order by komutundan önce yazýlýr ilk olarak fransa ve almanya kayýtlarý geldi
-- daha sonra bu kayýtlardan ulkelere gore z den a ya sýraladý sýralanmýþ kayýtlar içinde
--ayrýca country z den a ya gore sýraladý.

select *
from Northwind.dbo.Suppliers
WHERE Country='France' OR Country='Germany'
ORDER BY Country DESC, City DESC

SELECT *
FROM [Northwind].[dbo].[Orders]
WHERE ShipVia=1 OR ShipVia=2
ORDER by ShipCountry DESC, ShipVia ASC

--TOP komutu kullanýmý
SELECT TOP 10*
FROM Suppliers

SELECT TOP 10
SupplierID,CompanyName
FROM Suppliers
Order by SupplierID ASC
-- 20 ile 30 arasýnda 29 kadar kayýt oldugundan dolayý Toptaki miktar fazla olsa bile 
--bulunan miktar kadar kayýt gosterir.
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
-- Where koþulu ile satýr bazýnda istediðimiz ulkeyi agg fonksiyonlarý sayesinde getirtebiliyoruz.
--Fakat hangi ulke bilgisini bu fonksiyon ile where koþulu kullandýgýmýzdan dolayý yanýna
--yazýdrýamýyoruz bunun için group by kullanýmý gerekiyor
SELECT SUM(Freight) AS ToplamFreight,
MIN(Freight) As MinumumYuk,
MAX(Freight) As MaxYuk,
COUNT (Freight) AS YukAdeti,
AVG(Freight) AS OrtYukAdeti
FROM Northwind.dbo.Orders
WHERE ShipCountry='France'

--GROUP BY KULLANIMI
--Satýrlarý gruplandýraak toplam ve sayý alma iþlemlerini yapar. Grup bazýnda min max count
--toplam ve ortalama degerlerini where kosulundan farklý olarak tekil degilde tum
---gruplar için getirir.
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
--Product tablada ürünlerin katagori bazýnda toplam tutarlarýný katagori bazýnda çeþitlerini ve katagori ortalamalarýný getir 
--daha sonra bunlarý toplam tutar bazýnda sýrala
SELECT CategoryID,
SUm(UnitPrice) As ToplamUrunTutarý,
Count(UnitPrice) As ToplamUrunÇeþidi,
AVG(UnitPrice) AS OrtalamaÜrünTutarý
FROM [Northwind].[dbo].[Products]
Group By CategoryID
Order By ToplamUrunTutarý DESC

---HAVÝNG KULLANIMI
--where filtreleyemedigimiz durumlarda HAVÝNG fonksiyonu kullanýlýr.
--bu fonksiyon ile tum tablodaki degerler degilde belli koþulu saglayan agg fonk degerleri
--getirtilir

SELECT CategoryID,
SUm(UnitPrice) As ToplamUrunTutarý,
Count(UnitPrice) As ToplamUrunÇeþidi,
AVG(UnitPrice) AS OrtalamaÜrünTutarý
FROM [Northwind].[dbo].[Products]
Group By CategoryID
HAVING SUM(UnitPrice)>300 AND COUNT(UnitPrice)>10
Order By ToplamUrunTutarý DESC
--Where kosulunda oldugu gibi araya AND yada OR operatorleri konularak iþlem yapýlýr
--Select alanýnda hesaplama gosterilmese bile Having alanýnda hesaplanmýþ alanlar dahil edilir
--Ve selenct yapýlýnca gosterilmiþ olur yani selecte dahil edip ayný zamanda having ile filtre edilir.
SELECT CategoryID,
SUm(UnitPrice) As ToplamUrunTutarý,
Count(UnitPrice) As ToplamUrunÇeþidi,
AVG(UnitPrice) AS OrtalamaÜrünTutarý
FROM [Northwind].[dbo].[Products]
Group By CategoryID
HAVING SUM(UnitPrice)>300 OR COUNT(UnitPrice)>10
Order By ToplamUrunTutarý DESC


SELECT CategoryID,
SUm(UnitPrice) As ToplamUrunTutarý,
Count(UnitPrice) As ToplamUrunÇeþidi,
AVG(UnitPrice) AS OrtalamaÜrünTutarý,
MAX(UnitPrice) AS MaximumTutar
FROM [Northwind].[dbo].[Products]
Group By CategoryID
HAVING SUM(UnitPrice)>300 OR COUNT(UnitPrice)>100 OR MAX(UnitPrice)>10
Order By ToplamUrunTutarý DESC

--ORder tablosunda hangi shipte ne kadar fright var ve bu frigtlar kac adet yukleme yapmýþ 
--buyukten kucuge dogru toplam freigte gore sýralayýn ilk 10 degeri alýn

SELECT *
FROM Northwind.dbo.Orders

SELECT  TOP 10 ShipName,
SUM(Freight) AS ToplamFreigt, 
COUNT(Freight)AS ToplmFreightSayýsý
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
--Order by komutunda artýk agg fonksiyonlarýnda hesaplanmýþ stun yeni stun olarka alýnýr
-- hesaplanmadan onceki halinin ismi kullanýlmaz.
--Yani Order By freigh yerine --Order by Totalfreight kullanýlýr
SELECT ShipName,
SUM(Freight) AS TotalFreight
FROM Northwind.dbo.Orders
GROUP BY ShipName
ORder BY SUM(Freight) DESC
--yada bu þekilde yazýlacak
ORDER BY TotalFreight DESC

-- örnekten farklý olarak gemi bazýnda ship vialarý kucukten buyuge gore sýralayalým 
--gemilleride alfabatik sýraya gore sýralayalým

SELECT ShipName, ShipVia,
COUNT(Freight) AS FreighSayýsý,
SUM(Freight) AS TotalFreight
FROM Northwind.dbo.Orders
GROUP BY ShipVia,ShipName
ORDER BY ShipName ASC

--Eger Gruoup by order by kullanýlmadan yazýlcak ise alfabetik sýraya gore gruplandýrmasýný istedigimiz
--sona yazýlýr burada shipname yukarýda goruldugu gibi ikinci sýraya yazdýk
--Yukarýdaki yazým þeklinde shipname asc yazmaya gerek kalmýyor.

SELECT *
FROM [Northwind].[dbo].[Products]
--Hangi katgoride kaç adet ürün var ve bu urunlerýn bririm fiyat toplamý
-- catagory ýd sine gore sýralayýn bilgi olarak sadece catagory ýd toplam ve kac adet unit prýce
-- olmasý yeterli

Select CategoryID,
SUM(UnitPrice) AS Toplam, Count(ProductID) ürünsayýsý
From [Northwind].[dbo].[Products]
Group By CategoryID
Order By Toplam DESC

SELECT CategoryID,COUNT(CategoryID) KategoriSayýsý,SUM(UnitPrice) Toplam
FROM Products
GROUP BY CategoryID
ORDER BY Toplam DESC

--VERÝ TÝPLERÝ
--TAM SAYI VERÝ TÝPLERÝ
-- eger tabloda olusturacagýmýz alan tam sayý ise bu veri tipini kullanýrýz
--Tiny int, small int,int,big int gibi ihtiyaca yonelik olarak kullanabilirsiniz.
--integer yetecekken big int kullanmak veri tabanýn kapladýgý alaný artýrcaktýr.

--ONDALIK VERÝ TÝPLERÝ
--Decimal Numeric 5 bytten 17 byte kadar
--Money 8 byte 922337685477,5808
--small moneyde 4 byte 214748,3648
--float 7 basamaga kadar 4 byte 15 basama kadar 8 byte
--Real 4 byte 1848 ile 3438 +-

--METÝN VERÝ TÝPLERÝ
--CHAR
--NCHAR
--VARCHAR(50)
--NVARCHAR
--TEXT
--NTEXT
--NVARCHAR(MAX)
-- þu tabloya bir alan açalým harfli bir ifade olsun ama adý isim
--lsun ve 40haneye kadar isim izin varsin

--TARÝH SAAT VERÝ TÝPLERÝ
--date 4 byte
--smalldate 3 byte
--datetime 8 byte
--datetime2 6-8 byte arasý
--datetimeofset 9-10 byte arasý
-- time 5 byte

--DÝÐER VERÝ TÝPLERÝ
--image
--binary veri tiplerinin tamamýný sayýsal olarak tutulmasý istendiginde kullanýlýr sbt uzunluklu
--varbinary
--varbinary(max)
--xml veriler için

--Soru ulkelere göre hangi contact titleda kac kiþi çalýþýyor
--bunu ulkelere göre ve contact title göre gruplandýralým sayýsýný bulalým.
--buyukten kucuge gore sýralayalým kiþi sayýsýna gore

SELECT *
FROM [Northwind].[dbo].[Suppliers]

SELECT Country,ContactTitle,COUNT(ContactName) KisiSayisi
FROM [Northwind].[dbo].[Suppliers]
GROUP BY ContactTitle,Country
ORDER BY 3 DESC

SELECT Country, ContactTitle,
COUNT(ContactTitle) AS ContactTitleSayýsý
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

---RELATÝON KAVRAMI
--Ýliþki nasýl kurulur....
--Relation oluþtururken ilk olarak foreign keyin bulundugu tabloya sag click design 
--yapýlýr daha sonra acýlan sayfadan primary key yaptýgýmýz yerden relation sag click ile secilir
-- daha sonra relation penceresinden add diyerek iliþki secilir foreign keyden foreign key alaný primary 
--key tablosundan ise ýd ve primary key tablo ismi secilir foreign key tablosu zaten otomatik
--secili gelmektedir. biz sadece foreign keydeki foreign id kýsmýný primary keyin ýd ile eþleitirerek 
--iliþkiyi tamamlamýþ oluyoruz kaydedip kapatýyoruz.

--Relation tablosunda insert and update specfication kýsmýnda aþaðýdaki secenekelerde
--No action seçilirse eger primary keyin bulundugu tabloda bir kayýt silinirse foreign keyin bulundgu tablodaki 
--iliþkili tüm kayýtlar silinir.
--fORein key tablosundan bir kayýt silindiginde primary key tablosundaki kayýtlar silinmez

--Cascalate : primery  keyden bir kayýt silindiginde iliþikili oldugu diðer kayýtlarýda silmektedir.
--fORein key tablosundan bir kayýt silindiginde primary key tablosundaki kayýtlar silinmez

--Set NULL : Primary keydeki kayýtlarý sildi fakat foreign key tablosundaki iliþkili kayýtlarýdaki kayýtlarý silmedi 
--iliþki kuruldugu CITY ýd kýsmýna set null bastý.
--fORein key tablosundan bir kayýt silindiginde primary key tablosundaki kayýtlar silinmez


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

--TABLOLARI BÝRLEÞTÝRME

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

---Olusturdugumuz tabloda urun kodu tedarikcisi hangi katagorýye ait oldugu ve  
--ve tutar bilgisi gelsin stoklarýmýzda bu üründen kacar adet bulundugu bilgisi 
--tabloda gozuksun. birde bu campany hangi þehir ve ulkede bilgisi gelsin.

SELECT Products.ProductID,Products.ProductName,Suppliers.CompanyName,Categories.CategoryName,Products.UnitPrice,Products.UnitsInStock,Suppliers.City,Suppliers.Country
FROM Northwind.dbo.Categories,Northwind.dbo.Suppliers,Northwind.dbo.Products
WHERE Products.SupplierID=Suppliers.SupplierID and Products.CategoryID=Categories.CategoryID

SELECT P.ProductID,P.ProductName,UnitPrice,UnitsInStock,S.CompanyName,S.Country,S.City
FROM Products P,Suppliers S,Categories C
WHERE P.CategoryID=C.CategoryID AND P.SupplierID=S.SupplierID


--Bu kodu ulkelere gore sýralý bicimde getirelim ayný zamanda cýtylere gore alfabetik sýralansýn ikinci sýrada 
SELECT P.ProductID,P.ProductName,UnitPrice,UnitsInStock,S.CompanyName,S.Country,S.City
FROM Products P,Suppliers S,Categories C
WHERE P.CategoryID=C.CategoryID AND P.SupplierID=S.SupplierID
ORDER BY Country asc

-- ikinci soru olarak unit prýce gore sýralayýp ilk 20 kaydý getirelim buyukten kucuge

SELECT Top 20 P.ProductID,P.ProductName,UnitPrice,UnitsInStock,S.CompanyName,S.Country,S.City
FROM Products P,Suppliers S,Categories C
WHERE P.CategoryID=C.CategoryID AND P.SupplierID=S.SupplierID
ORDER BY UnitPrice desc

---Unit price 30 ile 50 arasýnda olanlar gelsin unit price gore sýralý olsun

SELECT P.ProductID,P.ProductName,UnitPrice,UnitsInStock,S.CompanyName,S.Country,S.City
FROM Products P,Suppliers S,Categories C
WHERE P.CategoryID=C.CategoryID AND P.SupplierID=S.SupplierID AND UnitPrice Between 30 and 50
ORDER BY UnitPrice desc

--fakat buyuk kucuk iþaretini and komutu ile kullandýgýmýzda buna gerek yoktur.
select Suppliers.Country,Suppliers.City,Products.ProductID,Suppliers.CompanyName,Categories.CategoryName,Products.UnitPrice,Products.UnitsInStock
from Northwind.dbo.Products,Northwind.dbo.Suppliers,Northwind.dbo.Categories
where Products.SupplierID=Suppliers.SupplierID and Products.CategoryID=Categories.CategoryID AND UnitPrice<50 and UnitPrice>30
order by UnitPrice DESC

--unitýn stok kucuk 15 olanlar ile units ýn price 30 dan kuk olanlarý getirelim
SELECT CompanyName,ProductName,ProductID,UnitPrice,CategoryName,Country,City,UnitsInStock
From Northwind.dbo.Products,Northwind.dbo.Categories,Northwind.dbo.Suppliers 
where Products.CategoryID = Categories.CategoryID and Products.SupplierID = Suppliers.SupplierID and UnitPrice<30 and UnitsInStock<15 
ORDER BY UnitPrice desc



