// mixin and with

// 1. Mixin Tanımları
mixin UcmaYetisi {
  int ucusIrtifasiMetre = 100;

  void gogeYuksel() {
    print(
      "Uçuş Yetisi: Kanatlarını Açtı ve $ucusIrtifasiMetre metreye Yükseldi",
    );
  }
}

mixin GorunmezlikYetisi {
  void pelerinOrt() {
    print("Görünmezlik: Düşmanların gözünden tamamen kayboldu!");
  }
}

mixin AtesGucuYetisi {
  void alevSaldirisi() {
    print("Ateş Gücü: Kılıcını alevlendirdi ve alanı yaktı");
  }
}

// 2. Temel Sınıf
class TemelKarakter {
  final String ad;
  TemelKarakter({required this.ad});
}

// 3. Karakter Sınıfları
class EfsaneviEjderBinicisi extends TemelKarakter
    with UcmaYetisi, AtesGucuYetisi {
  final String ejderhaAdi;

  EfsaneviEjderBinicisi({
    required this.ejderhaAdi,
    required super.ad,
  });

  void hucumEt() {
    print("$ad ve ejderhası $ejderhaAdi savaşa atılıyor");
    gogeYuksel();
    alevSaldirisi();
  }
}

class GolgeSuikastci extends TemelKarakter with GorunmezlikYetisi {
  GolgeSuikastci({required super.ad});

  void suikastYap() {
    print("$ad hedefe sessizce yaklaşıyor");
    pelerinOrt();
    print("Kritik Darbe Vurdu");
  }
}

// 4. Çalıştırma Testi
void main() {
  final ejderhaBinicisi = EfsaneviEjderBinicisi(
    ad: "Aemon",
    ejderhaAdi: "Balerion",
  );
  ejderhaBinicisi.hucumEt();

  print("---");

  final suikastci = GolgeSuikastci(ad: "Zed");
  suikastci.suikastYap();
}