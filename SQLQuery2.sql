


--Create database KuzeyRuzgari
--go
--use KuzeyRuzgari
--go
--Create table Personeller
--(
--PersonelID int primary key identity(1,1) not null,
--PersonelAdi nvarchar(50) not null,
--PersonelSoyadi nvarchar(50) not null
--)

--Create table Musteriler
--(
--MusteriID int identity(1,1) primary key not null,
--SirketAdi nvarchar(30) not null,
--Telefonu nvarchar(24) not null
--)
--go
--Create table Siparisler
--(
--SiparisID int identity(1,1) primary key not null,
--SiparisTarihi date not null,
--SiparisiVerenMusteriID int foreign key references Musteriler(MusteriID) not null,
--SiparisiAlanPersonelID int foreign key references Personeller(PersonelID) not null
--)

--Kodla unique ve check consraint nasil olusturulur
--Plaka kolonu unique; YapimYili check constraint [10 yasindan buyuk araclar kayit elilemez!]

--create table Araclar
--(
--	AracID int primary key identity (1,1) not null,
--	Marka nvarchar(40) not null,
--	Plaka nvarchar(10) not null,
--	YapimYili datetime not null,
--	constraint Yapimyili check (datediff(YEAR, YapimYili, getdate())<10),
--	unique (Plaka)
--)

--insert into Araclar values ('Mercedes', '42 ZA 3512', '01.01.2014')

--select * from Araclar


--alter table Araclar
--alter column Marka nvarchar(50) not null


--Alter table Araclar

alter table Araclar
add MotorGucu int null


alter table Araclar
drop column MotorGucu 

select ShipperID, CompanyName from Shippers
select * from Shippers

select * from Employees

select EmployeeID, FirstName + ' ' + LastName as [Ad Soyad] from Employees


Select FirstName + ' ' + LastName as 'Ad Soyad', DATEDIFF(YEAR, BirthDate, getdate()) as 'Yas' from Employees


Select ProductID, productName, UnitsInstock, UnitPrice * 1.18 as 'KDVli Fiyat' from Products

select ProductName, UnitPrice from Products where UnitPrice >= 30

select FirstName + ' ' + LastName as 'AdSoyad', City from Employees where City = 'London'

select ProductName as 'UrunAdi', CategoryID from Products where CategoryID != 5

select FirstName, LastName, HireDate from Employees where HireDate > '01.01.1993'

select OrderID, OrderDate from Orders where DATENAME(MONTH, OrderDate) = 'March'

select ProductID, ProductName, UnitsInStock from Products where UnitsInStock >= 20 and UnitsInStock <= 50

select LEFT(FirstName,1) + '. ' + LastName as 'Ad Soyad', DATEDIFF(YEAR, BirthDate, getdate()) 
as 'Yas', Country from Employees where Country <> 'UK' and DATEDIFF(YEAR, BirthDate, getdate()) > 50

Select OrderID, ShippedDate, OrderDate, Freight, ShipCountry from Orders where YEAR(OrderDate) >= 1997 and Freight > 20 and ShipCountry != 'France'


select OrderId, OrderDate, ShippedDate from Orders where ShippedDate is null

--Musteriye ulasmis olan siparisleri listeleyelim...

select OrderId, OrderDate, ShippedDate from Orders where ShippedDate is not null

--B??lge bilgisi(region) olmayan musterileri(Customers) raporlayiniz...
select CompanyName, Region from Customers where Region is null

--Kimseye rapor(Reportsto) vermeyen personelimin ad?? soyad?? ve ??nvan??(title) nedir?
select FirstName, LastName, Title, ReportsTo from Employees where ReportsTo is null

select OrderId, OrderDate, ShippedDate from Orders where ShippedDate is null


select Productname, CategoryId, UnitsInStock, UnitPrice from Products where CategoryID = 5 and UnitPrice > 20 and UnitPrice < 300 and UnitsInStock is not null

select CustomerID, EmployeeID, ShipVia, ShipRegion from Orders where (CustomerID='DUMON' or CustomerID='ALFKI') and EmployeeID = 1 and ShipVia = 3 and ShipRegion is null


select Productname from Products where UnitsInStock > 0 and UnitPrice < 10 

