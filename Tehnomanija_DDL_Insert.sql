-- Prelazak na master bazu
USE master;
GO

--  brisanje baze ako je u upotrebi
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'Tehnomanija')
BEGIN
    ALTER DATABASE Tehnomanija SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Tehnomanija;
END
GO

-- Kreiranje nove baze
CREATE DATABASE Tehnomanija;
GO

-- Korišćenje nove baze
USE Tehnomanija;
GO

-- 1 Tabela Korisnici
CREATE TABLE Korisnici (
    KorisnikID INT IDENTITY(1,1) PRIMARY KEY,
    Ime NVARCHAR(50) NOT NULL,
    Prezime NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Lozinka NVARCHAR(50) NOT NULL,
    DatumRegistracije DATETIME DEFAULT GETDATE()
);
GO

-- Ubacivanje testnih korisnika
INSERT INTO Korisnici (Ime, Prezime, Email, Lozinka)
VALUES
('Marko', 'Markovic', 'marko.markovic1@gmail.com', 'marko1'),
('Ana', 'Jovanovic', 'ana.jovanovic2@gmail.com', 'ana2'),
('Ivana', 'Petrovic', 'ivana.petrovic3@gmail.com', 'ivana3'),
('Nikola', 'Nikolic', 'nikola.nikolic4@gmail.com', 'nikola4'),
('Milos', 'Ilic', 'milos.ilic5@gmail.com', 'milos5'),
('Sara', 'Kovacevic', 'sara.kovacevic6@gmail.com', 'sara6'),
('Stefan', 'Popovic', 'stefan.popovic7@gmail.com', 'stefan7'),
('Marija', 'Stankovic', 'marija.stankovic8@gmail.com', 'marija8'),
('Luka', 'Pavlovic', 'luka.pavlovic9@gmail.com', 'luka9'),
('Teodora', 'Milojevic', 'teodora.milojevic10@gmail.com', 'teodora10'),
('Aleksandar', 'Djordjevic', 'aleksandar.djordjevic11@gmail.com', 'aleksandar11'),
('Katarina', 'Radovanovic', 'katarina.radovanovic12@gmail.com', 'katarina12'),
('Jovana', 'Simic', 'jovana.simic13@gmail.com', 'jovana13'),
('Filip', 'Ristic', 'filip.ristic14@gmail.com', 'filip14'),
('Nemanja', 'Tomic', 'nemanja.tomic15@gmail.com', 'nemanja15'),
('Tamara', 'Lukic', 'tamara.lukic16@gmail.com', 'tamara16'),
('Bojan', 'Zivkovic', 'bojan.zivkovic17@gmail.com', 'bojan17'),
('Danijela', 'Krstic', 'danijela.krstic18@gmail.com', 'danijela18'),
('Vladan', 'Jankovic', 'vladan.jankovic19@gmail.com', 'vladan19'),
('Milena', 'Mitrovic', 'milena.mitrovic20@gmail.com', 'milena20'),
('Zoran', 'Vasiljevic', 'zoran.vasiljevic21@gmail.com', 'zoran21'),
('Ivana', 'Djuric', 'ivana.djuric22@gmail.com', 'ivana22'),
('Petar', 'Knezevic', 'petar.knezevic23@gmail.com', 'petar23'),
('Olga', 'Stefanovic', 'olga.stefanovic24@gmail.com', 'olga24'),
('Nikolina', 'Savic', 'nikolina.savic25@gmail.com', 'nikolina25'),
('Milan', 'Djordjevic', 'milan.djordjevic26@gmail.com', 'milan26'),
('Jelena', 'Stojanovic', 'jelena.stojanovic27@gmail.com', 'jelena27'),
('Ognjen', 'Petrovic', 'ognjen.petrovic28@gmail.com', 'ognjen28'),
('Nina', 'Ristic', 'nina.ristic29@gmail.com', 'nina29'),
('Vuk', 'Jovanovic', 'vuk.jovanovic30@gmail.com', 'vuk30'),
('Andrea', 'Ilic', 'andrea.ilic31@gmail.com', 'andrea31'),
('Matea', 'Milosevic', 'matea.milosevic32@gmail.com', 'matea32'),
('Stefan', 'Pavlovic', 'stefan.pavlovic33@gmail.com', 'stefan33'),
('Milica', 'Mitrovic', 'milica.mitrovic34@gmail.com', 'milica34'),
('Filip', 'Kovacevic', 'filip.kovacevic35@gmail.com', 'filip35'),
('Sara', 'Markovic', 'sara.markovic36@gmail.com', 'sara36'),
('Dusan', 'Radic', 'dusan.radic37@gmail.com', 'dusan37'),
('Kristina', 'Petrovic', 'kristina.petrovic38@gmail.com', 'kristina38'),
('Goran', 'Milosevic', 'goran.milosevic39@gmail.com', 'goran39'),
('Predrag', 'Knezevic', 'predrag.knezevic40@gmail.com', 'predrag40'),
('Bojana', 'Nikolic', 'bojana.nikolic41@gmail.com', 'bojana41'),
('Sasa', 'Ilic', 'sasa.ilic42@gmail.com', 'sasa42'),
('Ljubomir', 'Stankovic', 'ljubomir.stankovic43@gmail.com', 'ljubomir43'),
('Dragana', 'Markovic', 'dragana.markovic44@gmail.com', 'dragana44'),
('Robert', 'Ivanovic', 'robert.ivanovic45@gmail.com', 'robert45'),
('Marina', 'Radovanovic', 'marina.radovanovic46@gmail.com', 'marina46'),
('Petar', 'Jovanovic', 'petar.jovanovic47@gmail.com', 'petar47'),
('Ana', 'Petrovic', 'ana.petrovic48@gmail.com', 'ana48'),
('Marko', 'Jankovic', 'marko.jankovic49@gmail.com', 'marko49'),
('Jelena', 'Petrovic', 'jelena.petrovic50@gmail.com', 'jelena50');
GO




