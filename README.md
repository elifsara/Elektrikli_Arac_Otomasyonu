# BMÜ329 Veri Tabanı Sistemleri Dersi Dönem Projesi Gereksinimleri ve E-R Diyagramı

## Proje Adı: Elektrikli Araç Otomasyonu

### Proje Ekibindeki Kişiler
- Elif Sara HAN
- Fatma BEYAZ
- Melih UĞURLU

Elektrikli Araç Otomasyonu veri tabanı projesinin gereksinim detayları aşağıda açıklanmaktadır. Projede yer alan varlıklar, bu varlıkların sahip olduğu nitelikler ve aralarındaki ilişkiler belirtilmiştir. Her varlık, ilişkili olduğu diğer varlıklarla zengin bir ilişki yapısına sahiptir.

### Gereksinimler

#### Müşteri Gereksinimleri

| Gereksinim                       | Açıklama                                                                            |
|----------------------------------|--------------------------------------------------------------------------------------|
| Araç Bilgilerini Görüntüleme     | Müşteri, sahip olduğu araç bilgilerini görüntüleyebilir.                             |
| Şarj ve Batarya Durum Takibi     | Müşteri, araçlarının şarj durumunu ve batarya seviyesini takip edebilir.             |
| Bakım Geçmişine Erişim           | Müşteri, araçlarının bakım geçmişine erişebilir.                                     |
| Fatura Görüntüleme ve Ödeme      | Müşteri, fatura bilgilerini görüntüleyebilir ve ödeme yapabilir.                     |
| Şarj İstasyonlarına Erişim       | Müşteri, şarj istasyonlarının konum ve durum bilgilerine erişebilir.                 |

#### Personel Gereksinimleri

| Gereksinim                       | Açıklama                                                                            |
|----------------------------------|--------------------------------------------------------------------------------------|
| Şarj İstasyonu Yönetimi          | Personel, şarj istasyonlarının durumunu yönetebilir ve güncelleyebilir.              |
| Bakım ve Operasyon Takibi        | Personel, sorumlu olduğu şarj istasyonlarının bakım ve operasyonel süreçlerini takip edebilir. |
| Şarj İşlemlerini Denetleme       | Personel, şarj işlemlerini denetleyebilir.                                           |
| Müşteri Destek Sağlama           | Personel, müşterilerin ihtiyaçları doğrultusunda destek sağlayabilir.                |
| İstasyon Kapasitesi Görüntüleme  | Personel, istasyonlardaki mevcut kapasite ve şarj noktalarını görüntüleyebilir.      |





---

### Varlıklar ve İlişkiler

| Varlık | Özellikler | İlişkiler |
|--------|------------|-----------|
| **Müşteri** | - Müşteri_ID: Müşteri kimlik numarası <br> - İsim: Müşteri adı <br> - Bakiye: Fatura ödeme ve şarj işlemleri için kullanılır <br> - İletişim Bilgileri: İletişim sağlanması için gerekli bilgiler | - Sahip Olur (Araç): Bir müşteri birden fazla araca sahip olabilir (1:N) <br> - Öder (Fatura): Müşteri birden fazla fatura öder (1:N) |
| **Araç** | - Araç_ID: Araç kimlik numarası <br> - Model: Araç modeli <br> - Marka: Araç markası <br> - Batarya Kapasitesi: Araç batarya kapasitesi <br> - Şarj Durumu: Anlık batarya seviyesi veya durumu <br> - Son Bakım Tarihi: En son yapılan bakım tarihi | - Gerçekleştirilir (Sürüş Geçmişi): Araç birden fazla sürüş kaydına sahiptir (1:N) <br> - Şarj Edilir (Şarj İstasyonu): Araçlar bir veya birden fazla şarj istasyonunda şarj olabilir (N:M) <br> - Bakım Yaptırır (Bakım Geçmişi): Araç birden fazla bakım kaydına sahiptir (1:N) |
| **Sürüş Geçmişi** | - Sürüş_ID: Sürüş kimlik numarası <br> - Başlangıç KM: Başlangıç kilometresi <br> - Bitiş KM: Bitiş kilometresi <br> - Süre: Sürüş süresi <br> - Enerji Kullanımı: Sürüş sırasında kullanılan enerji miktarı | - Gerçekleştirilir (Araç): Bir araç birden fazla sürüş kaydına sahip olabilir (1:N) |
| **Fatura** | - Fatura_ID: Fatura kimlik numarası <br> - Fatura Tarihi: Fatura düzenlenme tarihi <br> - Tutar: Fatura tutarı | - Öder (Müşteri): Fatura bir müşteri tarafından ödenir (N:1) <br> - Faturalandırır (Şarj): Fatura bir şarj işlemi için düzenlenir (1:1) |
| **Şarj İstasyonu** | - İstasyon_ID: Şarj istasyonu kimlik numarası <br> - Konum: Şarj istasyonunun bulunduğu yer <br> - Kapasite: Şarj noktası sayısı <br> - Mevcut Durum: İstasyon durumu (aktif/pasif) | - Şarj Edilir (Araç): İstasyonda birden fazla araç şarj olabilir (N:M) <br> - İşletir (Personel): Bir personel bir şarj istasyonunu işletebilir (N:1) |
| **Personel** | - Personel_ID: Personel kimlik numarası <br> - Personel İsim: Personel adı <br> - Görev: Görev tanımı <br> - İşe Giriş Tarihi: İşe başlangıç tarihi <br> - Yapılan İşlemler: Personelin gerçekleştirdiği işlemler | - İşletir (Şarj İstasyonu): Personeller birden fazla şarj istasyonunu işletebilir (N:M) |
| **Bakım Geçmişi** | - Bakım_ID: Bakım kimlik numarası <br> - Bakım Tarihi: Bakımın yapıldığı tarih <br> - Kullanılan Parçalar: Bakımda kullanılan parçalar <br> - Yapılan İşlemler: Yapılan bakım işlemleri | - Bakım Yaptırır (Araç): Bakım işlemi bir araca ait olabilir (N:1) |

---

### İlişki Özeti

| İlişki | Varlık 1 | Varlık 2 | Kardinalite |
|--------|----------|----------|-------------|
| Sahip Olur | Müşteri | Araç | 1:N |
| Öder | Müşteri | Fatura | 1:N |
| Gerçekleştirilir | Araç | Sürüş Geçmişi | 1:N |
| Şarj Edilir | Araç | Şarj İstasyonu | N:M |
| Bakım Yaptırır | Araç | Bakım Geçmişi | 1:N |
| İşletir | Personel | Şarj İstasyonu | N:M |
| Faturalandırır | Fatura | Şarj İstasyonu | N:1 |

---

### E-R Diyagramı

Projenin E-R diyagramını gösteren görsel:
![Elektrikli Araç Otomasyonu E-R Diyagramı](https://github.com/user-attachments/assets/c5fd663e-77fe-4318-9e88-63befd0b7f4f)


---

Bu projede Elektrikli Araç Otomasyonu için detaylı bir veri tabanı yapısı oluşturulmuştur. Projede müşteri, araç, sürüş geçmişi, fatura, şarj istasyonu, personel ve bakım geçmişi gibi varlıklar yer almakta olup bu varlıklar arasındaki ilişkiler yukarıdaki tablolarda özetlenmiştir.

