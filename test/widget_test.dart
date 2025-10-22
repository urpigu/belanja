import 'package:belanja/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Grid tampil dan navigasi ke halaman detail membawa arguments', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Halaman awal.
    expect(find.text('Belanja'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);

    // Pastikan salah satu item muncul.
    const firstItemName = 'Kopi Arabica';
    expect(find.text(firstItemName), findsOneWidget);

    // Ketuk item dan pastikan berpindah halaman.
    await tester.tap(find.text(firstItemName));
    await tester.pumpAndSettle();

    // Di halaman detail, nama item tetap terlihat dan ada informasi harga.
    expect(find.text(firstItemName), findsOneWidget);
    expect(find.textContaining('Harga'), findsOneWidget);

    // Footer nama & NIM ada.
    expect(find.textContaining('A. A. Ngurah Sadhu Gunawan'), findsOneWidget);
    expect(find.textContaining('2341760168'), findsOneWidget);
  });
}