-- sadece 3,5,7,4,12,8 idelerini i??ermeyenler gelsin
select * from [Order Details] where ProductID not in(3,5,7,4,12,8)


--??????nc?? karakteri  a,b,c den bir tanesi olan ??r??n isimlerini listeler.


------SIRALAMA ????LEMLER?? (ORDER BY)
--Sorgunuz i??erisinden gelen sonu??lar?? belirli bir hiyerar??ik s??ralamaya g??re raporlamaniz gerekebilir.
--Bu s??ralama i??lemi i??in kullan??lan anahtar kelime "order by" anahtar kelimesidir...
--B??y??kten k????????e s??ralama (Z-A) => DESC (Descending)
--K??????kten b??y????e s??ralama (A-Z) => ASC (Ascending)

--Varsay??lan s??ralama y??ntemi k??????kten b??y????e s??ralama y??ntemidir.
--Dolay??s??yla sorguya asc yazmasan??z bile sorgunuz s??ral?? bir ??ekilde gelecektir.

--Personellerimizi A-Z'ye s??ralayal??m...
Select EmployeeID,Firstname + ' ' + LastName as 'AdSoyad' from Employees order by AdSoyad asc

--Personellerimizi Z-A'ye s??ralayal??m
Select EmployeeID,Firstname + ' ' + LastName as 'AdSoyad' from Employees order by AdSoyad desc

--Musterilerin ID'lerini (CustomerID), sirket adlarini (CompanyName), ulkelerini (Country) listeleyiniz.
--Ancak sirket Fransiz sirketi olacak ve CustomerID'lerine gore tersten siralanacak...
Select CustomerID, CompanyName, Country from Customers where Country ='France' order by CustomerID desc

--??r??nlerimizin adlar?? ProductName ??cretleri UnitPrice stok miktarlar?? UnitInStock bu 3 s??tunu g??steriniz
--Stok miktar?? 50'den b??y??k olacak ve ??r??n ??cretine g??re ucuzdan pahal??ya g??re bir s??ralama ger??ekle??ecek
--??lk harfi p olan ??r??nler


Select ProductName, UnitPrice, UnitsInStock from Products where UnitsInStock > 50 order by 


Select ProductName, UnitPrice, UnitsInStock from Products where UnitsInStock > 50 order by 




--en fazla kargo ??creti odenen siparis id sini ve odenen miktar??n?? g??steriniz
select top 1 OrderID, Freight from Orders order by Freight desc 



--en son teslim edilen 5 siparisin detaylarini gosteriniz
select top 5 * from Orders order by ShippedDate desc




--??r??nler tablosunda tum elemanlar ??r??n fiyat?? ucuzdan pahal??ya stok miktari coktan aza gelecek sekilde s??ralay??n
select * from Products order by UnitPrice asc , UnitsInStock desc


--cal??sanlar listesi employee tablosundan hangi ??lke cal??sanlar?? oldugunu gosteren listeyi yap??n??z
select distinct Country from employees 

--Umut un yontem
select Country from employees group by Country


--bas harfi c olan stoklarda mevcut 10 ve 250 dolar aras?? ??creti olan urunleri fiyatlara g??re listeleyiniz
select * from Products where like 'c%' group by UnitPrice asc


--carsamba gunu al??nan kargo ucreti 20 ila 75 aras?? olan teslim tarihi null olmayan siparislerin bilgilerini raporlay??n??z ve order order ??d sine g??re buyukten kucuge s??ralay??n??z,

select * from Orders  where ShippedDate = 'wednesday',


--a harfi ile baslayan musteri
select CompanyName from Customers where LEFT (CompanyName,1) = 'a'


--a ile biten musteri
select CompanyName from Customers where RIGHT (CompanyName,1) = 'a'


--musterilerin icinde ltd gecen 
select CompanyName from Customers where CompanyName Like '%ltd%'


--ilk iki harfi bilinmeyen son uc harfi mon olanlar?? listele
select CompanyName from Customers where CompanyName Like '%mon'


--ilk harfi a yada s olanlari listele
select CompanyName from Customers where CompanyName like '[as]%'

 
--ilk harfi a ile k aras??nda olan
select CustomerID from Customers where CustomerID like '[a-k]%'


--custome ??d lerin ilk harfi a ikinci harfi n olmayan musteriler
select CustomerID from Customers where CustomerID like 'a[^n]%'

