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

--B�lge bilgisi(region) olmayan musterileri(Customers) raporlayiniz...
select CompanyName, Region from Customers where Region is null

--Kimseye rapor(Reportsto) vermeyen personelimin ad� soyad� ve �nvan�(title) nedir?
select FirstName, LastName, Title, ReportsTo from Employees where ReportsTo is null

select OrderId, OrderDate, ShippedDate from Orders where ShippedDate is null


select Productname, CategoryId, UnitsInStock, UnitPrice from Products where CategoryID = 5 and UnitPrice > 20 and UnitPrice < 300 and UnitsInStock is not null

select CustomerID, EmployeeID, ShipVia, ShipRegion from Orders where (CustomerID='DUMON' or CustomerID='ALFKI') and EmployeeID = 1 and ShipVia = 3 and ShipRegion is null


select Productname from Products where UnitsInStock > 0 and UnitPrice < 10 

-- sadece 3,5,7,4,12,8 idelerini i�ermeyenler gelsin
select * from [Order Details] where ProductID not in(3,5,7,4,12,8)


--���nc� karakteri  a,b,c den bir tanesi olan �r�n isimlerini listeler.


------SIRALAMA ��LEMLER� (ORDER BY)
--Sorgunuz i�erisinden gelen sonu�lar� belirli bir hiyerar�ik s�ralamaya g�re raporlamaniz gerekebilir.
--Bu s�ralama i�lemi i�in kullan�lan anahtar kelime "order by" anahtar kelimesidir...
--B�y�kten k����e s�ralama (Z-A) => DESC (Descending)
--K���kten b�y��e s�ralama (A-Z) => ASC (Ascending)

--Varsay�lan s�ralama y�ntemi k���kten b�y��e s�ralama y�ntemidir.
--Dolay�s�yla sorguya asc yazmasan�z bile sorgunuz s�ral� bir �ekilde gelecektir.

--Personellerimizi A-Z'ye s�ralayal�m...
Select EmployeeID,Firstname + ' ' + LastName as 'AdSoyad' from Employees order by AdSoyad asc

--Personellerimizi Z-A'ye s�ralayal�m
Select EmployeeID,Firstname + ' ' + LastName as 'AdSoyad' from Employees order by AdSoyad desc

--Musterilerin ID'lerini (CustomerID), sirket adlarini (CompanyName), ulkelerini (Country) listeleyiniz.
--Ancak sirket Fransiz sirketi olacak ve CustomerID'lerine gore tersten siralanacak...
Select CustomerID, CompanyName, Country from Customers where Country ='France' order by CustomerID desc

--�r�nlerimizin adlar� ProductName �cretleri UnitPrice stok miktarlar� UnitInStock bu 3 s�tunu g�steriniz
--Stok miktar� 50'den b�y�k olacak ve �r�n �cretine g�re ucuzdan pahal�ya g�re bir s�ralama ger�ekle�ecek
--�lk harfi p olan �r�nler



Select ProductName, UnitPrice, UnitsInStock from Products where UnitsInStock > 50 order by 