-- Tabela Kategorije
CREATE TABLE Kategorije (
    KategorijaID INT IDENTITY(1,1) PRIMARY KEY,
    Naziv NVARCHAR(50) NOT NULL UNIQUE,
    Opis NVARCHAR(255)
);
GO

--  Ubacivanje kategorija
INSERT INTO Kategorije (Naziv, Opis)
VALUES
('Laptopovi', 'Sve vrste laptopova'),
('Mobilni telefoni', 'Pametni telefoni i dodaci'),
('Televizori', 'LED, OLED, Smart TV'),
('Kucni aparati', 'Frizideri, usisivači i ostalo'),
('Monitori', 'Računarski monitori'),
('Audio oprema', 'Zvučnici, slušalice, pojačala'),
('Gaming periferija', 'Miševi, tastature, gejmerske stolice'),
('Pametni satovi', 'Wearable uređaji i fitnes narukvice'),
('Foto i video', 'Kamera, objektivi, dronovi'),
('Mrežna oprema', 'Ruter, modem, switch'),
('Kućna automatizacija', 'Pametni uređaji za dom'),
('Pribor za laptopove', 'Torbe, punjači, dock stanice');
GO



-- Tabela Proizvodi
CREATE TABLE Proizvodi (
    ProizvodID INT IDENTITY(1,1) PRIMARY KEY,
    Naziv NVARCHAR(100) NOT NULL,
    Opis NVARCHAR(255),
    Cena DECIMAL(10,2) NOT NULL,
    KolicinaNaStanju INT NOT NULL,
    KategorijaID INT FOREIGN KEY REFERENCES Kategorije(KategorijaID)
);
GO

