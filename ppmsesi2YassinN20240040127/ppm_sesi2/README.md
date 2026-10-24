# PPM Sesi 2 - Dasar Flutter dan Widget

**Nama:** Yassin N | **NIM:** 20240040127 | **Prodi:** Teknik Informatika

Aplikasi Flutter sederhana berisi halaman **Product & Profile**.

## Fitur
- **AppBar** berjudul `PPM Sesi 2 - Yassin N (20240040127)` dengan tema warna indigo.
- **Banner promo** menggunakan `Stack` + `Positioned`.
- **Kartu profil** (`StatelessWidget`): nama, NIM, prodi/kelas, ikon profil, 5 ikon bintang.
- **Kartu produk** (`StatefulWidget`): placeholder gambar, nama, harga, kategori.
  - Tombol **Favorite** (ikon hati berubah, jumlah like bertambah/berkurang).
  - Tombol **-** / **+** untuk jumlah produk (minimal 1), total harga otomatis berubah.
  - Tombol **Tambah ke Keranjang** menampilkan `SnackBar`.

## Widget yang Digunakan
`Scaffold`, `Row`, `Column`, `Container`, `Card`, `Stack`, `Positioned`, `Icon`, `ElevatedButton`, `IconButton`, `StatelessWidget`, `StatefulWidget`.

## Cara Menjalankan
```bash
flutter pub get
flutter run
```

## Screenshot
| Tampilan Utama | Setelah Favorite, Jumlah 3 & SnackBar |
|---|---|
| ![Home](screenshots/home.png) | ![Aksi](screenshots/aksi.png) |
