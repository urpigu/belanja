import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'models/item.dart';
import 'pages/items_page.dart';
import 'pages/detail_page.dart';

void main() {
  runApp(const MyApp());
}

/// Konfigurasi router aplikasi.
/// /            -> ItemsPage()
/// /item        -> DetailPage(item)  (data dikirim via state.extra)
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const ItemsPage()),
    GoRoute(
      path: '/item',
      builder: (context, state) {
        final item = state.extra as Item; // terima data dari push extra
        return DetailPage(item: item);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Belanja',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.green, useMaterial3: true),
      routerConfig: _router,
    );
  }
}
