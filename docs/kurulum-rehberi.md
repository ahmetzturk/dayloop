# Geliştirme Ortamı Kurulum Rehberi

Bu rehber, Dayloop projesinde çalışmak için gereken her şeyi Windows bilgisayara sıfırdan kurmayı adım adım anlatır. Toplam süre internet hızına göre 1–2 saat, gereken boş alan yaklaşık 15 GB.

> Ekipte herkes **aynı Flutter sürümünü (3.47.7)** kullanmalıdır. Farklı sürümler, birinde derlenen kodun diğerinde hata vermesine yol açabilir.

## Başlamadan Önce

- Bir GitHub hesabın olsun.
- Ahmet'in gönderdiği **repo davetini** e-postandan (veya <https://github.com/notifications>) kabul et. Kabul etmeden push yapamazsın.
- GitHub'da **Settings → Emails** sayfasında kullandığın e-posta adresinin **doğrulanmış (verified)** olduğundan emin ol. Commit'lerin GitHub'da sana sayılması için 2. adımda bu adresi kullanacaksın.

## 1. Git

1. <https://git-scm.com/downloads> adresinden Windows sürümünü indir ve varsayılan ayarlarla kur.
2. Bir PowerShell penceresi aç ve kimliğini ayarla. E-posta, **GitHub hesabına kayıtlı adresin** olmalı:

   ```powershell
   git config --global user.name "Aykut Demir"
   git config --global user.email "github-e-postan@ornek.com"
   ```

3. Kontrol et:

   ```powershell
   git --version
   git config --global user.email
   ```

## 2. Android Studio

1. <https://developer.android.com/studio> adresinden güncel kararlı sürümü indir ve kur. **Android Virtual Device** seçeneği işaretli kalsın.
2. İlk açılışta kurulum tipi olarak **Standard** seç, lisansları kabul et ve indirmelerin bitmesini bekle.
3. Karşılama ekranında **More Actions → SDK Manager** aç:
   - **SDK Platforms** sekmesinde **Android 17.0 (API 37.0)** ve **Android 16.0 (API 36.0)** satırlarını işaretle.
   - **SDK Tools** sekmesinde şunları işaretle:
     - Android SDK Build-Tools
     - **Android SDK Command-line Tools (latest)**
     - Android SDK Platform-Tools
     - Android Emulator
   - Aynı sekmede sağ alttaki **Show package details** kutusunu işaretle. **NDK (Side by side)** başlığının altında yalnızca **28.2.13676358** sürümünü seç. Flutter 3.47.7 bu sürümü istiyor, otomatik kurulumu başarısız olabiliyor.
   - **Apply → OK** de ve indirmelerin bitmesini bekle.
4. **More Actions → Virtual Device Manager** aç. Hazır bir cihaz yoksa **Create Virtual Device** ile bir telefon modeli ve **API 37** sistem imajı seçerek emülatör oluştur. **▶** ile başlatıp açıldığını kontrol et.

## 3. Flutter SDK

1. `C:\src` adında bir klasör oluştur.
2. <https://docs.flutter.dev/install/archive> adresinde **Stable channel → Windows** listesinden **3.47.7** sürümünü indir.
3. Zip'i `C:\src` klasörüne çıkar. Sonuçta şu dosya bulunmalı:

   ```text
   C:\src\flutter\bin\flutter.bat
   ```

   Zip, `C:\src\flutter_windows_3.47.7-stable\flutter` gibi iç içe bir klasör oluşturursa içteki `flutter` klasörünü `C:\src` altına taşı ve boş kalan klasörü sil.

## 4. Ortam Değişkenleri

1. Başlat menüsünde **"ortam değişkenleri"** yaz ve **Hesabınız için ortam değişkenlerini düzenleyin** seçeneğini aç.
2. **Kullanıcı değişkenleri** listesinde **Path → Düzenle → Yeni** de ve `C:\src\flutter\bin` ekle.
3. Listede **JAVA_HOME** varsa değerini `C:\Program Files\Android\Android Studio\jbr` yap. Yoksa bir şey ekleme, Flutter Android Studio'nun Java'sını kendisi bulur.
4. Bütün pencereleri **Tamam** ile kapat.
5. Açık olan bütün terminal ve VS Code pencerelerini kapat. VS Code'u **File → Exit** ile tamamen kapat, aksi halde yeni ayarları görmez.

