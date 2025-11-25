USE Tehnomanija;
GO
-- Ovaj upit prikazuje koja narudžbina pripada kojem korisniku

SELECT 
    Narudzbine.NarudzbinaID,
    Korisnici.Ime + ' ' + Korisnici.Prezime AS Kupac,
    Narudzbine.DatumNarudzbine,
    Narudzbine.Status
FROM Narudzbine
INNER JOIN Korisnici ON Narudzbine.KorisnikID = Korisnici.KorisnikID;

-- Ovaj upit prikazuje sve stavke narudžbine i pripadajuće proizvode

SELECT 
    StavkeNarudzbine.StavkaID,
    StavkeNarudzbine.NarudzbinaID,
    Proizvodi.Naziv AS Proizvod,
    StavkeNarudzbine.Kolicina,
    StavkeNarudzbine.Cena
FROM StavkeNarudzbine
INNER JOIN Proizvodi ON StavkeNarudzbine.ProizvodID = Proizvodi.ProizvodID;

-- Upit prikazuje sve proizvode i njihove kategorije
SELECT 
	Proizvodi.ProizvodID,
	Proizvodi.Naziv AS Proizvod,
	Kategorije.Naziv AS Kategorija
FROM Proizvodi
INNER JOIN Kategorije ON Proizvodi.KategorijaID = Kategorije.KategorijaID

-- Ovaj upit prikazuje oji dobavljac isporucuje koji proizvod
SELECT
	ProizvodiDobavljaca.ID,
	ProizvodiDobavljaca.ProizvodID,
	Proizvodi.Naziv AS Proizvod,
	Dobavljaci.Naziv AS Dobavljac
FROM ProizvodiDobavljaca
INNER JOIN Proizvodi ON ProizvodiDobavljaca.ProizvodID = Proizvodi.ProizvodID
INNER JOIN Dobavljaci ON ProizvodiDobavljaca.DobavljacID = Dobavljaci.DobavljacID;

--Ovaj upit prikazuje koja nardzubina je placena i kada 

SELECT 
	Narudzbine.NarudzbinaID,
	Korisnici.Ime + ' ' + Korisnici.Prezime AS Kupac,
	Placanja.PlacanjeID,
	Placanja.Status
FROM Narudzbine
INNER JOIN Korisnici ON Narudzbine.KorisnikID = Korisnici.KorisnikID
INNER JOIN Placanja ON Narudzbine.NarudzbinaID = Placanja.NarudzbinaID;

-- Ovaj upit prikazuje koji korisnik je napisao recenziju za proizvod
SELECT
	Recenzije.RecenzijaID,
	Korisnici.Ime + ' ' + Korisnici.Prezime AS Kupac,
	Proizvodi.Naziv AS Proizvod,
	Recenzije.Komentar,
	Recenzije.Ocena
FROM Recenzije
INNER JOIN Korisnici ON Recenzije.KorisnikID = Korisnici.KorisnikID
INNER JOIN Proizvodi ON Recenzije.ProizvodID = Proizvodi.ProizvodID

--  Ovaj upit prikazuje sve proizvode u svakoj narudžbini i količinu kupljenih proizvoda
SELECT 
	Narudzbine.NarudzbinaID,
	Korisnici.Ime + ' ' + Korisnici.Prezime AS Kupac,
	Proizvodi.Naziv AS Proizvod,
	StavkeNarudzbine.Kolicina
FROM Narudzbine
INNER JOIN Korisnici ON Narudzbine.KorisnikID = Korisnici.KorisnikID
INNER JOIN StavkeNarudzbine ON Narudzbine.NarudzbinaID = StavkeNarudzbine.NarudzbinaID
INNER JOIN Proizvodi ON StavkeNarudzbine.ProizvodID = Proizvodi.ProizvodID

--  Ovaj upit prikazuje koji dobavljač isporučuje koji proizvod
SELECT
	Proizvodi.ProizvodID,
	Proizvodi.Naziv AS Proizvod,
	Dobavljaci.Naziv AS Dobavljac
FROM ProizvodiDobavljaca
INNER JOIN Proizvodi ON ProizvodiDobavljaca.ProizvodID=Proizvodi.ProizvodID
INNER JOIN Dobavljaci ON ProizvodiDobavljaca.DobavljacID = Dobavljaci.DobavljacID

-- Ovaj upit prikazuje sve narudžbine, korisnike i status njihovog plaćanja

