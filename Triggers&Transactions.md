### 1. **Trigger 1: Müşteri Silindiğinde İlgili Araçların Silinmesi**
**Trigger Adı:** `tr_DeleteMusteri`  
**Ne İşe Yarar:**  
Bu trigger, **MusteriTB** tablosundaki bir müşteri kaydı silindiğinde, o müşteriye ait tüm araçların **AracTB** tablosundan silinmesini sağlar. Bu işlem, müşteri silindiğinde veri tutarlılığını korumak için yapılır.

```sql
CREATE TRIGGER tr_DeleteMusteri
ON MusteriTB
AFTER DELETE
AS
BEGIN
    -- Silinen müşteri kaydından MusteriID'yi alıyoruz
    DECLARE @MusteriID INT;

    -- Silinen müşteri kaydından MusteriID'yi alıyoruz
    SELECT @MusteriID = MusteriID FROM deleted;

    -- Bu MusteriID'ye ait araçları AracTB tablosundan siliyoruz
    DELETE FROM AracTB
    WHERE MusteriID = @MusteriID;
END;
```

**Açıklama:**  
- **AFTER DELETE**: **MusteriTB** tablosundan bir müşteri silindiğinde tetiklenir.
- **deleted** tablosu, silinen kayıtları tutar. Bu tablodan, silinen müşterinin **MusteriID**'sini alıyoruz.
- **AracTB** tablosunda, bu **MusteriID**'ye sahip araçları siliyoruz.

---

### 2. **Trigger 2: Bakım Kaydı Eklendiğinde Araç Son Bakım Tarihinin Güncellenmesi**
**Trigger Adı:** `tr_UpdateSonBakim`  
**Ne İşe Yarar:**  
Bu trigger, **BakimGecmisiTB** tablosuna bir yeni bakım kaydı eklendiğinde, o aracın **SonBakim** tarihini **AracTB** tablosunda günceller.

```sql
CREATE TRIGGER tr_UpdateSonBakim
ON BakimGecmisiTB
AFTER INSERT
AS
BEGIN
    -- Yeni eklenen bakım kaydından AracID'yi alıyoruz
    DECLARE @AracID INT;
    DECLARE @YeniBakimTarihi DATETIME;

    -- 'inserted' tablosundan yeni kaydın AracID ve BakimTarihi bilgilerini alıyoruz
    SELECT @AracID = AracID, @YeniBakimTarihi = BakimTarihi
    FROM inserted;

    -- AracTB tablosunda ilgili AracID'ye sahip aracın SonBakim tarihini güncelliyoruz
    UPDATE AracTB
    SET SonBakim = @YeniBakimTarihi
    WHERE AracID = @AracID;
END;
```

**Açıklama:**  
- **AFTER INSERT**: **BakimGecmisiTB** tablosuna yeni bir bakım kaydı eklendiğinde tetiklenir.
- **inserted** tablosu, yeni eklenen kayıtları tutar. Bu tablodan, eklenen bakım kaydının **AracID** ve **BakimTarihi** değerlerini alıyoruz.
- **AracTB** tablosunda, bu **AracID**'ye sahip aracın **SonBakim** tarihini güncelliyoruz.

---

### 3. **Trigger 3: Fatura Eklendiğinde Müşteri Bakiye Değerinin Azaltılması**
**Trigger Adı:** `tr_UpdateBakiye`  
**Ne İşe Yarar:**  
Bu trigger, **FaturaTB** tablosuna bir yeni fatura kaydı eklendiğinde, faturadaki **tutar** değerine göre **MusteriTB** tablosundaki ilgili müşterinin **Bakiye** değerini azaltır.

