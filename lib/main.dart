import 'package:flutter/material.dart';
import 'models/item.dart';
import 'pages/items_page.dart';
import 'pages/detail_page.dart';

void main() => runApp(const BelanjaApp());

class BelanjaApp extends StatelessWidget {
  const BelanjaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belanja',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const ItemsPage(),
        '/item': (context) => const DetailPage(),
      },
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
    );
  }
}
