
# Praktikum 5 — Membangun Navigasi di Flutter (Belanja)

Jobsheet ini mendokumentasikan proses membangun **navigasi halaman** pada aplikasi Flutter bertema _Belanja_. Fokus utama berada pada dua pendekatan: **Navigator berbasis _named routes_ dengan `arguments`** dan **migrasi ke `go_router`** sebagai solusi _declarative routing_ modern. Selain fungsi navigasi standar, implementasi juga memperlihatkan **pembacaan data dari halaman sebelumnya**, **penggunaan `Hero` untuk animasi transisi gambar**, **perombakan tampilan menjadi `GridView` seperti aplikasi marketplace**, serta **penambahan identitas penulis (Nama & NIM) pada bagian footer**. Seluruh perubahan disertai **tangkapan layar** agar alur berpikir dan hasilnya terlihat jelas.

---

## 🚀 Ringkasan
- **Tujuan**: Mempraktikkan navigasi Flutter mulai dari _named routes_ (`Navigator.pushNamed`) hingga `go_router`, lengkap dengan _data passing_, `Hero`, dan tata letak `GridView`.
- **Cakupan**: Implementasi halaman daftar barang (`ItemsPage`) dan halaman detail (`DetailPage`), model `Item`, serta pengujian `widget_test.dart` untuk memastikan navigasi dan komponen UI bekerja.
- **Hasil akhir**: Aplikasi menampilkan daftar produk dalam **grid**, gambar produk **bertransisi halus** ketika ditekan, halaman detail menampilkan **harga, stok, rating**, dan **footer** berisi **A. A. Ngurah Sadhu Gunawan — 2341760168**. Versi kedua memanfaatkan **`go_router`** untuk konfigurasi rute yang lebih ringkas, aman, dan mudah diuji.

---

## 📂 Struktur Proyek (ringkas)
```
belanja/
├─ lib/
│  ├─ models/
│  │  └─ item.dart                 
│  └─ pages/
│     ├─ items_page.dart           
│     └─ detail_page.dart          
├─ test/
│  └─ widget_test.dart             
├─ assets/
│  └─ images/                       
└─ pubspec.yaml                    
```
Struktur di atas dipilih agar **tanggung jawab file jelas**: model pada `models/`, screen/page pada `pages/`, aset pada `assets/`, dan konfigurasi paket pada `pubspec.yaml`. Pemisahan ini membuat **navigasi dan UI mudah dipelihara**, terutama saat beralih dari `Navigator` ke `go_router` tanpa mengubah logika tampilan inti.

---

## 🧭 Fitur & Jawaban Tugas Praktikum 5
1. **Pengiriman data antar-halaman dengan `Navigator.pushNamed(..., arguments: item)`**  
   Pada halaman daftar (`ItemsPage`), setiap kartu produk membungkus gambar dan teks di dalam `InkWell`. Saat ditekan, aplikasi memanggil `Navigator.pushNamed` menuju rute `'/item'` sembari menyertakan objek `Item` melalui parameter `arguments`. Strategi ini memisahkan **definisi rute** dari **pemanggilan navigasi**, sehingga kode lebih rapi dan mudah diuji.  

2. **Pembacaan data pada halaman tujuan menggunakan `ModalRoute.of(context)!.settings.arguments`**  
   Di `DetailPage` (versi Navigator), data yang diterima dibaca melalui `ModalRoute`. Karena tipe `arguments` generik, dilakukan _cast_ ke `Item`. Praktik ini memudahkan pemakaian ulang komponen UI, sekaligus menegaskan bahwa halaman detail **tidak membuat data sendiri**, melainkan **mengkonsumsi data** yang dipilih pengguna dari halaman sebelumnya.  

3. **Perombakan tampilan akhir menjadi `GridView` seperti marketplace**  
   `ItemsPage` menggunakan `GridView.builder` dengan `SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2 )` agar produk tersusun **rapi dua kolom**, memiliki _spacing_ yang konsisten, dan proporsi kartu yang seimbang (`childAspectRatio`). Pendekatan ini lebih efisien dibanding `ListView` ketika menampilkan katalog produk karena memanfaatkan **_lazy building_** dan **recycling item**.  

4. **Implementasi `Hero` pada gambar produk**  
   Gambar pada kartu item dibungkus `Hero(tag: 'item-hero-<nama>')`. Di `DetailPage` tag yang sama juga dipakai. Hasilnya, ketika pengguna berpindah ke halaman detail, gambar **melayang mulus** dari posisi grid menuju tampilan besar di tengah layar. Efek ini meningkatkan **persepsi kualitas** dan **keterkaitan visual** antar-halaman.  

5. **Penyesuaian UI dan identitas penulis**  
   UI diperindah dengan `Card`, `ClipRRect`, `RoundedRectangleBorder`, ikon `Icons.star` untuk rating, dan _padding_ yang proporsional. Di bagian bawah (`bottomNavigationBar`), ditampilkan **footer**: _“A. A. Ngurah Sadhu Gunawan — 2341760168”_. Footer ini konsisten di dua halaman sehingga **identitas tugas selalu terlihat** saat penguji melakukan navigasi.  