SELECT 
    Narudzbine.NarudzbinaID,
    Korisnici.Ime + ' ' + Korisnici.Prezime AS Kupac,
    Narudzbine.Status AS StatusNarudzbine,
    Placanja.Status AS StatusPlacanja
FROM Narudzbine
INNER JOIN Korisnici ON Narudzbine.KorisnikID = Korisnici.KorisnikID
INNER JOIN Placanja ON Narudzbine.NarudzbinaID = Placanja.NarudzbinaID;


-- Ovaj upit prikazuje sve proizvode u narudžbini zajedno sa imenom kupca

SELECT 
    Narudzbine.NarudzbinaID,
    Korisnici.Ime + ' ' + Korisnici.Prezime AS Kupac,
    Proizvodi.Naziv AS Proizvod,
    StavkeNarudzbine.Kolicina
FROM StavkeNarudzbine
INNER JOIN Proizvodi ON StavkeNarudzbine.ProizvodID = Proizvodi.ProizvodID
INNER JOIN Narudzbine ON StavkeNarudzbine.NarudzbinaID = Narudzbine.NarudzbinaID
INNER JOIN Korisnici ON Narudzbine.KorisnikID = Korisnici.KorisnikID;

-- Prikazuje narudžbine koje su plaćene na rate ili pouzećem, sa imenom kupca i statusom plaćanja
SELECT DISTINCT
    Narudzbine.NarudzbinaID,
    Korisnici.Ime + ' ' + Korisnici.Prezime AS Kupac,
    Placanja.TipPlacanja,
    Placanja.Status AS StatusPlacanja,
    Narudzbine.Status AS StatusNarudzbine
FROM Narudzbine
INNER JOIN Korisnici ON Narudzbine.KorisnikID = Korisnici.KorisnikID
INNER JOIN Placanja ON Narudzbine.NarudzbinaID = Placanja.NarudzbinaID
WHERE Placanja.TipPlacanja IN ('Rate', 'Pouzeće');

--Skalarni -> prikazuje proizvode koji su iznad prosecne cene
SELECT
	Proizvodi.Naziv,
	Proizvodi.Cena
FROM Proizvodi
WHERE Proizvodi.Cena > (SELECT AVG(Cena) FROM Proizvodi);
-- Ovim proveravam da li je prethodni upit tacno izvrsen
SELECT AVG(Cena) AS ProsecnaCena
FROM Proizvodi

--  Prikazuje korisnike povezane sa dobavljačem ID 1
SELECT DISTINCT 
	Korisnici.Ime + ' ' + Korisnici.Prezime AS Kupac
FROM Narudzbine
INNER JOIN StavkeNarudzbine ON Narudzbine.NarudzbinaID = StavkeNarudzbine.NarudzbinaID
INNER JOIN ProizvodiDobavljaca ON StavkeNarudzbine.ProizvodID = ProizvodiDobavljaca.ProizvodID
INNER JOIN Korisnici ON Narudzbine.KorisnikID = Korisnici.KorisnikID
WHERE ProizvodiDobavljaca.DobavljacID = 1;

-- Korelativni podupit =>  Prikazuje proizvode koji imaju manje ili jednako kolicine na stanju u odnosu na prosecnu kolicinu u svojoj kategoriji 
SELECT
	Proizvodi.Naziv AS 'Naziv proizvoda',
	Proizvodi.KolicinaNaStanju AS 'Kolicina na stanju proizvoda',
	Kategorije.Naziv AS 'Naziv kategorije'
FROM Proizvodi
INNER JOIN Kategorije ON Proizvodi.KategorijaID = Kategorije.KategorijaID
WHERE Proizvodi.KolicinaNaStanju <= (
	SELECT AVG(P.KolicinaNaStanju)
	FROM Proizvodi P
	WHERE P.KategorijaID = Proizvodi.KategorijaID
);

-- Prikazuje sve korisnike koji imaju barem jednu narudzbinu
SELECT
	Korisnici.Ime + ' ' + Korisnici.Prezime AS 'Kupac'
FROM Korisnici
WHERE EXISTS(
	SELECT 1
	FROM Narudzbine
	WHERE Narudzbine.KorisnikID = Korisnici.KorisnikID
);

--Prikazuje broj proizvoda po kategorijama, ali samo one kategorije koje imaju više od 5 proizvoda
SELECT 
	Kategorije.Naziv AS Kategorija,
	COUNT(Proizvodi.ProizvodID) AS 'Broj proizvoda'
FROM Proizvodi
INNER JOIN Kategorije ON Proizvodi.KategorijaID = Kategorije.KategorijaID
GROUP BY Kategorije.Naziv
HAVING COUNT(Proizvodi.ProizvodID) > 5;

