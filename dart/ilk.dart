// Klasik sıralı (positional) arrow fonksiyon
double topla(double a, double b) => a + b;

// Modern Dart / Flutter standartları: Named parameters ({})
void seansKaydiOlustur({
  required String danisan,
  required String tedavi,
  required double birimFiyat,
  int seansSayisi = 1, // default değer
  double indirimOrani = 0.0, // default değer
  String? uzmanHekim, // null olabilir (nullable)
}) {
  final double brutTutar = birimFiyat * seansSayisi;
  final double indirimTutari = brutTutar * (indirimOrani / 100);
  final double netTutar = brutTutar - indirimTutari;

  print("----------------------------------");
  print("Danışan: $danisan");
  print("Tedavi: $tedavi");
  print("Hekim: ${uzmanHekim ?? 'Atanmadı'}");
  print("Seans Adedi: $seansSayisi");
  print("Brüt Tutar: $brutTutar ₺");
  print("İndirim: %$indirimOrani ($indirimTutari ₺)");
  print("Net Tutar: $netTutar ₺");
  print("----------------------------------");
}

void main() {
  // Arrow fonksiyon kullanımı
  print("Toplam: ${topla(150, 250)}");

  // Named Parameter (İsimlendirilmiş Parametre) kullanımı
  // Parametre sırası bağımsızdır, varsayılan değerler otomatik atanır.
  seansKaydiOlustur(
    danisan: "Selin Kaya",
    tedavi: "Lazer Epilasyon",
    birimFiyat: 1500,
    seansSayisi: 3,
    indirimOrani: 10,
    uzmanHekim: "Dr. Aygen Yıldırım",
  );

  // Opsiyonel parametreler (seansSayisi, indirimOrani, uzmanHekim) olmadan çağrılış
  seansKaydiOlustur(
    danisan: "Meryem Tur",
    tedavi: "Medikal Bakım",
    birimFiyat: 2000,
  );
}