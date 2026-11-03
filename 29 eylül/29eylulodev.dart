enum CihazTipi { sensor, gateway, edgeServer, router }

class CihazErisilemezException implements Exception {
  final String mesaj;

  CihazErisilemezException(this.mesaj);

  @override
  String toString() => mesaj;
}

class IoTCihaz {
  final String seriNo;
  final String cihazAdi;
  final CihazTipi tip;
  final double cpuYukYuzdesi;
  final int bellekMb;
  final Set<String> acikPortlar;
  final bool sslSertifikasiGecerliMi;
  final bool aktifMi;

  IoTCihaz({
    required this.seriNo,
    required this.cihazAdi,
    required this.tip,
    required this.cpuYukYuzdesi,
    required this.bellekMb,
    required this.acikPortlar,
    required this.sslSertifikasiGecerliMi,
    this.aktifMi = true,
  });

  bool get guvenlikAcigiVarMi =>
      !sslSertifikasiGecerliMi || acikPortlar.contains("23/TELNET");

  bool get riskliMi => guvenlikAcigiVarMi || cpuYukYuzdesi > 85.0;
}

String izolasyonBolgesiGetir(CihazTipi tip) {
  return switch (tip) {
    CihazTipi.sensor => "ZONE-S",
    CihazTipi.gateway => "ZONE-G",
    CihazTipi.edgeServer => "ZONE-E",
    CihazTipi.router => "ZONE-R",
  };
}

(String cihazAdi, CihazTipi tip, bool alarmDurumu) cihazBilgisiGetir(
  List<IoTCihaz> cihazlar,
  String seriNo,
) {
  final cihaz = cihazlar.firstWhere(
    (c) => c.seriNo == seriNo,
    orElse: () => throw CihazErisilemezException("Erişilemedi: $seriNo"),
  );

  if (!cihaz.aktifMi) {
    throw CihazErisilemezException("Cihaz kapalı: $seriNo");
  }

  return (cihaz.cihazAdi, cihaz.tip, cihaz.riskliMi);
}

void main() {
  final List<IoTCihaz> iotAgi = [
    IoTCihaz(
      seriNo: "SN-101",
      cihazAdi: "Sıcaklık Sensörü",
      tip: CihazTipi.sensor,
      cpuYukYuzdesi: 12.0,
      bellekMb: 128,
      acikPortlar: {"80/HTTP"},
      sslSertifikasiGecerliMi: true,
    ),
    IoTCihaz(
      seriNo: "SN-102",
      cihazAdi: "Ana Gateway",
      tip: CihazTipi.gateway,
      cpuYukYuzdesi: 92.5,
      bellekMb: 1024,
      acikPortlar: {"80/HTTP", "443/HTTPS"},
      sslSertifikasiGecerliMi: true,
    ),
    IoTCihaz(
      seriNo: "SN-103",
      cihazAdi: "Saha Edge Sunucu",
      tip: CihazTipi.edgeServer,
      cpuYukYuzdesi: 45.0,
      bellekMb: 4096,
      acikPortlar: {"22/SSH", "23/TELNET"},
      sslSertifikasiGecerliMi: true,
    ),
    IoTCihaz(
      seriNo: "SN-104",
      cihazAdi: "Merkez Router",
      tip: CihazTipi.router,
      cpuYukYuzdesi: 30.0,
      bellekMb: 2048,
      acikPortlar: {"80/HTTP"},
      sslSertifikasiGecerliMi: false,
    ),
    IoTCihaz(
      seriNo: "SN-105",
      cihazAdi: "Nem Sensörü",
      tip: CihazTipi.sensor,
      cpuYukYuzdesi: 15.0,
      bellekMb: 256,
      acikPortlar: {"80/HTTP"},
      sslSertifikasiGecerliMi: true,
    ),
    IoTCihaz(
      seriNo: "SN-106",
      cihazAdi: "Yedek Gateway",
      tip: CihazTipi.gateway,
      cpuYukYuzdesi: 50.0,
      bellekMb: 512,
      acikPortlar: {"80/HTTP"},
      sslSertifikasiGecerliMi: true,
      aktifMi: false,
    ),
  ];

  final riskliCihazlar = iotAgi.where((c) => c.riskliMi).toList();

  final int toplamBellek = iotAgi.fold(
    0,
    (toplam, cihaz) => toplam + cihaz.bellekMb,
  );

  try {
    var (adi, tip, alarm) = cihazBilgisiGetir(iotAgi, "SN-101");
    print("$adi - ${tip.name} - $alarm");
  } catch (e) {
    print(e);
  }

  try {
    var (adi, tip, alarm) = cihazBilgisiGetir(iotAgi, "SN-106");
    print("$adi - ${tip.name} - $alarm");
  } catch (e) {
    print(e);
  }
}