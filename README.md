# DataLife Engine için Film İstek Modülü Pro

DataLife Engine (DLE) için geliştirilmiş, kullanıcıların sitenize eklenmek üzere film ve dizi isteklerinde bulunmalarını sağlayan güçlü ve zengin özelliklere sahip bir modüldür. Yöneticiler bu istekleri admin panelinden kolayca yönetebilir.

## Özellikler

*   **Film ve Dizi Desteği:** Kullanıcılar hem film hem de dizi isteğinde bulunabilir.
*   **TMDb API Entegrasyonu:** The Movie Database (TMDb) üzerinden film/dizi bilgilerini otomatik olarak çeker.
*   **Spam Koruması:** Misafir kullanıcılar için dahili CAPTCHA/reCAPTCHA desteği.
*   **İstek Limiti (Rate Limiting):** Bir kullanıcının günlük yapabileceği istek sayısını sınırlar.
*   **Mükerrer Önleme:** Aynı içeriğin birden çok kez istenmesini engeller.
*   **Yönetici Notları:** Yöneticiler her isteğe özel notlar ekleyebilir (örneğin, reddetme nedeni).
*   **Durum Mesajları:** Kullanıcılar isteklerinin durumunu (Beklemede, Onaylandı, Reddedildi) görebilirler.
*   **Detaylı İstatistikler:** Admin panelinde isteklerle ilgili ayrıntılı istatistikler sunar.
*   **E-posta Bildirimleri:** Yeni istekler hakkında yöneticileri bilgilendirir.
*   **Mobil Uyumlu Tasarım:** Tamamen duyarlı ve mobil dostu bir arayüze sahiptir.

## Gereksinimler

*   **DataLife Engine:** 13.0 veya üzeri (DLE 19.0 ile test edilmiştir)
*   **PHP:** 7.4 veya üzeri (PHP 8.x önerilir)
*   **MySQL:** 5.6+ veya **MariaDB:** 10.0+
*   **cURL:** TMDb API iletişimi için aktif olmalıdır
*   **TMDb API Anahtarı:** (Ücretsiz olarak temin edilebilir)

## Kurulum

1.  **Eklentiyi Yükleyin:**
    *   DLE Admin Panelinize giriş yapın.
    *   **Eklentiler** > **Eklenti Yönetimi**'ne gidin.
    *   **Eklenti Yükle**'ye tıklayın ve `film-istek-modulu-pro.xml` dosyasını seçin.

2.  **Template Dosyasını Kopyalayın:**
    *   `film_requests.tpl` dosyasını tema klasörünüze kopyalayın: `/templates/TEMA_ADINIZ/`.

3.  **Modülü Yapılandırın:**
    *   Admin panelinde **Film & Dizi İstekleri** > **Ayarlar** bölümüne gidin.
    *   TMDb API Anahtarınızı girin ve diğer ayarları yapılandırın.

4.  **CAPTCHA/reCAPTCHA Kurulumu (Önerilir):**
    *   Spam'ı önlemek için DLE ayarlarınızda CAPTCHA veya reCAPTCHA'yı yapılandırmanız şiddetle tavsiye edilir.

## Kullanım

Modüle üç farklı şekilde erişilebilir:

1.  **Doğrudan URL:** `https://siteniz.com/?do=film-requests`
2.  **Menü Öğesi:** Site menünüze `?do=film-requests` adresine yönlendiren yeni bir öğe ekleyin.
3.  **Statik Sayfa:** Yeni bir statik sayfa oluşturun ve aşağıdaki kodu kullanarak modülü ekleyin:
    ```html
    [include file="engine/modules/film_requests.php"]
    ```

## Geliştiriciler İçin

### Veritabanı Yapısı

Eklenti, veritabanınızda üç tablo oluşturur:

*   `dle_film_requests`: Film ve dizi isteklerini saklar.
*   `dle_film_request_settings`: Modülün ayarlarını saklar.
*   `dle_film_request_limits`: İstekler için hız sınırlamasını yönetir.

Detaylı şema için `KURULUM.md` dosyasına bakınız.

## Lisans

Bu modül, [Lisans Türü] lisansı altında lisanslanmıştır.
