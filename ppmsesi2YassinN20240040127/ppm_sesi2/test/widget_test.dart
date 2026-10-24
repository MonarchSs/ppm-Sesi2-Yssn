import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ppm_sesi2/main.dart';

void main() {
  testWidgets('Tombol + menaikkan jumlah dan total harga', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Tambah ke Keranjang'), findsOneWidget);

    await tester.ensureVisible(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('Rp 300.000'), findsOneWidget);
  });
}