--??lkesi ingiltere olmay??p ad?? a ile baslay??p soy ad?? l ile biten 1985 ??ncesi dogumlular??n oncesinin listesi
select * from Employees where Country not like 'england' and Left (FirstName,1) = 'a' and RIGHT (LastName,1) = 'r' 
and BirthDate < '1985'



--------------------------------AGGREGATE FUNCTIONS--------------------------------------------
--COUNT YAPISI

--Stokta bulunan ka?? tane urunumuz vard??r?
select COUNT(ProductID) from Products
where UnitsInStock >0


--1996 y??l??ndan sonra al??nm???? ka?? adet sipari?? vard??r?
select COUNT(OrderDate) from Orders
where YEAR(OrderDate)>1996


--Kac ulkeden m????terimiz bulunmaktad??r?
select COUNT(distinct Country) from Customers
--T-SQL'in anahtar kelimerinden biri olan distinct; sayilan kolon icerisindeki tekrar eden kayitlarin es gecilmesini sa??lar..

select EmployeeID,FirstName,LastName,Country from Employees where YEAR(BirthDate)<1990
and Country !='USA'
and Hiredate between 10 and 80

--fransada ??al????mak ??zere olan kad??n m????teri portf??y??n?? geli??tirmek ??zere psikoloji e??itimi alm???? ileti??im y??n?? kuvvetli 1965 y??l??ndan once do??mu?? personel 


select FirstName,LastName from Employees where Notes like '%psychology%' and  YEAR(BirthDate)<1965 
--SUM YAPISI
-- FONKS??YONA PARAMETRE OLARAK GONDERILEN KOLON ??CER??G??NDEK?? T??M DE??ERLER?? TOPLAYIP S??ZE GER?? D??ND??R??R
--TOPLAYIP S??ZE GER?? D??ND??R??R..


--Her bir ??r??nden bir adet alsam ne kadar ??derim
select SUM(UnitPrice) from Products


--Depoda Ucret Bazl?? olarak toplam nekdarl??k urunum kalm??st??r?
select SUM(UnitPrice*UnitsInStock) from Products


--1997 y??l??nda al??nm???? olan siparislerim icin toplam ne kadarl??k kargo odemesi yapt??k?
select SUM(Freight) from Orders
where YEAR(OrderDate)=1997

--Bu zaman dek odenmis ortalama kargo ??cretimiz nedir (SUM- COUNT)
Select SUM(Freight) / COUNT(OrderID) from Orders


--stogu 15 den kucuk olan 
select COUNT (ProductName) from Products where UnitsInStock < 15


--suana kadar toplam kac dolarl??k ciromuz var ?
select SUM(Quantity * UnitPrice * (1-Discount)) as 'ciro' from [Order Details] 


--her ??r??nde ortalama kac dolarl??k  sat??s yap??l??yor (avg)
select AVG(Quantity * UnitPrice * (1-Discount)) as 'ciro' from [Order Details] 


--??lke bas??na ortalama ne kadar kargo ??creti odenmistir
select Sum(freight) / COUNT(distinct ShipCountry) from Orders


--en fazla kac dolarl??k sat??s yap??ld??(max)
select max (Quantity * UnitPrice *(1-Discount)) from [Order Details]


--en d??s??k sat??s kac dolarl??k (min)
select min (Quantity * UnitPrice *(1-Discount)) from [Order Details]


--5 denn buyuk en dusuk kac dolarl??k sat??s yap??ld??
select min (Quantity * UnitPrice *(1-Discount)) from [Order Details] where  (Quantity * UnitPrice *(1-Discount)) > 5


--yukardaki min in denemesini yapmaya cal??st??m ??imdilik olmad?? :D
select min (Quantity), min (Quantity * UnitPrice *(1-Discount))  as 'result'  from [Order Details]



--bir yada iki nolu kargo firmasi ile tas??nm??s 1996 y??l??nda bir persembe g??n?? al??nm??s siparisler icin odenen maksimum kargo bedeli nedir

select * from [Order Details]

select max(Freight) from Orders
where ShipVia in (1,2) and YEAR(OrderDate) = 1996 and DATENAME(WEEKDAY, OrderDate) = 'Thursday'