--  Ubacivanje proizvoda
INSERT INTO Proizvodi (Naziv, Opis, Cena, KolicinaNaStanju, KategorijaID)
VALUES
('Televizor Samsung 55"', 'Smart TV, 4K UHD', 599.99, 10, 3),
('Laptop Lenovo ThinkPad', 'i5, 16GB RAM, 512GB SSD', 899.99, 5, 1),
('Mobilni telefon iPhone 14', '128GB, crni', 1199.99, 8, 2),
('Monitor LG 27"', 'IPS, 144Hz', 249.99, 15, 5),
('Usisivač Philips', '800W, vrećica', 99.99, 12, 4),
('Televizor LG 50"', 'LED, Full HD', 449.99, 7, 3),
('Laptop Dell XPS 13', 'i7, 16GB RAM, 512GB SSD', 1099.99, 4, 1),
('Mobilni telefon Samsung Galaxy S23', '256GB, crni', 999.99, 10, 2),
('Monitor Asus 24"', 'IPS, 75Hz', 149.99, 20, 5),
('Mikrotalasna Samsung', '23L, crna', 129.99, 9, 4),
('Televizor Sony 65"', '4K UHD, Smart TV', 1299.99, 5, 3),
('Laptop HP Pavilion', 'i5, 8GB RAM, 256GB SSD', 699.99, 6, 1),
('Mobilni telefon Xiaomi 13', '128GB, plavi', 799.99, 12, 2),
('Monitor Dell 27"', 'IPS, 144Hz', 299.99, 8, 5),
('Usisivač Bosch', '1200W, bezvrećasti', 149.99, 10, 4),
('Televizor Philips 43"', 'LED, Smart TV', 399.99, 9, 3),
('Laptop Acer Aspire 5', 'i5, 8GB RAM, 512GB SSD', 649.99, 7, 1),
('Mobilni telefon Google Pixel 7', '128GB, crni', 899.99, 10, 2),
('Monitor Samsung 32"', 'VA, 60Hz', 199.99, 11, 5),
('Mikrotalasna Whirlpool', '20L, bela', 99.99, 8, 4),
('Televizor Panasonic 50"', 'LED, Smart TV', 499.99, 6, 3),
('Laptop ASUS ZenBook', 'i7, 16GB RAM, 1TB SSD', 1299.99, 3, 1),
('Mobilni telefon OnePlus 11', '256GB, crni', 899.99, 9, 2),
('Monitor LG UltraWide 34"', 'IPS, 75Hz', 399.99, 5, 5),
('Usisivač Rowenta', '750W, vrećica', 119.99, 7, 4),
('Televizor Hisense 55"', '4K UHD, Smart TV', 549.99, 8, 3),
('Laptop MacBook Air M2', '16GB RAM, 512GB SSD', 1399.99, 4, 1),
('Mobilni telefon Samsung Galaxy A54', '128GB, crni', 499.99, 15, 2),
('Monitor Acer 24"', 'IPS, 144Hz', 179.99, 10, 5),
('Mikrotalasna Samsung', '28L, crna', 149.99, 6, 4),
('Televizor TCL 50"', 'LED, Smart TV', 429.99, 9, 3),
('Laptop Lenovo IdeaPad', 'i5, 8GB RAM, 256GB SSD', 599.99, 5, 1),
('Mobilni telefon iPhone 13', '128GB, bela', 999.99, 7, 2),
('Monitor HP 27"', 'IPS, 75Hz', 219.99, 8, 5),
('Usisivač Philips 900W', 'vrećica', 129.99, 10, 4),
('Televizor Samsung 65"', '4K UHD, Smart TV', 1399.99, 3, 3),
('Laptop Dell Inspiron', 'i7, 16GB RAM, 1TB SSD', 1199.99, 2, 1),
('Mobilni telefon Xiaomi 12', '256GB, crni', 699.99, 10, 2),
('Monitor LG 24"', 'IPS, 60Hz', 129.99, 12, 5),
('Mikrotalasna Whirlpool', '25L, bela', 109.99, 5, 4),
('Televizor Sony 55"', 'LED, 4K UHD', 899.99, 4, 3),
('Laptop HP Envy', 'i5, 16GB RAM, 512GB SSD', 849.99, 6, 1),
('Mobilni telefon OnePlus 10', '128GB, plavi', 799.99, 8, 2),
('Monitor Samsung 27"', 'VA, 75Hz', 229.99, 9, 5),
('Usisivač Bosch', '1000W, vrećica', 139.99, 7, 4),
('Televizor LG 65"', 'OLED, 4K', 1599.99, 2, 3),
('Laptop Acer Swift', 'i7, 16GB RAM, 512GB SSD', 1099.99, 3, 1),
('Mobilni telefon Google Pixel 8', '256GB, crni', 899.99, 6, 2),
('Monitor ASUS 27"', 'IPS, 165Hz', 349.99, 5, 5),
('Mikrotalasna Samsung', '22L, crna', 119.99, 8, 4),
('Televizor Panasonic 43"', 'LED, Smart TV', 429.99, 7, 3);
GO

-- Kreiranje tabele narudzbine

