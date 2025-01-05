# Stored Procedure Raporu - Araç Tablosu İşlemleri

Bu rapor, **ElektriklArac** veritabanı üzerinde yapılacak olan CRUD (Create, Read, Update, Delete) işlemleri için kullanılan SQL **Stored Procedure**'leri içermektedir.

## 1. **AddArac** - Araç Ekleme Stored Procedure

**İşlevi**: Bu prosedür, yeni bir araç kaydını **AracTB** tablosuna ekler. **AracID** otomatik olarak atanır çünkü **AracID** sütunu **IDENTITY** olarak tanımlanmıştır.

```sql
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
```

**Açıklama**:  
- **@MusteriID**: Aracın ait olduğu müşteri ID'si.
- **@Marka**: Araç markası.
- **@Model**: Araç modeli.
- **@KM**: Aracın mevcut km durumu.
- **@PilDurumu**: Aracın mevcut pil durumu.
- **@SonBakim**: Araç için son bakım tarihi.

---

## 2. **UpdateArac** - Araç Güncelleme Stored Procedure

**İşlevi**: Bu prosedür, **AracTB** tablosunda mevcut bir araç kaydını günceller. Güncelleme işlemi, aracın **AracID**'sine göre yapılır.

```sql
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
```

**Açıklama**:  
- **@AracID**: Güncellenecek aracın ID'si.
- **@MusteriID**: Aracın ait olduğu yeni müşteri ID'si.
- **@Marka**: Yeni araç markası.
- **@Model**: Yeni araç modeli.
- **@KM**: Aracın mevcut km durumu.
- **@PilDurumu**: Aracın mevcut pil durumu.
- **@SonBakim**: Yeni son bakım tarihi.

---

## 3. **DeleteArac** - Araç Silme Stored Procedure

**İşlevi**: Bu prosedür, **AracTB** tablosundan bir araç kaydını siler. Silme işlemi **AracID**'ye göre yapılır.

```sql
CREATE PROCEDURE DeleteArac
    @AracID INT
AS
BEGIN
    DELETE FROM AracTB
    WHERE AracID = @AracID;
END;
```

**Açıklama**:  
- **@AracID**: Silinecek aracın ID'si.


## 4. **GetAracByMarka** - Marka Adına Göre Araçları Listeleme Stored Procedure

**İşlevi**: Bu prosedür, belirli bir markaya ait araçları **AracTB** tablosundan sorgular ve listeler.

```sql
CREATE PROCEDURE GetAracByMarka
    @Marka NVARCHAR(50)
AS
BEGIN
    SELECT AracID, MusteriID, Marka, Model, KM, PilDurumu, SonBakim
    FROM AracTB
    WHERE Marka = @Marka;
END;
```



# Kullanım Örnekleri

Aşağıda, tüm prosedürlerin nasıl kullanılacağına dair örnekler bulunmaktadır:

1. **Yeni Araç Ekleme**:

```sql
EXEC UpdateArac
    @AracID = 1,  
    @MusteriID = 2,  
    @Marka = 'Tesla',  
    @Model = 'Model S',  
    @KM = 50000,
	  @PilDurumu = 90,
    @SonBakim = '2024-12-31';
```

2. **Araç Güncelleme**:

```sql
EXEC UpdateArac
    @AracID = 1,  
    @MusteriID = 2,  
    @Marka = 'Tesla',  
    @Model = 'Model S',  
    @KM = 50000,
	  @PilDurumu = 90,
    @SonBakim = '2024-12-31';
```

3. **Araç Silme**:

```sql
EXEC DeleteArac 
    @AracID = 56;
```

4. **Markaya Göre Araçları Listeleme**:

```sql
EXEC GetAracByMarka 
    @Marka = 'Tesla';
```