```sql
CREATE TRIGGER tr_UpdateBakiye
ON FaturaTB
AFTER INSERT
AS
BEGIN
    -- Transaction başlatılıyor
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Yeni eklenen fatura kaydından MusteriID ve Tutar bilgilerini alıyoruz
        DECLARE @MusteriID INT;
        DECLARE @Tutar DECIMAL(8,2);

        -- 'inserted' tablosundan yeni kaydın MusteriID ve Tutar bilgilerini alıyoruz
        SELECT @MusteriID = MusteriID, @Tutar = Tutar
        FROM inserted;

        -- MusteriTB tablosunda ilgili MusteriID'ye sahip müşterinin Bakiye değerini güncelliyoruz
        UPDATE MusteriTB
        SET Bakiye = Bakiye - @Tutar
        WHERE MusteriID = @MusteriID;

        -- Bakiye değeri sıfırın altına inip inmediğini kontrol ediyoruz
        IF EXISTS (SELECT 1 FROM MusteriTB WHERE MusteriID = @MusteriID AND Bakiye < 0)
        BEGIN
            -- Eğer bakiye negatifse, işlemi geri alıyoruz
            ROLLBACK TRANSACTION;
            PRINT 'Bakiye sıfırın altına inemez!';
        END
        ELSE
        BEGIN
            -- Bakiye negatif değilse, işlemi onaylıyoruz
            COMMIT TRANSACTION;
        END
    END TRY
    BEGIN CATCH
        -- Hata durumunda transaction geri alınıyor
        ROLLBACK TRANSACTION;
        PRINT 'Bir hata oluştu, işlem geri alındı!';
    END CATCH;
END;
```

**Açıklama:**  
- **AFTER INSERT**: **FaturaTB** tablosuna yeni bir fatura kaydı eklendiğinde tetiklenir.
- **inserted** tablosu, yeni eklenen kayıtları tutar. Bu tablodan, faturanın **MusteriID** ve **Tutar** bilgilerini alıyoruz.
- **MusteriTB** tablosunda, bu **MusteriID**'ye sahip müşterinin **Bakiye** değerini **Tutar** kadar azaltıyoruz.

---

### 4. **Trigger 4: pil kullanımında mevcut pil durumunun değişimi**
**Trigger Adı:** `tr_PilDurumuGuncelle`  
**Ne İşe Yarar:**  
Bu trigger, **SurusGecmisiTB** tablosuna bir yeni sürüş kaydı eklendiğinde, Aractaki **PilDurumu** değerine göre **AracTB** tablosundaki ilgili aracın **PilDurumu** değerini azaltır.

```sql
CREATE TRIGGER tr_PilDurumuGuncelle
ON SurusGecmisiTB
AFTER INSERT
AS
BEGIN
    DECLARE @AracID INT;
    DECLARE @PilKullanimi INT;
    DECLARE @PilDurumu INT;

    -- Yeni eklenen kaydın arac_id ve pil_kullanimi verilerini alıyoruz
    SELECT @AracID = AracID, @PilKullanimi = PilKullanimi
    FROM INSERTED;

    -- Mevcut pil seviyesini alıyoruz
    SELECT @PilDurumu = PilDurumu
    FROM aracTB
    WHERE AracID = @AracID;

    -- Pil seviyesini güncelliyoruz
    UPDATE aracTB
    SET PilDurumu = @PilDurumu - @PilKullanimi
    WHERE AracID = @AracID;

    -- Pil seviyesinin sıfırın altına inmesini engelliyoruz
    IF (SELECT PilDurumu FROM aracTB WHERE @AracID = @AracID) < 0
    BEGIN
        -- Eğer pil seviyesi negatifse işlemi geri alıyoruz.
        ROLLBACK TRANSACTION;
        PRINT 'Pil seviyesi sıfırın altına inemez!';
    END
END;
```

**Açıklama:**  
- **AFTER INSERT**: **SurusGecmisiTB** tablosuna yeni bir sürüş kaydı eklendiğinde tetiklenir.
- **inserted** tablosu, yeni eklenen kayıtları tutar. Bu tablodan, aracın **AracID** ve **PilDurumu** bilgilerini alıyoruz.
- **AracTB** tablosunda, bu **AracID**'ye sahip aracın **PilDurumu** değerini **PilKullanimi** kadar azaltıyoruz.

---

