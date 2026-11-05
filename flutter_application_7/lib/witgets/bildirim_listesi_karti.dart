import 'package:flutter/material.dart';
import '../models/bildirim_modeli.dart';

class BildirimListesiKarti extends StatelessWidget {
  final List<BildirimModeli> bildirimler;
  final String? token;
  final bool konuyaAboneOl;
  final ValueChanged<bool> onAboneDegisti;

  const BildirimListesiKarti({
    super.key,
    required this.bildirimler,
    required this.token,
    required this.konuyaAboneOl,
    required this.onAboneDegisti,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Başlık Satırı
            Row(
              children: const [
                Icon(
                  Icons.notifications_active_outlined,
                  color: Color(0xFF006C4A),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'FCM Bildirim Merkezi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Token Alanı
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Cihazın FCM Tokeni",
                    style: TextStyle(
                      color: Color.fromARGB(255, 26, 40, 52),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SelectableText(
                    token ?? 'Token alınıyor...',
                    style: const TextStyle(
                      color: Color(0xFF334155),
                      fontSize: 11,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Konu Aboneliği
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Konu Aboneliği (tum_sinif)',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      Text(
                        konuyaAboneOl ? 'Tüm sınıf yayını aktif' : 'Yayın kapalı',
                        style: TextStyle(
                          fontSize: 12,
                          color: konuyaAboneOl
                              ? const Color(0xFF006C4A)
                              : Colors.red.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: konuyaAboneOl,
                  onChanged: onAboneDegisti,
                ),
              ],
            ),
            const SizedBox(height: 14),

            // Bildirim Listesi Başlığı
            Text(
              'Gelen Bildirimler (${bildirimler.length}):',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 8),

            // Bildirim Listesi veya Boş Durum
            bildirimler.isEmpty
                ? Container(
                    padding: const EdgeInsets.all(24),
                    alignment: Alignment.center,
                    child: Text(
                      'Henüz gelen bildirim yok',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: bildirimler.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final b = bildirimler[index];
                      return ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          b.baslik,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        subtitle: Text(
                          b.icerik,
                          style: const TextStyle(fontSize: 12),
                        ),
                        trailing: Text(
                          '${b.tarih.hour.toString().padLeft(2, '0')}:${b.tarih.minute.toString().padLeft(2, '0')}',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
