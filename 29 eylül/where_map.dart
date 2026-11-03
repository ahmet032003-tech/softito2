class SunucuMetrigi{
  final String hostAdi;
  final String bolge;
  final double cpuYuzdesi;
  final double ramGb;
  final int aktifBaglantiSayisi;
  final bool kritikMi;

  const SunucuMetrigi({
    required this.hostAdi,
    required this.bolge,
    required this.cpuYuzdesi,
    required this.ramGb,
    required this.aktifBaglantiSayisi,
    this.kritikMi=false,
  });

@override
  String toString() =>
      "$hostAdi [$bolge] (CPU: %$cpuYuzdesi,Ram:${ramGb}GB,Conn: $aktifBaglantiSayisi)";
      
}
}