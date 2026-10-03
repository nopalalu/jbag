import 'package:flutter/material.dart';
import '../utils/whatsapp.dart';

/// Tab Jual: cara jual akun + CTA WhatsApp.
class SellScreen extends StatelessWidget {
  const SellScreen({super.key});

  Widget _step(String num, String title, String desc, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFFFB300),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Icon(icon, color: Colors.black, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$num. $title',
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jual Akun')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFF2A2A2A)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.monetization_on_outlined,
                  color: Color(0xFFFFB300),
                  size: 40,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Punya akun nganggur?\nJadiin cuan.',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Pasang iklan gratis, tim kami bantu verifikasi, '
                  'dan pembeli langsung hubungi kamu.',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Cara Jual',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
          const SizedBox(height: 10),
          _step(
            '1',
            'Chat admin via WhatsApp',
            'Kirim screenshot profil, rank, dan daftar skin/bundle akunmu.',
            Icons.chat_outlined,
          ),
          const SizedBox(height: 10),
          _step(
            '2',
            'Verifikasi akun',
            'Tim kami cek keaslian data dan bind akun biar pembeli percaya.',
            Icons.verified_outlined,
          ),
          const SizedBox(height: 10),
          _step(
            '3',
            'Iklan tayang',
            'Akunmu tampil di JBAG. Pembeli chat kamu langsung, deal!',
            Icons.storefront_outlined,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => openWhatsApp(sellMessage()),
              icon: const Icon(Icons.chat, color: Colors.white),
              label: const Text(
                'Mulai Jual via WhatsApp',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00C853),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Gratis pasang iklan. Komisi 5% hanya jika terjual.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[500], fontSize: 12),
          ),
        ],
      ),
    );
  }
}
