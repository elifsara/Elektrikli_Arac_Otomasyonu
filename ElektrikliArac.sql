--Tablolarý Oluþturma
CREATE TABLE MusteriTB (
    MusteriID INT IDENTITY(1,1) PRIMARY KEY,
    TelefonNum VARCHAR(15),
    Bakiye DECIMAL(10, 2),
    AdSoyad VARCHAR(100)
);

CREATE TABLE AracTB (
    AracID INT IDENTITY(1,1) PRIMARY KEY,
    MusteriID INT,
    Marka VARCHAR(50),
    Model VARCHAR(50),
	KM INT,
    PilDurumu INT,
    SonBakim DATE,
    FOREIGN KEY (MusteriID) REFERENCES MusteriTB(MusteriID)
);

CREATE TABLE SurusGecmisiTB (
    SurusID INT IDENTITY(1,1) PRIMARY KEY,
    AracID INT,
    PilKullanimi INT,
    Sure DECIMAL(5, 2),
    BaslangicKm VARCHAR(100),
    BitisKm VARCHAR(100),
    FOREIGN KEY (AracID) REFERENCES AracTB(AracID)
);

CREATE TABLE BakimGecmisiTB (
	BakimID INT IDENTITY(1,1) PRIMARY KEY,
    AracID INT,
    BakimTarihi DATE,
    KullanilanParcalar TEXT,
    YapilanIslemler TEXT,
	FOREIGN KEY (AracID) REFERENCES AracTB(AracID)
);

CREATE TABLE PersonelTB (
    PersonelID INT IDENTITY(1,1) PRIMARY KEY,
    AdSoyad VARCHAR(100),
    Gorev VARCHAR(50),
    IseGiris DATE,
);

CREATE TABLE SarjIstasyonuTB (
    IstasyonID INT IDENTITY(1,1) PRIMARY KEY,
    Adres VARCHAR(200),
    Kapasite INT,
	PersonelID INT,
	MevcutDurum BINARY,
	SonBakim DATE
	FOREIGN KEY (PersonelID) REFERENCES PersonelTB(PersonelID)
);

CREATE TABLE FaturaTB (
    FaturaID INT IDENTITY(1,1) PRIMARY KEY,
    MusteriID INT,
    IstasyonID INT,
    FaturaTarihi DATE,
    Tutar DECIMAL(10, 2),
    FOREIGN KEY (MusteriID) REFERENCES MusteriTB(MusteriID),
    FOREIGN KEY (IstasyonID) REFERENCES SarjIstasyonuTB(IstasyonID)
);

