# Haftalık İlerleme Raporu – Rapor 1

- **Dönem:** 12.10.2026 – 19.10.2026
- **Hazırlayan:** Ahmet Öztürk (Proje Yöneticisi)
- **Genel durum:** 🟢 Plana uygun

## Özet

Projenin ilk haftasında proje fikri ve ekip rolleri belirlendi, geliştirme ortamı kuruldu, Flutter projesi oluşturuldu ve public GitHub reposu açıldı. Kapsam ve iş planı dokümanı, ekran taslakları ve ilk sunum hazırlandı.

## Bu hafta yapılanlar

### Ahmet Öztürk

- ✅ Geliştirme ortamı kuruldu (Android Studio, Android SDK, Flutter 3.47.7, emülatör)
- ✅ Flutter projesi oluşturuldu
- ✅ Public GitHub reposu açıldı: <https://github.com/ahmetzturk/dayloop>
- ✅ Aykut repoya collaborator olarak eklendi
- 🔄 [Kurulum rehberi](../kurulum-rehberi.md) hazırlandı
- 🔄 [Kapsam ve iş planı](../kapsam-ve-is-plani.md) ile organizasyon şeması hazırlandı
- 🔄 [Ekran taslakları](../taslaklar/) ve ilk sunum hazırlandı

### Aykut Demir

- ✅ Repo davetini kabul etti
- ✅ Geliştirme ortamını kurdu (Android Studio, Flutter 3.47.7, emülatör)

### Birlikte

- ✅ Proje fikri belirlendi: yapay zeka destekli kişisel sekreter "Dayloop"
- ✅ Roller belirlendi: Ahmet proje yöneticisi, Aykut halkla ilişkiler sorumlusu

## Karşılaşılan sorunlar ve çözümleri

- **Sorun:** Bilgisayardaki Android Studio (4.0) ve Java 8 güncel Flutter ile uyumsuzdu.
  **Çözüm:** Android Studio güncellendi, `JAVA_HOME` yeni Java klasörüne yönlendirildi.
- **Sorun:** İlk derlemede gerekli NDK sürümü otomatik kurulamadı, derleme başarısız oldu.
  **Çözüm:** NDK 28.2 Android Studio'dan elle kuruldu; bu adım kurulum rehberine eklendi.
- **Sorun:** Klasör adı (`Dayloop`) büyük harfle başladığı için Dart paket adı kuralına uymuyordu.
  **Çözüm:** Proje `--project-name dayloop` ile oluşturuldu.

## Tanıtım faaliyetleri

- Henüz paylaşım yapılmadı. Tanıtım kanalının açılması gelecek haftaya planlandı (Aykut).

## GitHub katkıları

- Ahmet Öztürk: 1 commit
- Aykut Demir: 0 commit

## Gelecek hafta planı

- **Ahmet:** Görev ekleme ve listeleme ekranları
- **Aykut:** Uygulama iskeleti ve alt menü, tanıtım kanalını açıp ilk paylaşımı yapma
- **Birlikte:** İlk sunum