CREATE TABLE Narudzbine (
    NarudzbinaID INT IDENTITY(1,1) PRIMARY KEY,
    KorisnikID INT NOT NULL FOREIGN KEY REFERENCES Korisnici(KorisnikID),
    DatumNarudzbine DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50) DEFAULT 'Na čekanju'
);
GO
--Dodavanje narudzbina
INSERT INTO Narudzbine (KorisnikID,Status)
VALUES
(1,'Zavrsena'),
(2, 'Na čekanju'),
(3, 'Otkazana');
GO

-- Kreiranje tabele StavkeNaruzbine

CREATE TABLE StavkeNarudzbine(
	StavkaID INT IDENTITY(1,1) PRIMARY KEY,
	NarudzbinaID INT NOT NULL FOREIGN KEY REFERENCES Narudzbine(NarudzbinaID),
	ProizvodID INT NOT NULL FOREIGN KEY REFERENCES Proizvodi(ProizvodID),
	Kolicina INT NOT NULL,
	Cena DECIMAL(10,2) NOT NULL
);
GO
-- Dodavanje još narudžbina za korisnika 1 (Marko Markovic)
INSERT INTO Narudzbine (KorisnikID, Status)
VALUES
(1, 'Na čekanju'),
(1, 'Zavrsena');

-- Dodavanje stavki za te narudžbine
INSERT INTO StavkeNarudzbine (NarudzbinaID, ProizvodID, Kolicina, Cena)
VALUES
(4, 2, 1, 899.99),
(5, 3, 2, 1199.99);


INSERT INTO StavkeNarudzbine (NarudzbinaID, ProizvodID, Kolicina, Cena)
VALUES
(1, 3, 1, 119999.99),
(1, 4, 1, 24999.99),
(2, 5, 2, 9999.99),
(2, 6, 1, 44999.99),
(3, 7, 1, 109999.99),
(3, 8, 1, 99999.99),
(3, 9, 2, 14999.99),
(1, 10, 1, 12999.99),
(2, 11, 1, 129999.99),
(3, 12, 1, 69999.99),
(1, 13, 1, 79999.99),
(2, 14, 1, 29999.99),
(1, 15, 1, 14999.99),
(3, 16, 1, 39999.99),
(2, 17, 1, 64999.99),
(1, 18, 1, 89999.99),
(1, 19, 1, 19999.99),
(2, 20, 1, 9999.99),
(1, 21, 1, 49999.99),
(3, 22, 1, 129999.99),
(1, 1, 1, 599.99);
GO



--  Tabela Adrese
CREATE TABLE Adrese (
    AdresaID INT IDENTITY(1,1) PRIMARY KEY,
    KorisnikID INT NOT NULL FOREIGN KEY REFERENCES Korisnici(KorisnikID),
    Ulica NVARCHAR(100) NOT NULL,
    Grad NVARCHAR(50) NOT NULL,
    PostanskiBroj NVARCHAR(10) NOT NULL
);
GO

-- Ubacivanje testnih adresa
INSERT INTO Adrese (KorisnikID, Ulica, Grad, PostanskiBroj)
VALUES
(1, 'Bulevar Kralja Aleksandra 10', 'Beograd', '11000'),
(2, 'Nemanjina 5', 'Beograd', '11000'),
(3, 'Savska 20', 'Novi Sad', '21000');
GO


--  Tabela Placanja
CREATE TABLE Placanja (
    PlacanjeID INT IDENTITY(1,1) PRIMARY KEY,
    NarudzbinaID INT NOT NULL FOREIGN KEY REFERENCES Narudzbine(NarudzbinaID),
    TipPlacanja NVARCHAR(50) NOT NULL,
    DatumPlacanja DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(50) DEFAULT 'Na čekanju'
);
GO

-- Ubacivanje testnih placanja
INSERT INTO Placanja (NarudzbinaID, TipPlacanja, Status)
VALUES
(1, 'Kartica', 'Završeno'),
(2, 'Pouzeće', 'Na čekanju'),
(3, 'Rate', 'Na čekanju'),
(1, 'Online', 'Završeno'),
(3, 'Mobilno plaćanje', 'Na čekanju'),
(2, 'Pouzeće', 'Na čekanju'),
(3, 'Kartica', 'Na čekanju'),
(2, 'Pouzeće', 'Na čekanju'),
(3, 'Rate', 'Na čekanju');
GO



-- Tabela Dobavljaci
CREATE TABLE Dobavljaci (
    DobavljacID INT IDENTITY(1,1) PRIMARY KEY,
    Naziv NVARCHAR(100) NOT NULL,
    Kontakt NVARCHAR(100)
);
GO