-- Tablolara verileri ekleme
INSERT INTO MusteriTB (TelefonNum, Bakiye, AdSoyad) VALUES   
('05339876532', 150.75, 'Merve Güneþ'),
('05439876433', 500.00, 'Eren Kýlýç'),
('05551234456', 850.00, 'Ayþe Demir'),
('05321211111', 400.50, 'Hakan Arslan'),
('05411222333', 1000.00, 'Büþra Keskin'),
('05321555555', 250.00, 'Can Yýldýz'),
('05555512345', 600.00, 'Zehra Gül'),
('05331313131', 700.00, 'Osman Yavuz'),
('05442113456', 920.50, 'Elif Aksoy'),
('05561331331', 330.00, 'Melih Uðurlu'),
('05345454545', 50.00, 'Kadir Kaya'),
('05436547891', 780.00, 'Ceren Þahin'),
('05327891234', 650.00, 'Mert Yýlmaz'),
('05436542314', 900.00, 'Sevil Altun'),
('05551234987', 120.00, 'Hüseyin Koç'),
('05349876521', 800.00, 'Emine Bozkurt'),
('05449871234', 490.00, 'Derya Demir'),
('05551234876', 345.50, 'Selim Taþ'),
('05321234567', 349.25, 'Mehtap Ülker'),
('05320987654', 530.00, 'Fatma Beyaz'),
('05327123456', 470.00, 'Emre Koç'),
('05421234567', 540.00, 'Seda Kara'),
('05551233333', 150.00, 'Berkay Çelik'),
('05321098765', 800.00, 'Nihan Özdemir'),
('05345678901', 650.00, 'Elif Sara Han'),
('05551231234', 750.00, 'Caner Taþdemir'),
('05312345678', 320.00, 'Hülya Güler'),
('05454321234', 670.00, 'Özge Aydýn'),
('05551231234', 750.00, 'Serkan Kaya'),
('05348765432', 800.00, 'Zeynep Arslan'),
('05431234567', 620.00, 'Cevdet Ýnce'),
('05323456789', 530.00, 'Burcu Polat'),
('05441234567', 690.00, 'Yusuf Bayram'),
('05551234565', 570.00, 'Sibel Yýlmaz'),
('05357654321', 890.00, 'Levent Korkmaz'),
('05432123465', 430.00, 'Berke Duman'),
('05551233333', 350.00, 'Ayhan Demirtaþ'),
('05321213456', 900.00, 'Asuman Özdemir'),
('05551231223', 700.00, 'Burhan Ergen'),
('05339876512', 600.00, 'Ahmet Þahin'),
('05452123456', 710.00, 'Gülseren Çelik'),
('05551234872', 490.00, 'Murat Karaca'),
('05327654321', 680.00, 'Selin Kök'),
('05443212345', 560.00, 'Hakan Atalay'),
('05551231222', 300.00, 'Cemre Kurt'),
('05321123456', 400.00, 'Ömer Akbaþ'),
('05437654321', 510.00, 'Ömer Akbaþ'),
('05551234523', 700.00, 'Ahmet Þahin'),
('05551234522', 770.00, 'Zeynep Yalçýn'),
('05348765433', 900.00, 'Murat Sönmez');
INSERT INTO AracTB (MusteriID, Marka, Model, KM, PilDurumu, SonBakim) VALUES
(1, 'Tesla', 'Model S', 50000, 80, '2024-01-15'),
(2, 'Nissan', 'Leaf', 30000, 90, '2024-02-10'),
(3, 'BMW', 'i3', 20000, 70, '2024-03-05'),
(4, 'Tesla', 'Cybertruck', 10000, 95, '2024-04-01'),
(5, 'TOGG', 'T10X', 12000, 85, '2024-05-10'),
(6, 'Renault', 'Zoe', 40000, 60, '2024-06-15'),
(7, 'Hyundai', 'Kona Electric', 35000, 75, '2024-07-20'),
(8, 'Volkswagen', 'ID.3', 45000, 65, '2024-08-25'),
(9, 'Chevrolet', 'Bolt EV', 25000, 80, '2024-09-30'),
(10, 'Audi', 'e-Tron', 22000, 90, '2024-10-05'),
(11, 'Mercedes-Benz', 'EQC', 18000, 70, '2024-10-15'),
(12, 'Jaguar', 'I-PACE', 28000, 85, '2024-10-20'),
(13, 'Kia', 'EV6', 15000, 95, '2024-11-01'),
(14, 'Tesla', 'Model X', 12000, 85, '2024-11-10'),
(15, 'TOGG', 'T20X', 5000, 100, '2024-11-15'),
(16, 'Ford', 'Mustang Mach-E', 18000, 80, '2024-12-01'),
(17, 'Volvo', 'XC40 Recharge', 22000, 75, '2025-01-05'),
(18, 'Lucid', 'Air', 8000, 90, '2025-01-10'),
(19, 'Rivian', 'R1T', 12000, 95, '2025-01-20'),
(20, 'Porsche', 'Taycan', 15000, 85, '2025-02-01'),
(21, 'Mazda', 'MX-30', 25000, 65, '2025-02-10'),
(22, 'Peugeot', 'e-208', 35000, 70, '2025-02-15'),
(23, 'Fiat', '500e', 30000, 75, '2025-03-01'),
(24, 'Honda', 'e', 20000, 80, '2025-03-10'),
(25, 'Mini', 'Cooper SE', 18000, 85, '2025-03-20'),
(26, 'Tesla', 'Model 3', 25000, 90, '2025-04-01'),
(27, 'TOGG', 'T30X', 8000, 95, '2025-04-15'),
(28, 'BYD', 'Atto 3', 12000, 75, '2025-04-20'),
(29, 'MG', 'ZS EV', 30000, 70, '2025-05-01'),
(30, 'Opel', 'Corsa-e', 40000, 65, '2025-05-10'),
(31, 'Toyota', 'bZ4X', 5000, 90, '2025-05-20'),
(32, 'Skoda', 'Enyaq iV', 15000, 80, '2025-06-01'),
(33, 'Polestar', '2', 10000, 85, '2025-06-10'),
(34, 'Cupra', 'Born', 18000, 75, '2025-06-20'),
(35, 'Tesla', 'Roadster', 5000, 100, '2025-07-01'),
(36, 'Volkswagen', 'ID.4', 22000, 85, '2025-07-10'),
(37, 'Audi', 'Q4 e-Tron', 12000, 90, '2025-07-15'),
(38, 'Renault', 'Megane E-Tech', 25000, 70, '2025-07-20'),
(39, 'Hyundai', 'Ioniq 5', 20000, 95, '2025-08-01'),
(40, 'Kia', 'Soul EV', 30000, 75, '2025-08-10'),
(41, 'Chevrolet', 'Equinox EV', 18000, 80, '2025-08-20'),
(42, 'Tesla', 'Semi', 8000, 90, '2025-09-01'),
(43, 'TOGG', 'SUV', 10000, 85, '2025-09-15'),
(44, 'BMW', 'iX', 5000, 100, '2025-09-20'),
(45, 'Jaguar', 'XJ EV', 15000, 75, '2025-10-01'),
(46, 'Mercedes-Benz', 'EQS', 12000, 90, '2025-10-10'),
(47, 'Lucid', 'Gravity', 8000, 95, '2025-10-15'),
(48, 'Nissan', 'Ariya', 25000, 70, '2025-11-01'),
(49, 'Rivian', 'R1S', 18000, 85, '2025-11-10'),
(50, 'Ford', 'F-150 Lightning', 15000, 80, '2025-11-20'),
(19, 'Mercedes-Benz', 'EQS', 12000, 90, '2025-10-10'),
(10, 'Lucid', 'Gravity', 8000, 95, '2025-10-15'),
(20, 'Nissan', 'Ariya', 25000, 70, '2025-11-01'),
(39, 'Rivian', 'R1S', 18000, 85, '2025-11-10'),
(25, 'Tesla', 'Cybertruck', 10000, 95, '2024-04-01');
INSERT INTO SurusGecmisiTB (AracID, PilKullanimi, Sure, BaslangicKm, BitisKm) VALUES 
(1, 20, 2, 50000, 50150),
(1, 15, 1.5, 50150, 50270),
(1, 25, 2, 50270, 50450),
(2, 18, 1.2, 30000, 30100),
(2, 20, 1.6, 30100, 30230),
(2, 17, 1.4, 30230, 30320),
(3, 10, 1.1, 20000, 20080),
(3, 12, 1.3, 20080, 20190),
(3, 9, 1.2, 20190, 20260),
(4, 22, 1.5, 10000, 10100),
(4, 19, 1.0, 10100, 10150),
(4, 25, 1.8, 10150, 10250),
(5, 20, 1.7, 12000, 12120),
(5, 18, 1.5, 12120, 12230),
(5, 19, 1.3, 12230, 12320),
(6, 21, 2.0, 40000, 40140),
(6, 22, 1.8, 40140, 40270),
(6, 20, 1.5, 40270, 40380),
(7, 15, 1.4, 35000, 35100),
(7, 18, 1.6, 35100, 35230),
(7, 16, 1.2, 35230, 35320),
(8, 23, 1.5, 45000, 45120),
(8, 25, 1.3, 45120, 45230),
(8, 22, 1.7, 45230, 45370),
(9, 14, 1.2, 25000, 25090),
(9, 16, 1.0, 25090, 25170),
(9, 18, 1.4, 25170, 25270),
(10, 24, 1.9, 22000, 22150),
(10, 23, 1.7, 22150, 22270),
(10, 25, 1.8, 22270, 22400),
(11, 21, 2.0, 51000, 51150),
(11, 19, 1.7, 51150, 51270),
(11, 20, 1.9, 51270, 51400),
(12, 22, 1.6, 40050, 40200),
(12, 18, 1.3, 40200, 40330),
(12, 23, 2.0, 40330, 40480),
(13, 17, 1.5, 52000, 52120),
(13, 16, 1.2, 52120, 52240),
(13, 18, 1.7, 52240, 52360),
(14, 19, 1.8, 63000, 63180),
(14, 21, 2.2, 63180, 63360),
(14, 20, 1.9, 63360, 63520),
(15, 15, 1.4, 30050, 30120),
(15, 14, 1.2, 30120, 30170),
(15, 16, 1.5, 30170, 30260),
(16, 23, 2.0, 10000, 10100),
(16, 22, 1.8, 10100, 10200),
(16, 25, 2.1, 10200, 10320),
(17, 18, 1.4, 35000, 35150),
(17, 17, 1.5, 35150, 35280),
(17, 19, 1.7, 35280, 35420),
(18, 20, 1.8, 40000, 40180),
(18, 22, 2.0, 40180, 40300),
(18, 21, 1.9, 40300, 40420),
(19, 23, 1.5, 45000, 45180),
(19, 20, 2.0, 45000, 45180),
(19, 22, 1.8, 45180, 45300),
(19, 21, 2.1, 45300, 45450),
(20, 25, 1.9, 50000, 50180),
(20, 24, 1.7, 50180, 50300),
(20, 23, 1.8, 50300, 50420),
(21, 19, 1.5, 45000, 45150),
(21, 18, 1.4, 45150, 45270),
(21, 20, 1.6, 45270, 45400),
(22, 15, 1.3, 53000, 53130),
(22, 17, 1.4, 53130, 53250),
(22, 19, 1.5, 53250, 53380),
(23, 18, 1.6, 40000, 40160),
(23, 16, 1.3, 40160, 40270),
(23, 20, 1.7, 40270, 40400),
(24, 21, 1.8, 62000, 62180),
(24, 23, 2.0, 62180, 62340),
(24, 22, 1.9, 62340, 62460),
(25, 19, 1.5, 35000, 35160),
(25, 18, 1.4, 35160, 35280),
(25, 20, 1.6, 35280, 35400),
(26, 16, 1.2, 50000, 50120),
(26, 17, 1.3, 50120, 50230),
(26, 19, 1.5, 50230, 50350),
(27, 23, 1.8, 52000, 52180),
(27, 22, 1.7, 52180, 52300),
(27, 24, 2.0, 52300, 52440),
(28, 20, 1.5, 53000, 53150),
(28, 19, 1.6, 53150, 53270),
(28, 18, 1.4, 53270, 53380),
(29, 25, 2.0, 55000, 55180),
(29, 23, 1.9, 55180, 55300),
(29, 21, 1.8, 55300, 55420),
(30, 18, 1.4, 60000, 60120),
(30, 19, 1.6, 60120, 60240),
(30, 20, 1.8, 60240, 60360),
(31, 22, 1.9, 40000, 40190),
(31, 24, 2.1, 40190, 40320),
(31, 23, 1.8, 40320, 40440),
(32, 21, 1.7, 45000, 45170),
(32, 20, 1.6, 45170, 45300),
(32, 22, 1.8, 45300, 45420),
(33, 19, 1.5, 47000, 47150),
(33, 18, 1.4, 47150, 47270),
(33, 21, 1.7, 47270, 47400),
(34, 23, 1.9, 40000, 40190),
(34, 22, 1.8, 40190, 40310),
(34, 24, 2.1, 40310, 40450),
(35, 20, 1.6, 51000, 51160),
(35, 19, 1.5, 51160, 51280),
(35, 21, 1.7, 51280, 51400),
(36, 18, 1.4, 50000, 50120),
(36, 20, 1.6, 50120, 50240),
(36, 19, 1.5, 50240, 50350),
(37, 20, 1.8, 52000, 52180),
(37, 19, 1.7, 52180, 52300),
(37, 21, 1.9, 52300, 52450),
(38, 18, 1.5, 48000, 48150),
(38, 17, 1.4, 48150, 48260),
(38, 19, 1.6, 48260, 48380),
(39, 23, 1.8, 55000, 55180),
(39, 22, 1.7, 55180, 55300),
(39, 24, 2.0, 55300, 55440),
(40, 20, 1.6, 53000, 53160),
(40, 19, 1.5, 53160, 53280),
(40, 22, 1.8, 53280, 53400),
(41, 21, 1.7, 60000, 60170),
(41, 23, 1.9, 60170, 60300),
(41, 22, 1.8, 60300, 60420),
(42, 18, 1.4, 48000, 48140),
(42, 19, 1.5, 48140, 48260),
(42, 20, 1.6, 48260, 48380),
(43, 22, 1.9, 50000, 50180),
(43, 21, 1.8, 50180, 50300),
(43, 23, 2.0, 50300, 50430),
(44, 19, 1.5, 55000, 55150),
(44, 18, 1.4, 55150, 55260),
(44, 21, 1.7, 55260, 55380),
(45, 24, 2.0, 54000, 54180),
(45, 22, 1.9, 54180, 54300),
(45, 23, 2.1, 54300, 54420),
(46, 19, 1.5, 51000, 51150),
(46, 20, 1.6, 51150, 51270),
(46, 18, 1.4, 51270, 51380),
(47, 20, 1.7, 53000, 53170),
(47, 21, 1.8, 53170, 53300),
(47, 23, 2.0, 53300, 53420),
(48, 22, 1.8, 57000, 57180),
(48, 21, 1.7, 57180, 57300),
(48, 24, 2.1, 57300, 57450),
(49, 19, 1.6, 59000, 59160),
(49, 18, 1.5, 59160, 59280),
(49, 22, 1.8, 59280, 59400),
(50, 20, 1.7, 60000, 60170),
(50, 21, 1.8, 60170, 60300),
(50, 23, 2.0, 60300, 60420),
(51, 22, 1.9, 64000, 64190),
(51, 21, 1.8, 64190, 64310),
(51, 23, 2.0, 64310, 64430),
(52, 24, 2.1, 55000, 55180),
(52, 22, 1.9, 55180, 55300),
(52, 21, 1.8, 55300, 55420),
(53, 19, 1.6, 56000, 56160),
(53, 20, 1.7, 56160, 56280),
(53, 18, 1.5, 56280, 56390),
(54, 20, 1.7, 60000, 60170),
(54, 21, 1.8, 60170, 60300),
(54, 23, 2.0, 60300, 60420),
(55, 22, 1.9, 63000, 63190),
(55, 21, 1.8, 63190, 63310),
(55, 24, 2.1, 63310, 63450);