-- Prikazuje proizvode po cenama, Ne prvih 5 najskupljih nego od 6 do 10
SELECT 
    Proizvodi.Naziv AS Proizvod,
    Proizvodi.Cena,
    Kategorije.Naziv AS Kategorija
FROM Proizvodi
INNER JOIN Kategorije ON Proizvodi.KategorijaID = Kategorije.KategorijaID
ORDER BY Proizvodi.Cena DESC
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

-- Povecavanje cena svih TV-a za 10%
UPDATE Proizvodi
SET Cena = Cena * 1.10
WHERE KategorijaID = (SELECT KategorijaID FROM Kategorije WHERE Naziv = 'Televizori');

SELECT AVG(CenaNabavke) AS ProsekSvihProizvoda
FROM ProizvodiDobavljaca;

SELECT 
	Dobavljaci.Naziv AS Naziv,
	COUNT(ProizvodiDobavljaca.ProizvodID) AS BrojProizvoda,
	MIN(ProizvodiDobavljaca.CenaNabavke) AS NajnizaCena,
	MAX( ProizvodiDobavljaca.CenaNabavke) AS NajvisaCena,
	AVG( ProizvodiDobavljaca.CenaNabavke) AS Prosek
FROM Dobavljaci Dobavljaci
INNER JOIN ProizvodiDobavljaca ProizvodiDobavljaca on Dobavljaci.DobavljacID = ProizvodiDobavljaca.DobavljacID
GROUP BY Dobavljaci.Naziv
HAVING AVG(ProizvodiDobavljaca.CenaNabavke) > (SELECT AVG(CenaNabavke) FROM ProizvodiDobavljaca)
ORDER BY Dobavljaci.Naziv;


SELECT KorisnikID, COUNT(*) AS BrojNarudzbina
FROM Narudzbine
GROUP BY KorisnikID;
SELECT n.KorisnikID, SUM(s.Kolicina) AS UkupnoProizvoda
FROM Narudzbine n
JOIN StavkeNarudzbine s ON n.NarudzbinaID = s.NarudzbinaID
GROUP BY n.KorisnikID;
SELECT n.KorisnikID, SUM(s.Cena) AS UkupanIznos, AVG(s.Cena) AS ProsecnaCena
FROM Narudzbine n
JOIN StavkeNarudzbine s ON n.NarudzbinaID = s.NarudzbinaID
GROUP BY n.KorisnikID;
SELECT n.KorisnikID, AVG(s.Cena) AS ProsecnaCena
FROM Narudzbine n
JOIN StavkeNarudzbine s ON n.NarudzbinaID = s.NarudzbinaID
GROUP BY n.KorisnikID
HAVING AVG(s.Cena) > 10000;

SELECT 
	k.Ime + ' ' + k.Prezime AS Korisnik,
	COUNT(DISTINCT(n.NarudzbinaID)) AS BrojNarudzibna,
	SUM(s.Kolicina) as UkupnoProizvoda,
	SUM(s.Cena) as UkupanIznos,
	AVG(s.Cena) AS ProsecnaCena
From Korisnici k 
JOIN Narudzbine n ON k.KorisnikID = n.KorisnikID
JOIN StavkeNarudzbine s ON n.NarudzbinaID = s.NarudzbinaID
GROUP BY k.ime, k.Prezime
HAVING AVG(s.Cena)  > 10000
ORDER BY k.Ime

SELECT 
	d.Naziv as NazivDobavljaca,
	COUNT(pd.ProizvodID) AS BrojProizvoda,
	MIN(pd.CenaNabavke) AS NajnizaCena,
	MAX(pd.CenaNabavke) AS NajvisaCena,
	AVG(pd.CenaNabavke) AS ProsecnaCena
FROM Dobavljaci d 
JOIN ProizvodiDobavljaca pd on d.DobavljacID = pd.DobavljacID
GROUP BY d.Naziv
HAVING AVG(pd.CenaNabavke) > (SELECT AVG (CenaNabavke) from ProizvodiDobavljaca)
ORDER BY d.Naziv;

SELECT 
	d.Naziv AS Dobavljac,
	COUNT(pd.ProizvodID) AS BrojProizvoda,
	MIN(pd.CenaNabavke) AS  NajnizaCena,
	MAX(pd.CenaNabavke) AS NajvisaCena,
	AVG(pd.CenaNabavke) AS ProsecnaCena
