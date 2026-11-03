void main() {
  final Set<String> temelServisler = {
    "kimlik-dogrulama-servisi",
    "odeme-servisi",
    "bildirim-servisi",
    "kimlik-dogrulama-servisi",
  };

  bool canliOrtamMi = true;

  final List<String> tumServisler = [
    ...temelServisler,
    if (canliOrtamMi) "kasada-gizli-anahtar-yoneticisi",
  ];

  print("Aktif Servis Listesi: $tumServisler");
}