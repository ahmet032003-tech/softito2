import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_7/models/bildirim_modeli.dart';
import 'package:flutter_application_7/witgets/bildirim_listesi_karti.dart';
import 'package:flutter_application_7/witgets/gorsel_yukleme_karti.dart';

void main() {
  test('BildirimModeli oluşturma ve copyWith testi', () {
    final now = DateTime.now();
    final model = BildirimModeli(
      id: '1',
      baslik: 'Test Başlık',
      icerik: 'Test İçerik',
      tarih: now,
    );

    expect(model.id, '1');
    expect(model.baslik, 'Test Başlık');
    expect(model.icerik, 'Test İçerik');
    expect(model.okunduMu, false);

    final guncel = model.copyWith(okunduMu: true);
    expect(guncel.okunduMu, true);
    expect(guncel.id, '1');
  });

  testWidgets('GorselYuklemeKarti temel arayüz testi', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GorselYuklemeKarti(
            secilenDosya: null,
            yuklenenUrl: null,
            yuklenmeOrani: 0.0,
            yukleniyorMu: false,
            onGaleridenSec: () {},
            onKameradanCek: () {},
            onBulutaYukle: () {},
          ),
        ),
      ),
    );

    expect(find.text('Firebase Medya Yükleyici'), findsOneWidget);
    expect(find.text('Henüz bir görsel seçilmedi'), findsOneWidget);
    expect(find.text('Galeri'), findsOneWidget);
    expect(find.text('Kamera'), findsOneWidget);
  });

  testWidgets('BildirimListesiKarti temel arayüz testi', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BildirimListesiKarti(
            bildirimler: const [],
            token: 'test_fcm_token_123',
            konuyaAboneOl: false,
            onAboneDegisti: (_) {},
          ),
        ),
      ),
    );

    expect(find.text('FCM Bildirim Merkezi'), findsOneWidget);
    expect(find.text('test_fcm_token_123'), findsOneWidget);
    expect(find.text('Henüz gelen bildirim yok'), findsOneWidget);
  });
}