INSERT INTO BakimGecmisiTB (AracID, BakimTarihi, KullanilanParcalar, YapilanIslemler) VALUES 
(1, '2024-01-15', 'Pil, Lastik', 'Pil deðiþimi, Lastik kontrolü'),
(2, '2024-02-10', 'Fren Balatasý', 'Fren kontrolü'),
(3, '2024-03-05', 'Filtre', 'Hava filtresi deðiþimi'),
(4, '2024-04-01', 'Lastik', 'Lastik deðiþimi'),
(5, '2024-05-10', 'Pil', 'Pil kontrolü'),
(6, '2024-06-15', 'Motor Yaðý', 'Yað deðiþimi'),
(7, '2024-07-20', 'Fren Sistemi', 'Fren tamiri'),
(8, '2024-08-25', 'Þanzýman', 'Þanzýman bakýmý'),
(9, '2024-09-30', 'Pil', 'Pil yenileme'),
(10, '2024-10-05', 'Far', 'Far kontrolü'),
(11, '2024-10-15', 'Lastik', 'Lastik deðiþimi'),
(12, '2024-10-20', 'Filtre', 'Hava filtresi deðiþimi'),
(13, '2024-11-01', 'Motor Sistemi', 'Motor tamiri'),
(14, '2024-11-10', 'Pil', 'Pil yenileme'),
(15, '2024-11-15', 'Lastik', 'Lastik deðiþimi'),
(16, '2024-11-20', 'Fren Balatasý', 'Fren kontrolü'),
(17, '2024-11-25', 'Motor Yaðý', 'Yað deðiþimi'),
(18, '2024-12-01', 'Pil, Lastik', 'Pil deðiþimi, Lastik kontrolü'),
(19, '2024-12-05', 'Þanzýman', 'Þanzýman bakýmý'),
(20, '2024-12-10', 'Fren Sistemi', 'Fren tamiri'),
(21, '2024-12-15', 'Filtre', 'Hava filtresi deðiþimi'),
(22, '2024-12-20', 'Lastik', 'Lastik deðiþimi'),
(23, '2024-12-25', 'Pil', 'Pil kontrolü'),
(24, '2025-01-01', 'Motor Sistemi', 'Motor tamiri'),
(25, '2025-01-10', 'Fren Balatasý', 'Fren kontrolü'),
(26, '2025-01-15', 'Far', 'Far kontrolü'),
(27, '2025-01-20', 'Lastik', 'Lastik deðiþimi'),
(28, '2025-01-25', 'Filtre', 'Hava filtresi deðiþimi'),
(29, '2025-02-01', 'Motor Yaðý', 'Yað deðiþimi'),
(30, '2025-02-05', 'Pil', 'Pil yenileme'),
(31, '2025-02-10', 'Þanzýman', 'Þanzýman bakýmý'),
(32, '2025-02-15', 'Fren Sistemi', 'Fren tamiri'),
(33, '2025-02-20', 'Filtre', 'Hava filtresi deðiþimi'),
(34, '2025-02-25', 'Lastik', 'Lastik deðiþimi'),
(35, '2025-03-01', 'Pil', 'Pil kontrolü'),
(36, '2025-03-05', 'Motor Sistemi', 'Motor tamiri'),
(37, '2025-03-10', 'Fren Balatasý', 'Fren kontrolü'),
(38, '2025-03-15', 'Far', 'Far kontrolü'),
(39, '2025-03-20', 'Lastik', 'Lastik deðiþimi'),
(40, '2025-03-25', 'Filtre', 'Hava filtresi deðiþimi'),
(41, '2025-04-01', 'Motor Yaðý', 'Yað deðiþimi'),
(42, '2025-04-05', 'Pil', 'Pil yenileme'),
(43, '2025-04-10', 'Þanzýman', 'Þanzýman bakýmý'),
(44, '2025-04-15', 'Fren Sistemi', 'Fren tamiri'),
(45, '2025-04-20', 'Filtre', 'Hava filtresi deðiþimi');
INSERT INTO PersonelTB (AdSoyad, Gorev, IseGiris) VALUES 
('Fatma Aydýn', 'Tekniker', '2023-01-10'),
('Hasan Çelik', 'Müdür', '2022-06-15'),
('Elif Demir', 'Temizlik', '2021-03-20'),
('Mehmet Yýlmaz', 'Tekniker', '2022-01-05'),
('Zeynep Kaya', 'Müdür Yardýmcýsý', '2022-07-12'),
('Ali Demir', 'Temizlik', '2021-11-01'),
('Ayþe Karaca', 'Büro Personeli', '2023-02-15'),
('Hüseyin Þahin', 'Tekniker', '2021-09-20'),
('Aylin Çolak', 'Satýn Alma Sorumlusu', '2023-06-10'),
('Serkan Aksoy', 'Büro Personeli', '2022-03-25'),
('Emine Ercan', 'Tekniker', '2023-04-18'),
('Kaan Yavuz', 'Tekniker', '2021-05-10'),
('Onur Kýlýç', 'Tekniker', '2022-08-05'),
('Mehmet Özkan', 'Tekniker', '2022-12-01'),
('Elif Yýldýz', 'Tekniker', '2023-01-25'),
('Ahmet Bozkurt', 'Tekniker', '2021-02-15'),
('Selin Öztürk', 'Satýn Alma Sorumlusu', '2023-03-02'),
('Cemre Duran', 'Tekniker', '2022-04-10'),
('Berkay Kýzýl', 'Temizlik', '2023-07-05');
INSERT INTO SarjIstasyonuTB (Adres, Kapasite, PersonelID, MevcutDurum, SonBakim) VALUES
('Malatya Merkez, Ýnönü Cad.', 10, 15, 1, '2024-02-01'),
('Ýstanbul Kadýköy, Moda Sok.', 15, 4, 0, '2024-01-25'),
('Ankara Kýzýlay, Atatürk Bul.', 12, 17, 1, '2024-03-01'),
('Ýstanbul Beþiktaþ, Barbaros Bul.', 12, 4, 1, '2024-02-05'),
('Ankara Çankaya, Tunali Hilmi Cd.', 14, 17, 0, '2024-01-15'),
('Ýzmir Konak, Kýbrýs Þehitleri Cd.', 10, 18, 1, '2024-03-03'),
('Antalya Muratpaþa, Atatürk Bul.', 5, 19, 1, '2024-01-20'),
('Ýstanbul Üsküdar, Çarþý Cd.', 12, 4, 0, '2024-02-10'),
('Ankara Yenimahalle, Atakent Cd.', 8, 17, 1, '2024-01-10'),
('Ýzmir Karþýyaka, Atakent Cd.', 10, 18, 1, '2024-03-01'),
('Antalya Kepez, Dokuma Cd.', 5, 19, 0, '2024-02-15'),
('Elazýð Merkez, Zübeyde Haným Cd.', 4, 12, 1, '2024-01-25'),
('Diyarbakýr Yeniþehir, Çevre Yolu Cd.', 4, 13, 1, '2024-03-05'),
('Adýyaman Merkez, Cumhuriyet Cd.', 5, 14, 0, '2024-02-20'),
('Ýstanbul Kartal, Yakacýk Cd.', 15, 4, 1, '2024-01-30'),
('Ýstanbul Bakýrköy, Ataköy Cd.', 15, 16, 1, '2024-02-10'),
('Ankara Sincan, Organize Sanayi Bölgesi', 7, 1, 1, '2024-03-02'),
('Ýzmir Bayraklý, 9 Eylül Üniversitesi Yolu', 12, 8, 1, '2024-01-10'),
('Antalya Lara, Yüzüncü Yýl Cd.', 5, 11, 1, '2024-02-25'),
('Elazýð Merkez, Hoca Ahmet Yesevi Cd.', 4, 12, 0, '2024-03-01'),
('Diyarbakýr Baðlar, Diyarbakýr Cd.', 5, 13, 1, '2024-01-10'),
('Adýyaman Kahta, Ýskenderpaþa Mah.', 4, 14, 1, '2024-03-03'),
('Ýstanbul Þiþli, Halaskargazi Cd.', 12, 16, 0, '2024-01-15'),
('Ankara Kýzýlay, Sakarya Cd.', 8, 1, 1, '2024-02-05'),
('Ýzmir Gaziemir, 9 Eylül Mah.', 10, 8, 0, '2024-02-15'),
('Antalya Konyaaltý, Arapsuyu Mah.', 5, 11, 1, '2024-03-10'),
('Elazýð Merkez, Cumhuriyet Mah.', 4, 12, 1, '2024-02-25'),
('Diyarbakýr Sur, Gazi Cd.', 5, 13, 1, '2024-01-05'),
('Adýyaman Merkez, Varlýk Mah.', 4, 14, 1, '2024-03-01'),
('Ýstanbul Beyoðlu, Taksim Meydaný', 10, 16, 0, '2024-01-20');
INSERT INTO FaturaTB (MusteriID, IstasyonID, FaturaTarihi, Tutar) VALUES
( 1, 1, '2024-02-15', 100.50),
( 1, 2, '2024-03-10', 75.00),
( 1, 3, '2024-03-20', 120.25),
( 2, 4, '2024-04-15', 80.50),
(2, 5, '2024-05-10', 95.00),
(2, 6, '2024-06-20', 110.75),
(3, 7, '2024-07-25', 105.00),
(3, 8, '2024-08-15', 90.50),
(3, 9, '2024-09-10', 130.25),
( 4, 10, '2024-10-01', 140.50),
( 4, 11, '2024-10-20', 85.00),
( 4, 12, '2024-11-01', 125.00),
( 5, 13, '2024-11-15', 100.00),
( 5, 14, '2024-11-25', 75.75),
( 5, 15, '2024-12-01', 95.50),
( 6, 16, '2024-01-10', 110.00),
( 6, 17, '2024-02-05', 115.75),
( 6, 18, '2024-03-03', 125.50),
( 7, 19, '2024-03-15', 85.00),
( 7, 20, '2024-04-12', 95.25),
( 7, 21, '2024-05-25', 90.75),
( 8, 22, '2024-06-01', 100.50),
( 8, 23, '2024-06-15', 105.00),
( 8, 24, '2024-07-05', 120.25),
( 9, 25, '2024-07-10', 110.00),
( 9, 26, '2024-08-15', 100.50),
( 9, 27, '2024-08-25', 95.75),
( 10, 28, '2024-09-10', 115.00),
( 10, 29, '2024-09-25', 105.50),
( 10, 30, '2024-10-15', 90.00),
( 11, 1, '2024-10-30', 125.75),
( 11, 2, '2024-11-10', 130.50),
( 11, 3, '2024-11-25', 140.00),
( 12, 4, '2024-12-01', 135.75),
( 12, 5, '2024-12-15', 110.50),
( 12, 6, '2025-01-01', 120.25),
( 13, 7, '2025-01-10', 130.00),
( 13, 8, '2025-01-25', 115.50),
( 13, 9, '2025-02-05', 95.75),
( 14, 10, '2025-02-20', 90.50),
( 14, 11, '2025-02-28', 105.25),
( 14, 12, '2025-03-10', 115.75),
( 15, 13, '2025-03-20', 120.50),
( 15, 14, '2025-03-30', 125.00),
( 15, 15, '2025-04-10', 110.75),
( 16, 16, '2024-11-10', 115.50),
( 16, 17, '2024-11-25', 120.75),
( 16, 18, '2024-12-05', 125.00),
( 17, 19, '2024-12-15', 95.75),
( 17, 20, '2024-12-25', 100.50),
( 17, 21, '2025-01-10', 105.25),
( 18, 22, '2025-01-15', 110.50),
( 18, 23, '2025-01-30', 115.75),
( 18, 24, '2025-02-10', 120.00),
( 19, 25, '2025-02-15', 130.50),
( 19, 26, '2025-02-28', 135.75),
( 19, 27, '2025-03-10', 140.00),
( 20, 28, '2025-03-15', 95.50),
( 20, 29, '2025-03-25', 100.25),
( 20, 30, '2025-04-05', 105.75),
( 21, 1, '2025-04-10', 110.00),
( 21, 2, '2025-04-20', 115.50),
( 21, 3, '2025-05-01', 120.75),
( 22, 4, '2025-05-10', 125.00),
( 22, 5, '2025-05-20', 130.50),
( 22, 6, '2025-05-30', 135.75),
( 23, 7, '2025-06-10', 95.00),
( 23, 8, '2025-06-20', 100.75),
( 23, 9, '2025-07-01', 105.50),
( 24, 10, '2025-07-10', 110.25),
( 24, 11, '2025-07-20', 115.00),
( 24, 12, '2025-08-01', 120.75),
( 25, 13, '2025-08-10', 125.50),
( 25, 14, '2025-08-20', 130.25),
( 25, 15, '2025-09-01', 135.00),
( 26, 16, '2025-09-10', 140.50),
( 26, 17, '2025-09-20', 95.25),
( 26, 18, '2025-10-01', 100.50),
( 27, 19, '2025-10-10', 105.00),
( 27, 20, '2025-10-20', 110.75),
( 27, 21, '2025-11-01', 115.50),
( 28, 22, '2025-11-10', 120.25),
( 28, 23, '2025-11-20', 125.00),
( 28, 24, '2025-12-01', 130.50),
( 29, 25, '2025-12-10', 135.75),
( 29, 26, '2025-12-20', 140.00),
( 29, 27, '2026-01-01', 95.50),
( 30, 28, '2026-01-10', 100.25),
( 30, 29, '2026-01-20', 105.00),
( 31, 1, '2026-02-01', 100.25),
( 31, 2, '2026-02-10', 105.50),
( 31, 3, '2026-02-20', 110.75),
( 32, 4, '2026-03-01', 115.00),
( 32, 5, '2026-03-10', 120.25),
( 32, 6, '2026-03-20', 125.50),
( 33, 7, '2026-04-01', 130.75),
( 33, 8, '2026-04-10', 135.00),
( 33, 9, '2026-04-20', 95.25),
( 34, 10, '2026-05-01', 100.50),
( 34, 11, '2026-05-10', 105.75),
( 34, 12, '2026-05-20', 110.00),
( 35, 13, '2026-06-01', 115.25),
( 35, 14, '2026-06-10', 120.50),
( 35, 15, '2026-06-20', 125.75),
( 36, 16, '2026-07-01', 130.00),
( 36, 17, '2026-07-10', 135.25),
( 36, 18, '2026-07-20', 95.50),
( 37, 19, '2026-08-01', 100.75),
( 37, 20, '2026-08-10', 105.00),
( 37, 21, '2026-08-20', 110.25),
( 38, 22, '2026-09-01', 115.50),
( 38, 23, '2026-09-10', 120.75),
( 38, 24, '2026-09-20', 125.00),
( 39, 25, '2026-10-01', 130.25),
( 39, 26, '2026-10-10', 135.50),
( 39, 27, '2026-10-20', 95.75),
( 40, 28, '2026-11-01', 100.00),
( 40, 29, '2026-11-10', 105.25),
( 40, 30, '2026-11-20', 110.50),
( 41, 1, '2026-12-01', 115.75),
( 41, 2, '2026-12-10', 120.00),
( 41, 3, '2026-12-20', 125.25),
( 42, 4, '2027-01-01', 130.50),
( 42, 5, '2027-01-10', 135.75),
( 42, 6, '2027-01-20', 95.00),
( 43, 7, '2027-02-01', 100.25),
( 43, 8, '2027-02-10', 105.50),
( 43, 9, '2027-02-20', 110.75),
( 44, 10, '2027-03-01', 115.00),
( 44, 11, '2027-03-10', 120.25),
( 44, 12, '2027-03-20', 125.50),
( 45, 13, '2027-04-01', 130.75),
( 45, 14, '2027-04-10', 135.00),
( 45, 15, '2027-04-20', 95.25),
( 46, 16, '2027-05-01', 100.50),
( 46, 17, '2027-05-10', 105.75),
( 46, 18, '2027-05-20', 110.00),
( 47, 19, '2027-06-01', 115.25),
( 47, 20, '2027-06-10', 120.50),
( 47, 21, '2027-06-20', 125.75),
( 48, 22, '2027-07-01', 130.00),
( 48, 23, '2027-07-10', 135.25),
( 48, 24, '2027-07-20', 95.50),
( 49, 25, '2027-08-01', 100.75),
( 49, 26, '2027-08-10', 105.00),
( 49, 27, '2027-08-20', 110.25),
( 50, 28, '2027-09-01', 115.50),
( 50, 29, '2027-09-10', 120.75),
( 50, 30, '2027-09-20', 125.00);

