# 🎬 DLE Film İstek Modülü  
**DataLife Engine için gelişmiş film & dizi istek sistemi**  
TMDb API destekli, modern arayüzlü, user-friendly profesyonel istek yönetim eklentisi.

---

## 🚀 Özellikler

- ✔️ Kullanıcıların film & dizi isteği göndermesi  
- ✔️ TMDb API ile otomatik film bilgisi + poster çekme  
- ✔️ İsteklerin Admin Panel üzerinden yönetimi  
- ✔️ Onaylı / Beklemede filtreleme  
- ✔️ Kullanıcı başına günlük istek limiti  
- ✔️ AJAX destekli TMDb arama  
- ✔️ Bootstrap ve Tailwind ile uyumlu şablon  
- ✔️ Anti-Spam güvenliği  
- ✔️ DLE 15.3 – 19.0 tam uyumluluk  

---

## 📁 Dosya Yapısı

film-istek/
│
├── film-istek-modulu-pro.xml # Eklentinin kurulum dosyası
├── film_requests.tpl # Kullanıcı istek sayfası şablonu
├── admin_film_requests.php # Admin paneli modülü
├── engine.film_requests.php # Backend işlem dosyası
└── README.md # Bu döküman


---

## 📦 Kurulum

### 1️⃣ Dosyaları yükleyin  
`upload` klasöründeki tüm dosyaları DLE ana dizinine aktarın.

### 2️⃣ Admin panelden XML kurun  
**Admin Panel → Eklentiler → Eklenti Yükle**  
`film-istek-modulu-pro.xml` dosyasını seçin.

### 3️⃣ Menüye ekleme  
Site menüne şunu ekleyebilirsin:

?do=film_requests

### 4️⃣ TMDb API anahtarını girin  
**Admin Panel → Ayarlar → Film İstek Modülü**

---

## 🔧 Ayarlar

| Ayar | Açıklama |
|------|----------|
| **TMDb API Key** | Film aramalarında kullanılır |
| **Günlük istek limiti** | Bir kullanıcının günde gönderebileceği istek sayısı |
| **Poster boyutu** | TMDb görsel çözünürlüğü |
| **Admin bildirimleri** | Yöneticilere bildirim göster |

---

## 🎨 Şablon Etiketleri (film_requests.tpl)

| Etiket | Açıklama |
|--------|----------|
| `{title}` | Sayfa başlığı |
| `{requests}` | İstek listeleme döngüsü |
| `{poster}` | Film posteri |
| `{overview}` | TMDb özet metni |
| `{request_button}` | İstek gönderme butonu |

---

## 🛡 Güvenlik

- Token doğrulama  
- Form flood protection  
- XSS / SQL Injection koruması  
- Kullanıcı bazlı istek limiti  

---

## 📜 Sürüm Notları

### **v1.0.0 – İlk Yayın**
- Film / dizi istek sistemi
- TMDb otomatik veri çekme
- Admin panel istek yönetimi
- AJAX canlı arama
- Modern UI

---

## 🧩 Roadmap (Gelecek Sürümler)

- ⏳ Oyuncu ve yönetmen bilgisi ekleme  
- ⏳ İstekleri otomatik içerik oluşturma ile birleştirme  
- ⏳ Kullanıcıya istek durumu bildirimi  
- ⏳ Admin onay sistemi geliştirme  

---

## 🤝 Katkı

Katkılar açıktır. PR gönderebilirsiniz.

---

## 📜 Lisans

Bu proje **MIT Lisansı** ile sunulmaktadır.