-- Ubacivanje  dobavljača
INSERT INTO Dobavljaci (Naziv, Kontakt)
VALUES
('Sony', 'kontakt@sony.com'),
('Panasonic', 'kontakt@panasonic.com'),
('TCL', 'kontakt@tcl.com'),
('Xiaomi', 'kontakt@xiaomi.com'),
('Huawei', 'kontakt@huawei.com'),
('Asus', 'kontakt@asus.com'),
('Acer', 'kontakt@acer.com'),
('HP', 'kontakt@hp.com'),
('Dell', 'kontakt@dell.com'),
('OnePlus', 'kontakt@oneplus.com'),
('Whirlpool', 'kontakt@whirlpool.com'),
('Rowenta', 'kontakt@rowenta.com');
GO



--  Tabela ProizvodiDobavljaca
CREATE TABLE ProizvodiDobavljaca (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    ProizvodID INT NOT NULL FOREIGN KEY REFERENCES Proizvodi(ProizvodID),
    DobavljacID INT NOT NULL FOREIGN KEY REFERENCES Dobavljaci(DobavljacID),
    CenaNabavke DECIMAL(10,2) NOT NULL
);
GO

-- Insertovanje i povezivanje proizvoda, dobavljaca i dodavanje cene
INSERT INTO ProizvodiDobavljaca (ProizvodID, DobavljacID, CenaNabavke)
VALUES
(1, 1, 450.00),  
(2, 2, 700.00),  
(3, 3, 1000.00), 
(4, 4, 200.00),  
(5, 5, 80.00);   


-- Kreiranje tabele recenzije
CREATE TABLE Recenzije (
    RecenzijaID INT IDENTITY(1,1) PRIMARY KEY,
    KorisnikID INT NOT NULL FOREIGN KEY REFERENCES Korisnici(KorisnikID),
    ProizvodID INT NOT NULL FOREIGN KEY REFERENCES Proizvodi(ProizvodID),
    Ocena INT CHECK (Ocena BETWEEN 1 AND 5),
    Komentar NVARCHAR(255)
);
GO

-- Insertovanje recenzija
INSERT INTO Recenzije (KorisnikID, ProizvodID, Ocena, Komentar)
VALUES
(1, 1, 5, 'Odličan televizor!'),
(2, 2, 4, 'Laptop radi super, ali baterija mogla bolje'),
(3, 3, 5, 'iPhone je top!'),
(4, 4, 4, 'Monitor je solidan, boje su precizne'),
(5, 5, 3, 'Usisivač je dobar, ali bučan je'),
(6, 6, 5, 'LG televizor odlično radi'),
(7, 7, 4, 'Laptop je brz, ali baterija nije najbolja'),
(8, 8, 5, 'Samsung telefon je fenomenalan'),
(9, 9, 3, 'Monitor je prosečan, očekivao sam više'),
(10, 10, 4, 'Mikrotalasna je praktična i funkcionalna'),
(11, 11, 5, 'Sony TV je odličan, slika briljantna'),
(12, 12, 4, 'HP laptop je stabilan, solidan'),
(13, 13, 5, 'Xiaomi telefon je brz i praktičan'),
(14, 14, 3, 'Dell monitor je dobar, ali kontrast može bolje'),
(15, 15, 4, 'Bosch usisivač je tih i efikasan'),
(16, 16, 5, 'Philips TV je vrhunski za cenu'),
(17, 17, 4, 'Acer laptop je solidan, baterija ok'),
(18, 18, 5, 'Google Pixel je super telefon'),
(19, 19, 4, 'Samsung monitor je odličan za rad'),
(20, 20, 3, 'Whirlpool mikrotalasna greje sporo'),
(21, 21, 5, 'Panasonic TV vrhunski'),
(22, 22, 4, 'ASUS laptop pouzdan i brz'),
(23, 23, 5, 'OnePlus telefon je fantastičan'),
(24, 24, 4, 'LG UltraWide monitor odlican za multimediju'),
(25, 25, 3, 'Rowenta usisivač zadovoljava potrebe'),
(26, 26, 5, 'Hisense TV super slika i zvuk'),
(27, 27, 4, 'MacBook Air M2 izuzetno brz i tih'),
(28, 28, 5, 'Samsung Galaxy A54 praktičan i lep'),
(29, 29, 4, 'Acer monitor solidan, ne preskup');
GO


