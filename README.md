# 🎬 Film İstek Modülü Pro - Kurulum Kılavuzu

## 📋 İçindekiler
1. [Gereksinimler](#gereksinimler)
2. [Dosya Yapısı](#dosya-yapısı)
3. [Kurulum Adımları](#kurulum-adımları)
4. [TMDb API Key Alma](#tmdb-api-key-alma)
5. [Captcha/reCAPTCHA Kurulumu](#captcha-recaptcha-kurulumu)
6. [Kullanım](#kullanım)
7. [Sorun Giderme](#sorun-giderme)

---

## 📌 Gereksinimler

### Minimum Gereksinimler:
- ✅ **DataLife Engine 13.0 veya üzeri** (DLE 19.0 ile test edilmiştir)
- ✅ **PHP 7.4+** (PHP 8.x önerilir)
- ✅ **MySQL 5.6+** veya **MariaDB 10.0+**
- ✅ **cURL** desteği aktif (TMDb API için)
- ✅ **TMDb API Key** (Ücretsiz)

### Önerilen:
- ⭐ PHP 8.0+
- ⭐ MySQL 8.0+ / MariaDB 10.5+
- ⭐ DLE reCAPTCHA v2/v3 aktif (spam koruması için)

---

## 📁 Dosya Yapısı

Modül dosyaları şu şekilde organize edilmelidir:

```
Film-istek/
│
├── film-istek-modulu-pro.xml       # Ana eklenti dosyası (DLE'ye yüklenecek)
├── film_requests.tpl                # Site önyüz template dosyası
├── KURULUM.md                       # Bu dosya
└── README.md                        # Modül bilgileri
```

---

## 🚀 Kurulum Adımları

### **Adım 1: Eklentiyi DLE Admin Panele Yükleme**

1. **DLE Admin Panel**'e giriş yapın
2. Sol menüden **"Yönetim"** → **"Eklentiler/Plugins"** sayfasına gidin
3. **"Eklenti Yükle"** butonuna tıklayın
4. `film-istek-modulu-pro.xml` dosyasını seçin
5. **"Yükle"** butonuna tıklayın

> ⚠️ **DİKKAT:** Yükleme sırasında veritabanı tabloları otomatik oluşturulacaktır.

#### Yükleme Sırasında Yapılanlar:
- ✅ `dle_film_requests` - Film/dizi istekleri tablosu
- ✅ `dle_film_request_settings` - Modül ayarları tablosu
- ✅ `dle_film_request_limits` - Rate limiting tablosu
- ✅ Admin panel menüsüne **"Film & Dizi İstekleri"** eklenir
- ✅ Frontend route: `?do=film-requests` aktif olur

---

### **Adım 2: Template Dosyasını Yerleştirme**

1. `film_requests.tpl` dosyasını kopyalayın
2. DLE kurulum dizinine gidin
3. Şu dizine yapıştırın:

```
/templates/[TEMA_ADINIZ]/film_requests.tpl
```

**Örnek:**
```
/templates/Default/film_requests.tpl
/templates/musteri_temasi/film_requests.tpl
```

> 💡 **İPUCU:** Birden fazla tema kullanıyorsanız, her tema için template dosyasını kopyalayın.

---

### **Adım 3: TMDb API Key Alma**

Film ve dizi bilgilerini çekmek için TMDb API key'e ihtiyacınız var:

#### 3.1. TMDb Hesabı Oluşturma
1. [https://www.themoviedb.org/](https://www.themoviedb.org/) adresine gidin
2. **"Kayıt Ol"** (Sign Up) tıklayın
3. Ücretsiz hesap oluşturun
4. E-posta adresinizi doğrulayın

#### 3.2. API Key Alma
1. Giriş yapın
2. Sağ üst köşeden profil resminize tıklayın
3. **"Ayarlar"** (Settings) → **"API"** menüsüne gidin
4. **"Request an API Key"** tıklayın
5. **"Developer"** seçin
6. Formu doldurun:
   - **Application Name:** Sitenizin adı
   - **Application URL:** Sitenizin URL'si
   - **Application Summary:** "DLE film istek modülü" gibi kısa açıklama
7. Şartları kabul edin ve **"Submit"** tıklayın
8. **API Key (v3 auth)** değerini kopyalayın

> 🎯 **Örnek API Key:** `a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6`

---

### **Adım 4: Modülü Yapılandırma**

#### 4.1. DLE Admin Panel Ayarları

1. DLE Admin Panel → **"Film & Dizi İstekleri"** → **"Ayarlar"**
2. Aşağıdaki ayarları yapın:

**Zorunlu Ayarlar:**
- ✅ **TMDb API Key:** Aldığınız API key'i yapıştırın
- ✅ **Günlük İstek Limiti:** 5 (spam önleme)
- ✅ **Sayfalama:** 20 (sayfa başına gösterilecek istek sayısı)

**İsteğe Bağlı Ayarlar:**
- ☑️ **Misafir Kullanıcılar:** İzin ver (misafirlerin istek ekleyebilmesi için)
- ☑️ **Bekleyen İstekleri Göster:** Aktif (mükerrer istek önleme)
- ☑️ **E-posta Bildirimi:** Aktif
- ☑️ **Admin E-posta Adresi:** admin@siteniz.com

3. **"Ayarları Kaydet"** butonuna tıklayın

---

### **Adım 5: Captcha/reCAPTCHA Kurulumu** (Önerilen)

Spam koruması için Captcha veya reCAPTCHA kurulumu şiddetle önerilir.

#### Seçenek 1: DLE Klasik Captcha (Zaten Var)
DLE'nin kendi captcha sistemi otomatik aktif olur. Ek ayar gerekmez.

#### Seçenek 2: Google reCAPTCHA v2 (Önerilen)

##### 5.1. reCAPTCHA Key Alma
1. [https://www.google.com/recaptcha/admin/create](https://www.google.com/recaptcha/admin/create) adresine gidin
2. Google hesabınızla giriş yapın
3. Formu doldurun:
   - **Label:** Sitenizin adı
   - **reCAPTCHA type:** reCAPTCHA v2 → "I'm not a robot" Checkbox
   - **Domains:** siteniz.com (www olmadan)
4. Şartları kabul edin ve **"Submit"** tıklayın
5. **Site Key** ve **Secret Key** değerlerini kopyalayın

##### 5.2. DLE'ye reCAPTCHA Kurulumu
1. DLE Admin Panel → **"Genel Ayarlar"** → **"Güvenlik"**
2. **"reCAPTCHA kullan"** → **"Evet"** seçin
3. **"reCAPTCHA Site Key"** → Aldığınız Site Key'i yapıştırın
4. **"reCAPTCHA Secret Key"** → Aldığınız Secret Key'i yapıştırın
5. **"reCAPTCHA Tema"** → Light veya Dark (sitenize göre)
6. **"Kaydet"** butonuna tıklayın

> ✅ Artık misafir kullanıcılar arama ve istek eklerken captcha görecek!

#### Seçenek 3: hCaptcha (Alternatif)
1. [https://www.hcaptcha.com/](https://www.hcaptcha.com/) adresinden key alın
2. DLE reCAPTCHA ayarlarında **"hCaptcha kullan"** seçin
3. Key'leri yapıştırın

#### Seçenek 4: Cloudflare Turnstile
1. Cloudflare hesabınızdan Turnstile key alın
2. DLE ayarlarında **"Cloudflare Turnstile"** seçin
3. Key'leri yapıştırın

---

## 🎯 Kullanım

### **Site Önyüzde Görüntüleme**

Modülü sitenizde yayınlamak için 3 yöntem var:

#### **Yöntem 1: Doğrudan URL**
```
https://siteniz.com/?do=film-requests
```

#### **Yöntem 2: Menüye Ekleme**
1. DLE Admin Panel → **"Genel Ayarlar"** → **"Menü Yönetimi"**
2. Yeni menü ekleyin:
   - **Başlık:** Film İstekleri
   - **URL:** ?do=film-requests
   - **İkon:** fa-film

#### **Yöntem 3: Sayfaya Shortcode (Static pages)**
DLE static page oluşturun:
```html
[include file="engine/modules/film_requests.php"]
```

---

### **Kullanıcılar İçin**

#### Misafir Kullanıcı Akışı:
1. `?do=film-requests` sayfasına gider
2. **Film** veya **Dizi** seçer
3. Arama kutusuna film/dizi adı veya IMDb ID yazar
4. **Captcha'yı doldurur** ⚠️ (Zorunlu)
5. **"Ara"** butonuna tıklar
6. Sonuçlardan istediği filmi bulur
7. **Captcha'yı tekrar doldurur** ⚠️ (İstek eklemek için)
8. **"Ekle"** butonuna tıklar
9. İstek başarıyla eklenir

#### Kayıtlı Kullanıcı Akışı:
1. Aynı adımlar ama **captcha yok**
2. Günlük 5 istek hakkı var
3. **"Benim İsteklerim"** bölümünde durumu takip edebilir

---

### **Admin Yönetimi**

#### İstekleri Yönetme:
1. Admin Panel → **"Film & Dizi İstekleri"** → **"İstekler"**
2. İstekleri listeden görüntüleyin
3. İşlemler:
   - ✅ **Onayla:** İstek onaylanır, kullanıcı "Film sitemize eklendi!" görür
   - ❌ **Reddet:** İstek reddedilir
   - 📝 **Not Ekle:** Red sebebi veya bilgilendirme yazabilirsiniz
   - 🗑️ **Sil:** İsteği tamamen siler

#### Red Sebebi Yazma:
1. **"📝 Not Ekle"** butonuna tıklayın
2. Modal açılır
3. Red sebebini yazın:
   ```
   Örnek: Telif hakkı nedeniyle eklenemez.
   ```
4. **"Kaydet"** butonuna tıklayın
5. İsteği **"Reddet"** ile reddedin
6. Kullanıcı şunu görür:
   ```
   ❌ İstek reddedildi.
   Sebep: Telif hakkı nedeniyle eklenemez.
   ```

#### Toplu İşlemler:
1. Birden fazla isteği checkbox ile işaretleyin
2. Üstten **"Toplu İşlem Seç"** menüsünden seçin:
   - Onayla
   - Reddet
   - Sil
3. **"Uygula"** butonuna tıklayın

#### İstatistikler:
1. Admin Panel → **"Film & Dizi İstekleri"** → **"İstatistikler"**
2. Görüntülenen bilgiler:
   - 📊 Toplam istek sayısı
   - ⏰ Bekleyen istekler
   - ✅ Onaylanan istekler
   - ❌ Reddedilen istekler
   - 🎬 Film vs Dizi oranı
   - 📅 Son 24 saat istatistikleri
   - 📈 Durum dağılımı (grafikli)
   - 🏆 Son eklenen 20 içerik

---

## ⚙️ Özellikler

### ✨ Temel Özellikler:
- 🎬 **Film ve Dizi Desteği** - İki içerik türü
- 🔍 **TMDb API Entegrasyonu** - Otomatik bilgi çekme
- 🔒 **Captcha/reCAPTCHA** - Spam koruması (misafirler için)
- 🚫 **Rate Limiting** - Günlük 5 istek limiti
- 🔄 **Mükerrer Önleme** - Aynı içerik tekrar istenemez
- 📝 **Admin Notları** - Her isteğe not eklenebilir
- ✅ **Durum Mesajları** - Onaylandı/Reddedildi bilgilendirmesi
- 📊 **İstatistikler** - Detaylı raporlama
- 📧 **E-posta Bildirimleri** - Yeni istek geldiğinde admin bilgilendirilir

### 🎨 Tasarım Özellikleri:
- 📱 **Tam Mobil Uyumlu** - Her cihazda mükemmel
- 🎴 **Mobil Card Görünümü** - Tablolar mobilde kart olur
- 🌈 **Modern Gradient Tasarım** - Göz alıcı renkler
- 🎯 **Responsive Grid** - Film kartları otomatik hizalanır
- ⚡ **Smooth Animasyonlar** - Akıcı geçişler
- 🎭 **Durum Renkleri** - Yeşil/Kırmızı/Sarı kutu mesajları

### 🔐 Güvenlik Özellikleri:
- 🛡️ **Captcha Doğrulaması** - Her aramada ve istekte
- 🚦 **Rate Limiting** - IP ve kullanıcı bazlı
- 🔒 **SQL Injection Koruması** - Tüm girdiler güvenli
- 🧼 **XSS Koruması** - HTML escape edilir
- 🌐 **CSRF Koruması** - DLE native koruması

---

## 🔧 Sorun Giderme

### ❌ Sorun: "TMDb API Key yapılandırılmamış!"

**Çözüm:**
1. Admin Panel → Film & Dizi İstekleri → Ayarlar
2. TMDb API Key alanını kontrol edin
3. Geçerli bir API key yapıştırın
4. **"Ayarları Kaydet"** butonuna tıklayın

---

### ❌ Sorun: "Captcha çıkmıyor!"

**Çözüm:**
1. **Genel Ayarlar** → **Güvenlik** bölümünü kontrol edin
2. reCAPTCHA ayarlarının doğru yapıldığından emin olun
3. Site Key ve Secret Key'leri kontrol edin
4. Tarayıcı konsolunda JavaScript hatası var mı kontrol edin
5. reCAPTCHA script'inin yüklendiğinden emin olun

---

### ❌ Sorun: "Arama sonuç vermiyor!"

**Nedenleri:**
1. ❌ TMDb API key yanlış veya süresi dolmuş
2. ❌ cURL desteği kapalı
3. ❌ Sunucu TMDb'ye erişemiyor (firewall)

**Çözüm:**
```php
// PHP cURL kontrolü
<?php
if (function_exists('curl_init')) {
    echo "cURL aktif ✅";
} else {
    echo "cURL kapalı ❌";
}
?>
```

**Hosting'e bildirin:**
"cURL extension aktif edilsin lütfen."

---

### ❌ Sorun: "Admin panel açılmıyor!"

**Çözüm:**
1. Eklenti aktif mi kontrol edin:
   - **Yönetim** → **Eklentiler/Plugins**
   - "Film İstek Modülü Pro" aktif olmalı
2. Veritabanı tablolarını kontrol edin:
   ```sql
   SHOW TABLES LIKE '%film_request%';
   ```
3. 3 tablo görmelisiniz:
   - `dle_film_requests`
   - `dle_film_request_settings`
   - `dle_film_request_limits`

---

### ❌ Sorun: "Template bulunamadı hatası!"

**Çözüm:**
1. `film_requests.tpl` dosyasının doğru yerde olduğundan emin olun:
   ```
   /templates/Default/film_requests.tpl
   ```
2. Dosya izinlerini kontrol edin: **644** olmalı
3. FTP'den dosyayı tekrar yükleyin

---

### ❌ Sorun: "Mobilde düzgün görünmüyor!"

**Çözüm:**
1. Template dosyasının en son versiyonunu kullandığınızdan emin olun
2. Tarayıcı önbelleğini temizleyin: **CTRL+F5**
3. Tema CSS'i modül CSS'ini override ediyorsa şu kodu tema CSS'inin **sonuna** ekleyin:
   ```css
   @import url('templates/Default/film_requests.tpl');
   ```

---

### ❌ Sorun: "Günlük limit çalışmıyor!"

**Çözüm:**
1. Admin Panel → Ayarlar → **Günlük İstek Limiti** değerini kontrol edin
2. Veritabanı `dle_film_request_limits` tablosunu kontrol edin
3. Eski kayıtları temizleyin:
   - **İstatistikler** → **"Eski Kayıtları Temizle"** butonuna tıklayın

---

### ❌ Sorun: "E-posta bildirimleri gelmiyor!"

**Çözüm:**
1. Admin Panel → Ayarlar → **E-posta Bildirimi** aktif olmalı
2. **Admin E-posta Adresi** doğru yazılmalı
3. DLE mail fonksiyonu çalışıyor mu test edin
4. Hosting mail servisinin aktif olduğundan emin olun

---

## 📞 Destek ve Güncelleme

### 🆘 Destek Alın:
- 📧 E-posta: [destek@siteniz.com]
- 💬 Forum: [DLE Forum linki]
- 📱 Telegram: [@kullanici_adi]

### 🔄 Güncelleme:
Modülü güncellemek için:
1. Yeni XML dosyasını Admin Panel'den yükleyin
2. **"Güncelle"** butonuna tıklayın
3. Template dosyasını yenisiyle değiştirin
4. Tarayıcı önbelleğini temizleyin

> ⚠️ **UYARI:** Güncelleme öncesi **veritabanı yedeği** alın!

---

## 🎓 Örnek Kullanım Senaryoları

### Senaryo 1: Film İsteği (Başarılı)
```
1. Kullanıcı → ?do=film-requests
2. "Film" seçer
3. "Inception" yazar
4. Captcha doldurur
5. "Ara" butonuna tıklar
6. Inception (2010) bulur
7. Captcha tekrar doldurur
8. "Ekle" butonuna tıklar
9. ✅ "İsteğiniz başarıyla gönderildi!" mesajı
```

### Senaryo 2: Admin Onaylıyor
```
1. Admin → Admin Panel
2. Film & Dizi İstekleri → İstekler
3. "Inception" isteğini görür
4. TMDb'de kontrol eder
5. "✅ Onayla" butonuna tıklar
6. Kullanıcı sayfada görür:
   "✅ Film sitemize eklendi!"
```

### Senaryo 3: Admin Reddediyor
```
1. Admin → "❌ Reddet" butonuna tıklar
2. "📝 Not Ekle" butonuna tıklar
3. "Telif hakkı sorunu var" yazar
4. "Kaydet" butonuna tıklar
5. Kullanıcı sayfada görür:
   "❌ İstek reddedildi.
   Sebep: Telif hakkı sorunu var"
```

---

## 📝 Lisans

Bu modül [Lisans Türü] altında lisanslanmıştır.

---

## 👨‍💻 Geliştirici Notları

### Veritabanı Yapısı:

#### Tablo 1: `dle_film_requests`
```sql
- id (int) - Primary Key
- tmdb_id (int) - TMDb ID
- imdb_id (varchar) - IMDb ID
- type (enum) - 'movie' veya 'tv'
- title (varchar) - Türkçe başlık
- original_title (varchar) - Orijinal başlık
- year (int) - Yıl
- poster (varchar) - Poster URL
- backdrop (varchar) - Backdrop URL
- overview (text) - Açıklama
- genres (varchar) - Tür ID'leri (virgülle ayrılmış)
- vote_average (decimal) - TMDb puanı
- status (enum) - 'pending', 'approved', 'rejected'
- added_by (int) - Kullanıcı ID
- username (varchar) - Kullanıcı adı
- added_at (int) - Ekleme zamanı (timestamp)
- ip_address (varchar) - IP adresi
- admin_note (text) - Admin notu
```

#### Tablo 2: `dle_film_request_settings`
```sql
- id (int) - Primary Key
- setting_name (varchar) - Ayar adı
- setting_value (text) - Ayar değeri
```

#### Tablo 3: `dle_film_request_limits`
```sql
- id (int) - Primary Key
- user_id (int) - Kullanıcı ID (0 = misafir)
- ip_address (varchar) - IP adresi
- request_date (date) - Tarih
- request_count (int) - İstek sayısı
```

---

## 🎉 Kurulum Tamamlandı!

Modülünüz başarıyla kuruldu ve kullanıma hazır!

**Test Etmek İçin:**
1. `https://siteniz.com/?do=film-requests` adresine gidin
2. Bir film arayın (örn: "Matrix")
3. İstek ekleyin
4. Admin panelden kontrol edin

**İyi kullanımlar!** 🚀🎬

---

**Versiyon:** 2.0.0
**Son Güncelleme:** 13 Kasım 2025
**DLE Uyumluluk:** 13.0 - 19.0+
**Geliştirici:** [Elegance/DleHub]
