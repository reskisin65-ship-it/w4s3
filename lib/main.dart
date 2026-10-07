import 'package:flutter/material.dart';

// Import memakai path relatif, jadi tidak perlu mengganti nama proyek.
import 'widget_basic/counter_widget.dart';
import 'widget_basic/textfield_widget.dart';
import 'widget_basic/form_widget.dart';
import 'widget_basic/dialog_widget.dart';
import 'pages/produk_list_page.dart';
import 'pages/main_navigation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAM W4S3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MenuUtamaPage(),
    );
  }
}

/// Satu item menu: judul, deskripsi, ikon, dan halaman tujuan.
class _MenuItem {
  final String judul;
  final String deskripsi;
  final IconData ikon;
  final Widget Function() halaman;

  const _MenuItem(this.judul, this.deskripsi, this.ikon, this.halaman);
}

class MenuUtamaPage extends StatelessWidget {
  const MenuUtamaPage({super.key});

  // Tambah demo baru cukup dengan menambah satu baris di list ini.
  List<_MenuItem> get _menu => [
        _MenuItem('1. Counter', 'StatefulWidget & setState',
            Icons.exposure, () => const CounterWidget()),
        _MenuItem('2. TextField', 'Input teks real-time',
            Icons.text_fields, () => const TextFieldWidget()),
        _MenuItem('3. Form & Validasi', 'TextFormField + validator',
            Icons.assignment, () => const FormWidget()),
        _MenuItem('4. Navigasi Antar Halaman', 'Kirim & terima data',
            Icons.list_alt, () => ProdukListPage()),
        _MenuItem('5. Dialog & SnackBar', 'AlertDialog konfirmasi hapus',
            Icons.warning_amber, () => const DialogWidget()),
        _MenuItem('6. BottomNavigationBar', 'Navigasi antar tab',
            Icons.tab, () => const MainNavigationPage()),
      ];

  @override
  Widget build(BuildContext context) {
    final menu = _menu;
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Demo W4S3')),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: menu.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = menu[index];
          return Card(
            child: ListTile(
              leading: Icon(item.ikon),
              title: Text(item.judul),
              subtitle: Text(item.deskripsi),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item.halaman()),
                );
              },
            ), // ListTile
          ); // Card
        },
      ), // ListView.separated
    ); // Scaffold
  }
}