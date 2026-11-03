typedef MetrikUyariKurali = bool Function(double deger);

void metrikDenetle({
  required String metrikAdi,
  required double mevcutDeger,
  required MetrikUyariKurali kural,
  required void Function(String mesaj) alertTetikleyici,
}) {
  if (kural(mevcutDeger)) {
    alertTetikleyici(
      "Uyarı: $metrikAdi eşik değerini aştı. Mevcut:$mevcutDeger",
    );
  } else {
    print("$metrikAdi normal sınırlar içinde ($mevcutDeger)");
  }
}


void main (){
  print("Metrik Uyarıları");
  final MetrikUyariKurali yuksekCpu=(deger)=>deger>=85.0;
    final MetrikUyariKurali yuksekRam=(deger)=>deger>=95.0;
metrikDenetle(
  metrikAdi: "Cpu",
  mevcutDeger: 92.4,
  kural: yuksekCpu,
  alertTetikleyici: (msg) => print("Bildirim Gönderildi - $msg"),
);
metrikDenetle(
  metrikAdi: "Ram",
  mevcutDeger: 64.0,
  kural: yuksekRam,
  alertTetikleyici: (msg) => print(("Bildirim Gönderildi -> $msg")),
);

}