# Dayloop

**Dayloop**, kişinin günlük işlerini takip eden yapay zeka destekli bir kişisel sekreter uygulamasıdır. Kullanıcı gün içindeki görevlerini ve notlarını kaydeder, uygulama zamanı geldiğinde hatırlatır ve tekrar eden rutinlerin adım adım yürütülmesine yardımcı olur.

> Bu proje, İstanbul Üniversitesi Cerrahpaşa **Mobile Programming** dersi kapsamında geliştirilmektedir.
> Durum: 🚧 Geliştirme aşamasında

## Planlanan Özellikler

- Görev ve not ekleme, düzenleme, silme
- Günlük görünüm ("Bugün" ekranı)
- Zamanı gelen görevler için hatırlatma bildirimi
- Doğal dilde yazılan cümleden görev oluşturma (yapay zeka)
- Günün özetini çıkarma (yapay zeka)
- Tekrar eden rutinler (adım adım kontrol listesi)
- Türkçe / İngilizce dil desteği ve koyu tema

Kapsam ve iş planının ayrıntıları [`docs/`](docs/) klasöründe yer almaktadır.

## Ekip

- **Ahmet Öztürk** – Proje Yöneticisi, Geliştirici
- **Aykut Demir** – Halkla İlişkiler Sorumlusu, Geliştirici

## Teknolojiler

- [Flutter](https://flutter.dev/) 3.47.7 (stable) / Dart 3.13.5
- Platform: Android

## Kurulum ve Çalıştırma

Gereksinimler: Flutter 3.47.7, Android Studio (Android SDK ve bir emülatör).

```bash
git clone https://github.com/ahmetzturk/dayloop.git
cd dayloop
flutter pub get
flutter run
```

## Klasör Yapısı

```text
dayloop/
├─ lib/        # Uygulama kaynak kodu
├─ test/       # Testler
├─ android/    # Android platform dosyaları
└─ docs/       # Proje dokümanları (rapor, şema, sunumlar)
```