6. **Migrasi ke `go_router` (opsional pada Jobsheet, dikerjakan di sini)**  
   Versi kedua memindahkan konfigurasi rute ke objek `GoRouter` dan mengganti pemanggilan `Navigator.pushNamed` menjadi `context.push('/item', extra: item)`. Di `DetailPage`, data tidak lagi diakses melalui `ModalRoute`, melainkan **parameter konstruktor**. Perubahan ini membuat **kontrak data eksplisit**, mengurangi _runtime cast_, dan **lebih mudah diuji**. Selain itu, `MaterialApp.router` dengan `routerConfig` menyederhanakan pengelolaan _deep-linking_ serta _redirect_ apabila kelak aplikasi bertambah kompleks.

> Ringkasnya, keenam butir di atas telah dikerjakan mulai dari implementasi dasar hingga migrasi ke `go_router`, sambil memastikan pengalaman pengguna konsisten dan kode lebih terstruktur.

---

## 🖼️ Dokumentasi Screenshot
> Seluruh gambar tersimpan di `assets/images/` (nama file mengikuti yang ada pada repo ini).

### A. Kode & Tampilan Awal (sebelum modifikasi)

- ![main.dart (Pertama)](assets/main.dart-(Pertama).png)

- ![items_page.dart (Pertama)](assets/items_page.dart-(Pertama).png)

- ![item_page.dart (Pertama)](assets/item_page.dart-(Pertama).png)

### B. Hasil Setelah Praktikum 2 (Navigator + GridView + Hero + Footer)

- ![item.dart (Tugas Praktikum 2)](assets/item.dart-(Tugas-Praktikum-2).png)

- ![items_page.dart (Tugas Praktikum 2)](assets/items_page.dart-(Tugas-Praktikum-2).png)

- ![detail_Page.dart (Tugas Praktikum 2)](assets/detail_Page.dart-(Tugas-Praktikum-2).png)

- ![Hasil 1 (Tugas Praktikum 2)](assets/hasil-1-(Tugas-Praktikum-2).png)

- ![Hasil 2 (Tugas Praktikum 2)](assets/hasil-2-(Tugas-Praktikum-2).png)

### C. Migrasi ke `go_router` (versi terbaru)

- ![pubspec.yaml (Terbaru — go_router)](assets/pubspec.yaml-(Terbaru---go_router).png)

- ![main.dart (Terbaru — go_router)](assets/main.dart-(Terbaru---go_router).png)

- ![main.dart (Terbaru — go_router, varian 2)](assets/main.dart-(Terbaru---go_router).png)

- ![item_pages.dart (Terbaru — go_router)](assets/item_pages.dart-(Terbaru---go_router).png)

- ![detail_pages.dart (Terbaru — go_router)](assets/detail_pages.dart-(Terbaru---go_router).png)

> Penamaan file menggunakan tanda kurung `()` dan tanda hubung `-` seperti pada tangkapan layar. Jika pratinjau Markdown Anda tidak menampilkan gambar, pastikan path relatif dan nama file **persis sama** dengan yang ada di folder `assets/images/`.

---

## 🧪 Pengujian (widget_test.dart)
Pengujian end-to-end mini disiapkan di `test/widget_test.dart`. Skenarionya memuat aplikasi (`pumpWidget(const MyApp())`), lalu memverifikasi bahwa **judul “Belanja” dan `GridView`** muncul di halaman awal, **salah satu item** (mis. _“Kopi Arabica”_) dapat ditekan sehingga **berpindah ke halaman detail** (`pumpAndSettle()` memastikan animasi selesai), serta **footer** berisi nama dan NIM benar-benar tampil. Dengan cara ini, kita tidak hanya menguji logika navigasi, tetapi juga mengecek **kontrak UI** yang menjadi syarat kelulusan tugas. Pendekatan ini membantu mendeteksi regresi jika di masa depan halaman diperluas atau rute diganti ke `go_router` karena _behavior_ yang diuji tetap sama.

---

## ▶️ Cara Menjalankan
1. Pastikan **Flutter SDK** terpasang dan emulator/ponsel tersambung.
2. Jalankan perintah:
   ```bash
   flutter pub get
   flutter run
   ```
3. (Opsional) Menjalankan pengujian:
   ```bash
   flutter test
   ```

---

## 🛠️ Troubleshooting Singkat
- **Gambar tidak muncul / error asset**: pastikan `pubspec.yaml` memuat:
  ```yaml
  flutter:
    uses-material-design: true
    assets:
      - assets/images/
  ```
  Lalu jalankan `flutter pub get` atau `flutter clean` → `flutter pub get` agar _asset manifest_ diperbarui.
- **Navigasi tidak berpindah**: cek apakah rute sudah terdaftar; pada versi `go_router` pastikan `context.push('/item', extra: item)` dipanggil dan `DetailPage` menerima parameter `item` pada konstruktor.
- **Emulator Android tidak merespons**: hentikan semua instance emulator, jalankan ulang `adb` (`adb kill-server && adb start-server`), atau jalankan di perangkat fisik untuk memisahkan isu IDE/AVD dari kode aplikasi.
- **Widget test gagal**: pastikan teks yang dicari pada pengujian (mis. nama produk) **ada di data contoh**; gunakan `pumpAndSettle()` agar animasi `Hero` selesai sebelum melakukan `expect` di halaman detail.

---

## 👤 Author
- **Nama**: A. A. Ngurah Sadhu Gunawan
- **NIM**: 2341760168