--Stored Procedure'ler
GO
CREATE PROCEDURE AddArac
    @MusteriID INT,
    @Marka NVARCHAR(50),
    @Model NVARCHAR(50),
	@KM INT,
	@PilDurumu INT,
    @SonBakim DATETIME
AS
BEGIN
    INSERT INTO AracTB (MusteriID, Marka, Model, KM, PilDurumu, SonBakim)
    VALUES (@MusteriID, @Marka, @Model, @KM, @PilDurumu, @SonBakim);
END;
GO

CREATE PROCEDURE UpdateArac
    @AracID INT,
    @MusteriID INT,
    @Marka NVARCHAR(50),
    @Model NVARCHAR(50),
    @KM INT,
	@PilDurumu INT,
    @SonBakim DATETIME
AS
BEGIN
    UPDATE AracTB
    SET MusteriID = @MusteriID,
        Marka = @Marka,
        Model = @Model,
		KM = @KM,
        PilDurumu = @PilDurumu,
        SonBakim = @SonBakim
    WHERE AracID = @AracID;
END;
GO

CREATE PROCEDURE DeleteArac
    @AracID INT
AS
BEGIN
    DELETE FROM AracTB
    WHERE AracID = @AracID;
END;
GO


CREATE PROCEDURE GetAracByMarka
    @Marka NVARCHAR(50)
