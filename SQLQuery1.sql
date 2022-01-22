--create database DenemeDB
--drop database DenemeDB
--Create database ManuelDB
--on primary
--(
--Name = manueldb_data,
--FileName = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\manueldb.mdf',
--Size = 10 MB,
--FileGrowth = 3 MB,
--MaxSize = 60 MB
--)
--Log on 
--(
--Name = manueldb_log,
--FileName = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\manueldb.ldf',
--Size = 8 MB,
--FileGrowth = 10%,
--MaxSize = 60 MB
--)

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


--SELECT 
--DB uzerinde yer alan tablolardaki verilerin secilmesinde ve raporlanmasinda kullanilan anahtar kelimedir...

--Eger sorgularinizdan gelen sonucta baslýgý olmayan bir kolon varsa, o kolona rapor bazli (gecici) olarak "as" anahrae kelimmesini anahter kelimesini anahtar kelimesinin kullanarak bir ad verebilirsibniz... "as" anahrae kelimesibe SQL server icerisinde "alias" denir...

--YONTEM1
Select 2+3 as 'Toplama', 5-2 as 'Cikarma', 5*6 as 'Carpma', 10/2 as 'Bolme'
--YONTEM 2
Select 5+6 as Toplama, 7*5 as Carpma
--YONTEM 3 
Select 24/4 as [Bolme Islemi]
--YONTEM 4
Select 56 - 24 Cikarma

--METINSEL ISLEMLER 
Select 'Merhaba' + ' ' + 'Dünya' as Selamlama

--Metinin tamamini buyuk ya da kucuk hale getirme
Select LOWER ('KARÝYERI ')
Select LOWER ('KARÝYERIT ')

--Metinsel 
Select SUBSTRING(' kariyerit ', 3, 3)

--
Select LTRIM('      kariyerit ')



--Girilen metin uzunlugunu alma
Select LEN('KARÝYERIT') as MetinUzunlugu


--Bir metinsel ifade icerisindeki bir bolumun baska bir degerle degistirilmesi
Select REPLACE('KARÝYERIT' , 'it   ', 'mct')


--Bir metinsel ifadeyi tersine cevirmek icin kullanma
Select REVERSE('KARÝYERIT')


--Bir metnin solundan yada sagýndan belirli bir kýsmýný alma
Select LEFT('KARÝYERIT', 5) as 'Ad', RIGHT('KARÝYERIT', 3) AS 'Soyad'

--TARIHSEL IFADELER
--GUNUN TARÝHÝNÝ ALMA
Select GETDATE()
--Bir tarihin gününü,ayýný,yýlýný alma
Select DAY(getdate())
Select MONTH(getdate())
Select YEAR(getdate())
--Verilen tarihe belirli bir zaman dilimi ekleme
Select DATEADD(YEAR,12,getdate())
Select DATEADD(MONTH,67,'08.19.1983')
--Ýki Tarih arasýnda fark alma
Select DATEDIFF(MINUTE,'05.19.1923',getdate())
--Özel tarihsel fonksiyonlar
Select DATENAME(Month,getdate())--Ýcerisinde bulundugunuz ayný size teslim eder...
Select DATENAME(dayofyear,getdate())--Yýlýn kaçýncý günü
Select DATENAME(weekday,getdate())--Günün adýný temsil eder

 