-- Pregled svih tabela


SELECT * FROM Korisnici;
GO


SELECT * FROM Kategorije;
GO


SELECT * FROM Proizvodi;
GO


SELECT * FROM Narudzbine;
GO


SELECT * FROM StavkeNarudzbine;
GO


SELECT * FROM Adrese;
GO


SELECT * FROM Placanja;
GO


SELECT * FROM Dobavljaci;
GO


SELECT * FROM ProizvodiDobavljaca;
GO


SELECT * FROM Recenzije;
GO




-- Dodavanje više proizvoda za dobavljače sa cenama u RSD
INSERT INTO ProizvodiDobavljaca (ProizvodID, DobavljacID, CenaNabavke)
VALUES
(6, 2, 650*120),   -- Panasonic → 78.000 RSD
(7, 2, 1200*120),  -- Panasonic → 144.000 RSD
(8, 3, 1100*120),  -- TCL → 132.000 RSD
(9, 3, 950*120),   -- TCL → 114.000 RSD
(10, 1, 470*120),  -- Sony → 56.400 RSD
(11, 1, 520*120),  -- Sony → 62.400 RSD
(12, 4, 800*120),  -- Xiaomi → 96.000 RSD
(13, 4, 850*120),  -- Xiaomi → 102.000 RSD
(14, 5, 900*120),  -- Huawei → 108.000 RSD
(15, 5, 1000*120); -- Huawei → 120.000 RSD

INSERT INTO Proizvodi (Naziv, Opis, Cena, KolicinaNaStanju, KategorijaID)
VALUES
('Laptop Acer Nitro', 'Gejming laptop 16GB RAM', 120000, 10, 1),
('Smart TV Samsung', 'LED 55 inch 4K', 95000, 5, 2),
('Mobilni telefon Xiaomi', '128GB, crni', 45000, 20, 1),
('Bežične slušalice Sony', 'Noise cancelling', 15000, 30, 3),
('Gaming miš Logitech', 'RGB osvetljenje', 7000, 50, 3),
('Tastatura Razer', 'Mehanička, RGB', 12000, 40, 3),
('Tablet iPad', '10.2 inch, 64GB', 75000, 8, 2),
('Printer HP', 'Inkjet, bežični', 25000, 12, 2),
('Eksterna memorija Samsung', '1TB SSD', 18000, 25, 1),
('Pametna sijalica Philips', 'RGB LED', 5000, 60, 3);

-- Ubacivanje recenzija za proizvode
INSERT INTO Recenzije (KorisnikID, ProizvodID, Ocena, Komentar)
VALUES
-- Sony proizvodi
(1, 1, 5, 'Odlican televizor!'),
(2, 10, 4, 'Bežične slušalice kvalitetne'),
(3, 11, 5, 'Sony TV slika vrhunska'),

-- Panasonic proizvodi
(4, 6, 4, 'Panasonic Smart TV solidan'),
(5, 7, 5, 'Laptop radi brzo i stabilno'),

-- TCL proizvodi
(6, 8, 3, 'TCL TV pristojan, ali boje nisu najbolje'),
(7, 9, 4, 'Monitor TCL dobar za rad'),

-- Xiaomi proizvodi
(8, 12, 5, 'Xiaomi telefon super performanse'),
(9, 13, 4, 'Eksterna memorija brza i pouzdana'),

-- Huawei proizvodi
(10, 14, 5, 'Huawei laptop izvanredan'),
(11, 15, 4, 'Huawei telefon solidan'),

-- Asus proizvodi
(12, 4, 4, 'Monitor Asus odlican'),
(13, 5, 5, 'Gaming miš precizan i lagan'),

-- Acer proizvodi
(14, 2, 4, 'Laptop Acer pouzdan'),
(15, 6, 5, 'Gejming laptop Acer fantastičan'),

-- HP proizvodi
(16, 7, 4, 'HP printer radi dobro'),
(17, 12, 5, 'Laptop HP stabilan i brz'),

-- OnePlus proizvodi
(18, 13, 5, 'OnePlus telefon odlican'),
(19, 14, 4, 'OnePlus tablet solidan'),

-- Rowenta proizvodi
(20, 15, 3, 'Usisivač zadovoljava potrebe');