## 5. Windows Geliştirici Modu

**Ayarlar → Sistem → Geliştiriciler için → Geliştirici Modu** anahtarını **Açık** yap. Flutter eklentileri Windows'ta bunu gerektirir.

## 6. Kurulumu Doğrula

Yeni bir PowerShell penceresi aç:

```powershell
flutter --version
flutter doctor --android-licenses
flutter doctor
```

- `flutter --version` çıktısında **Flutter 3.47.7** yazmalı. İlk çalıştırma birkaç dakika sürebilir.
- `--android-licenses` lisans sorarsa hepsine `y` de.
- `flutter doctor` çıktısında **Flutter** ve **Android toolchain** satırları ✓ olmalı. **Visual Studio** satırındaki uyarıyı görmezden gelebilirsin, o yalnızca Windows masaüstü uygulamaları için gerekli.

## 7. VS Code

1. <https://code.visualstudio.com/> adresinden VS Code'u kur (kurulu değilse).
2. **Ctrl+Shift+X** ile eklentiler panelini aç, **Flutter** ara ve yayıncısı **Dart Code** olan eklentiyi kur. Dart eklentisi onunla birlikte gelir.

## 8. Projeyi İndir ve Çalıştır

1. Projeyi koymak istediğin klasörde bir PowerShell penceresi aç:

   ```powershell
   git clone https://github.com/ahmetzturk/dayloop.git
   cd dayloop
   flutter pub get
   ```

   İlk `git clone` sırasında tarayıcıda GitHub giriş penceresi açılabilir, giriş yapıp yetkilendir.

2. VS Code'da **File → Open Folder** ile `dayloop` klasörünü aç.
3. Sağ alttaki durum çubuğunda cihaz adına tıkla ve emülatörü seç.
4. `lib/main.dart` dosyasını açıp **F5**'e bas (veya **Run → Start Debugging**). İlk derleme 3–5 dakika sürebilir.
5. Emülatörde uygulama açılıyorsa kurulum tamamdır.

## 9. Ekip Çalışma Akışı

`main` branch'i her zaman çalışan sürümdür. **Kod değişikliklerini doğrudan `main`'e atmıyoruz:** her iş ayrı bir branch'te yapılır ve Pull Request ile birleştirilir. Yalnızca `docs/` altındaki doküman değişiklikleri doğrudan `main`'e atılabilir.

```powershell
# 1. Güncel main'i al
git switch main
git pull

# 2. İş için yeni branch aç (tür/kısa-açıklama)
git switch -c feature/gorev-listesi

# 3. Kodunu yaz, sonra kaydet ve gönder
git add .
git commit -m "Görev listesi ekranı eklendi"
git push -u origin feature/gorev-listesi
```

Sonra:

- GitHub'da **Compare & pull request → Create pull request** ile PR aç. Diğer ekip üyesi inceleyip birleştirir (**Merge**).
- Birleştirmeden sonra `git switch main` ve `git pull` ile güncel hale gel, eski branch'i `git branch -d <branch-adı>` ile sil.

**Kurallar:**

- Branch adları: `feature/...` yeni özellik, `fix/...` hata düzeltme, `docs/...` doküman.
- Commit mesajları **Türkçe** ve ne yapıldığını anlatan kısa cümleler olur.
- Kod içindeki değişken, sınıf ve dosya adları **İngilizce** olur.

## Sık Karşılaşılan Sorunlar

- **`flutter` komutu tanınmıyor:** Path ayarını kontrol et, terminali ve VS Code'u tamamen kapatıp yeniden aç.
- **`Android sdkmanager did not install NDK 28.2.13676358` hatası:** 2. adımdaki NDK sürümünü SDK Manager'dan kur.
- **Emülatör "virtualization / hypervisor" hatası veriyor:** BIOS'ta sanallaştırmayı (Intel VT-x / AMD-V) aç.
- **`LF will be replaced by CRLF` uyarısı:** Zararsız, Windows'un satır sonu biçimiyle ilgili.
- **Debug Console'da `Skipped ... frames`:** Emülatörde normal, görmezden gelebilirsin.
