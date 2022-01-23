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



