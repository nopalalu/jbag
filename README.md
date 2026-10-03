# JBAG — Marketplace Jual Beli Akun Game

Aplikasi mobile (Flutter) untuk jual beli akun game: Mobile Legends, Free Fire,
PUBG Mobile, Genshin Impact, Valorant, dan Honor of Kings.

## Menjalankan

```bash
flutter pub get
flutter run
```

## Catatan

- Data listing memakai mock statis di `lib/data.dart` (tanpa backend).
- Tombol "Beli via WhatsApp" membuka `wa.me/6281234567890` dengan pesan terisi
  otomatis. Ganti nomor di `lib/utils/whatsapp.dart` dengan nomor CS asli.
- Package name Android: `com.nopal.jbag`.
