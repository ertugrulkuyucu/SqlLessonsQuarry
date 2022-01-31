


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

--Bölge bilgisi(region) olmayan musterileri(Customers) raporlayiniz...
select CompanyName, Region from Customers where Region is null

--Kimseye rapor(Reportsto) vermeyen personelimin adý soyadý ve ünvaný(title) nedir?
select FirstName, LastName, Title, ReportsTo from Employees where ReportsTo is null

select OrderId, OrderDate, ShippedDate from Orders where ShippedDate is null


select Productname, CategoryId, UnitsInStock, UnitPrice from Products where CategoryID = 5 and UnitPrice > 20 and UnitPrice < 300 and UnitsInStock is not null

select CustomerID, EmployeeID, ShipVia, ShipRegion from Orders where (CustomerID='DUMON' or CustomerID='ALFKI') and EmployeeID = 1 and ShipVia = 3 and ShipRegion is null


select Productname from Products where UnitsInStock > 0 and UnitPrice < 10 

-- sadece 3,5,7,4,12,8 idelerini içermeyenler gelsin
select * from [Order Details] where ProductID not in(3,5,7,4,12,8)


--üçüncü karakteri  a,b,c den bir tanesi olan ürün isimlerini listeler.


------SIRALAMA ÝÞLEMLERÝ (ORDER BY)
--Sorgunuz içerisinden gelen sonuçlarý belirli bir hiyerarþik sýralamaya göre raporlamaniz gerekebilir.
--Bu sýralama iþlemi için kullanýlan anahtar kelime "order by" anahtar kelimesidir...
--Büyükten küçüðe sýralama (Z-A) => DESC (Descending)
--Küçükten büyüðe sýralama (A-Z) => ASC (Ascending)

--Varsayýlan sýralama yöntemi küçükten büyüðe sýralama yöntemidir.
--Dolayýsýyla sorguya asc yazmasanýz bile sorgunuz sýralý bir þekilde gelecektir.

--Personellerimizi A-Z'ye sýralayalým...
Select EmployeeID,Firstname + ' ' + LastName as 'AdSoyad' from Employees order by AdSoyad asc

--Personellerimizi Z-A'ye sýralayalým
Select EmployeeID,Firstname + ' ' + LastName as 'AdSoyad' from Employees order by AdSoyad desc

--Musterilerin ID'lerini (CustomerID), sirket adlarini (CompanyName), ulkelerini (Country) listeleyiniz.
--Ancak sirket Fransiz sirketi olacak ve CustomerID'lerine gore tersten siralanacak...
Select CustomerID, CompanyName, Country from Customers where Country ='France' order by CustomerID desc

--Ürünlerimizin adlarý ProductName Ücretleri UnitPrice stok miktarlarý UnitInStock bu 3 sütunu gösteriniz
--Stok miktarý 50'den büyük olacak ve ürün ücretine göre ucuzdan pahalýya göre bir sýralama gerçekleþecek
--Ýlk harfi p olan ürünler



Select ProductName, UnitPrice, UnitsInStock from Products where UnitsInStock > 50 order by 





Select ProductName, UnitPrice, UnitsInStock from Products where UnitsInStock > 50 order by 




--en fazla kargo ücreti odenen siparis id sini ve odenen miktarýný gösteriniz
select top 1 OrderID, Freight from Orders order by Freight desc 



--en son teslim edilen 5 siparisin detaylarini gosteriniz
select top 5 * from Orders order by ShippedDate desc




--ürünler tablosunda tum elemanlar ürün fiyatý ucuzdan pahalýya stok miktari coktan aza gelecek sekilde sýralayýn
select * from Products order by UnitPrice asc , UnitsInStock desc


--calýsanlar listesi employee tablosundan hangi ülke calýsanlarý oldugunu gosteren listeyi yapýnýz
select distinct Country from employees 

--Umut un yontem
select Country from employees group by Country


--bas harfi c olan stoklarda mevcut 10 ve 250 dolar arasý ücreti olan urunleri fiyatlara göre listeleyiniz
select * from Products where like 'c%' group by UnitPrice asc


--carsamba gunu alýnan kargo ucreti 20 ila 75 arasý olan teslim tarihi null olmayan siparislerin bilgilerini raporlayýnýz ve order order ýd sine göre buyukten kucuge sýralayýnýz,

select * from Orders  where ShippedDate = 'wednesday',


--a harfi ile baslayan musteri
select CompanyName from Customers where LEFT (CompanyName,1) = 'a'


--a ile biten musteri
select CompanyName from Customers where RIGHT (CompanyName,1) = 'a'


--musterilerin icinde ltd gecen 
select CompanyName from Customers where CompanyName Like '%ltd%'


--ilk iki harfi bilinmeyen son uc harfi mon olanlarý listele
select CompanyName from Customers where CompanyName Like '%mon'


--ilk harfi a yada s olanlari listele
select CompanyName from Customers where CompanyName like '[as]%'

 
--ilk harfi a ile k arasýnda olan
select CustomerID from Customers where CustomerID like '[a-k]%'


--custome ýd lerin ilk harfi a ikinci harfi n olmayan musteriler
select CustomerID from Customers where CustomerID like 'a[^n]%'