AS
BEGIN
    SELECT AracID, MusteriID, Marka, Model, KM, PilDurumu, SonBakim
    FROM AracTB
    WHERE Marka = @Marka;
END;
GO

--STORED PROCEDURE KULLANIM ÖRNEKLERÝ
--Yeni Araç Ekleme
EXEC AddArac 
    @MusteriID = 1,  
    @Marka = 'Tesla',  
    @Model = 'Model S',  
    @KM = 5000,
	@PilDurumu = 80,
    @SonBakim = '2024-12-30';

--Arac güncelleme
EXEC UpdateArac
    @AracID = 1,  
    @MusteriID = 2,  
    @Marka = 'Tesla',  
    @Model = 'Model S',  
    @KM = 50000,
	@PilDurumu = 90,
    @SonBakim = '2024-12-31';

--Arac silme
EXEC DeleteArac 
    @AracID = 56;


--Markaya Göre Araç Listeleme
EXEC GetAracByMarka 
    @Marka = 'Tesla';


--TRIGGERS

--Müsteri silindiðinde ilgili Araçlarýn silinmesi
CREATE TRIGGER tr_DeleteMusteri
ON MusteriTB
AFTER DELETE
AS
BEGIN
    -- Silinen müþteri kaydýndan MusteriID'yi alýyoruz
    DECLARE @MusteriID INT;

    -- Silinen müþteri kaydýndan MusteriID'yi alýyoruz
    SELECT @MusteriID = MusteriID FROM deleted;

    -- Bu MusteriID'ye ait araçlarý AracTB tablosundan siliyoruz
    DELETE FROM AracTB
    WHERE MusteriID = @MusteriID;