FROM Dobavljaci d
JOIN ProizvodiDobavljaca pd ON d.DobavljacID = pd.DobavljacID
GROUP BY d.Naziv
HAVING COUNT( pd.ProizvodID) >= 1
ORDER BY ProsecnaCena DESC 

SELECT
	p.Naziv AS Proizvod,
	COUNT(r.RecenzijaID) AS BrojRecenzija,
	AVG(r.Ocena) AS ProsecnaOcena,
	MAX(r.Ocena) AS NajvisaOcena,
	MIN(r.Ocena) as NajnizaOcena
FROM Proizvodi p 
JOIN Recenzije r ON p.ProizvodID = r.ProizvodID
GROUP BY p.Naziv
HAVING AVG(r.Ocena) > (SELECT AVG(Ocena) from Recenzije)
ORDER BY ProsecnaOcena DESC;

SELECT 
	k.Ime + ' ' + k.Prezime AS ImePrezime,
	COUNT(n.NarudzbinaID) AS BrojNarudzina,
	MIN(n.DatumNarudzbine) AS PrvaNarudzbina,
	MAX(n.DatumNarudzbine) AS PoslednjaNarudzbina
FROM Korisnici k
JOIN Narudzbine n ON k.KorisnikID = n.KorisnikID
GROUP BY k.Ime,k.Prezime
ORDER BY BrojNarudzina;
select 
	c.Naziv AS Kategorija,
	COUNT(p.ProizvodID) AS BrojProizvoda,
	MAX(p.Cena) AS NajvisaCena,
	MIN(p.Cena) AS NajmanjaCena,
	AVG(p.Cena) AS ProsecnaCena
FROM Kategorije c 
JOIN Proizvodi p ON c.KategorijaID = p.KategorijaID
GROUP BY c.Naziv
HAVING ROUND (AVG(p.Cena),2) > (SELECT ROUND (AVG(Cena),2) from Proizvodi)
ORDER BY ProsecnaCena;

DECLARE @email NVARCHAR(100) = 'marko.markovic1@gmail.com';
SELECT 
    p.Naziv AS Proizvod,
    cat.Naziv AS Kategorija,
    dob.Naziv AS Dobavljac,
    p.Cena
FROM Korisnici korisnik
JOIN Narudzbine nar ON korisnik.KorisnikID = nar.KorisnikID
JOIN StavkeNarudzbine stavka ON nar.NarudzbinaID = stavka.NarudzbinaID
JOIN Proizvodi p ON stavka.ProizvodID = p.ProizvodID
JOIN Kategorije cat ON p.KategorijaID = cat.KategorijaID
JOIN ProizvodiDobavljaca pd ON p.ProizvodID = pd.ProizvodID
JOIN Dobavljaci dob ON pd.DobavljacID = dob.DobavljacID
LEFT JOIN Recenzije r ON p.ProizvodID = r.ProizvodID
WHERE korisnik.Email = @email
GROUP BY p.Naziv, cat.Naziv, dob.Naziv, p.Cena
HAVING p.Cena > 500



SELECT 
    k.Naziv AS Kategorija,
    COUNT(p.ProizvodID) AS BrojProizvoda,
    MIN(p.Cena) AS NajnizaCena,
    MAX(p.Cena) AS NajvisaCena,
    AVG(p.Cena) AS ProsecnaCena
FROM Proizvodi p
JOIN Kategorije k ON p.KategorijaID = k.KategorijaID
GROUP BY k.Naziv
HAVING AVG(p.Cena) > (SELECT AVG(Cena) FROM Proizvodi)
ORDER BY k.Naziv ASC;

declare  @mail NVARCHAR(100) = 'marko.markovic1@gmail.com' 
SELECT 
	p.Naziv AS Proizvod,
	c.Naziv AS Kategorija,
	d.Naziv AS Dobavljac
FROM Korisnici k 
JOIN Narudzbine n ON k.KorisnikID = n.KorisnikID
JOIN StavkeNarudzbine sn ON n.NarudzbinaID =sn.NarudzbinaID
JOIN Proizvodi p ON sn.ProizvodID = p.ProizvodID 
JOIN ProizvodiDobavljaca pd ON p.ProizvodID = pd.ProizvodID 
JOIN Kategorije c ON p.KategorijaID = c.KategorijaID
JOIN Dobavljaci d ON pd.DobavljacID = d.DobavljacID
LEFT JOIN Recenzije r ON p.ProizvodID = r.ProizvodID
WHERE k.Email = @mail
GROUP BY p.Naziv,c.Naziv,d.Naziv

ORDER BY p.Naziv DESC;