END;

--Bakým Kaydý Eklendiðinde Araç Son Bakým Tarihinin Güncellenmesi
CREATE TRIGGER tr_UpdateSonBakim
ON BakimGecmisiTB
AFTER INSERT
AS
BEGIN
    -- Yeni eklenen bakým kaydýndan AracID'yi alýyoruz
    DECLARE @AracID INT;
    DECLARE @YeniBakimTarihi DATETIME;

    -- 'inserted' tablosundan yeni kaydýn AracID ve BakimTarihi bilgilerini alýyoruz
    SELECT @AracID = AracID, @YeniBakimTarihi = BakimTarihi
    FROM inserted;

    -- AracTB tablosunda ilgili AracID'ye sahip aracýn SonBakim tarihini güncelliyoruz
    UPDATE AracTB
    SET SonBakim = @YeniBakimTarihi
    WHERE AracID = @AracID;
END;

CREATE TRIGGER tr_UpdateBakiye
ON FaturaTB
AFTER INSERT
AS
BEGIN
    -- Transaction baþlatýlýyor
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Yeni eklenen fatura kaydýndan MusteriID ve Tutar bilgilerini alýyoruz
        DECLARE @MusteriID INT;
        DECLARE @Tutar DECIMAL(8,2);

        -- 'inserted' tablosundan yeni kaydýn MusteriID ve Tutar bilgilerini alýyoruz
        SELECT @MusteriID = MusteriID, @Tutar = Tutar
        FROM inserted;

        -- MusteriTB tablosunda ilgili MusteriID'ye sahip müþterinin Bakiye deðerini güncelliyoruz
        UPDATE MusteriTB
        SET Bakiye = Bakiye - @Tutar
        WHERE MusteriID = @MusteriID;

        -- Bakiye deðeri sýfýrýn altýna inip inmediðini kontrol ediyoruz
        IF EXISTS (SELECT 1 FROM MusteriTB WHERE MusteriID = @MusteriID AND Bakiye < 0)
        BEGIN
            -- Eðer bakiye negatifse, iþlemi geri alýyoruz
            ROLLBACK TRANSACTION;
            PRINT 'Bakiye sýfýrýn altýna inemez!';
        END
        ELSE
        BEGIN
            -- Bakiye negatif deðilse, iþlemi onaylýyoruz
            COMMIT TRANSACTION;
        END
    END TRY
    BEGIN CATCH
        -- Hata durumunda transaction geri alýnýyor
        ROLLBACK TRANSACTION;
        PRINT 'Bir hata oluþtu, iþlem geri alýndý!';
    END CATCH;
END;




CREATE TRIGGER tr_PilDurumuGuncelle
ON SurusGecmisiTB
AFTER INSERT
AS
BEGIN
    DECLARE @AracID INT;
    DECLARE @PilKullanýmý INT;
    DECLARE @PilDurumu INT;

    -- Yeni eklenen kaydýn arac_id ve pil_kullanimi verilerini alýyoruz
    SELECT @AracID = AracID, @PilKullanýmý = PilKullanimi
    FROM INSERTED;

    -- Mevcut pil seviyesini alýyoruz
    SELECT @PilDurumu = PilDurumu
    FROM aracTB
    WHERE AracID = @AracID;

    -- Pil seviyesini güncelliyoruz
    UPDATE aracTB
    SET PilDurumu = @PilDurumu - @PilKullanýmý
    WHERE AracID = @AracID;

    -- Pil seviyesinin sýfýrýn altýna inmesini engelliyoruz
    IF (SELECT PilDurumu FROM aracTB WHERE @AracID = @AracID) < 0
    BEGIN
        -- Eðer pil seviyesi negatifse iþlemi geri alýyoruz.
        ROLLBACK TRANSACTION;
        PRINT 'Pil seviyesi sýfýrýn altýna inemez!';
    END
END;

