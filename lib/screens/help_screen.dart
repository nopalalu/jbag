import 'package:flutter/material.dart';

/// Tab Bantuan: FAQ transaksi aman.
class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  static const _faqs = [
    (
      'Apakah transaksi di JBAG aman?',
      'Ya. Selalu gunakan tombol "Beli via WhatsApp" resmi dan jangan pernah '
          'transfer ke nomor yang diberikan penjual di luar jalur JBAG. '
          'Minta bukti berupa screenshot login dan video profil akun sebelum membayar.'
    ),
    (
      'Bagaimana sistem pembayarannya?',
      'Setelah deal di WhatsApp, pembeli transfer ke penjual. Untuk nominal '
          'besar, disarankan pakai jasa rekber (rekening bersama) agar dana '
          'aman sampai data akun berhasil dipindah tangankan.'
    ),
    (
      'Apa itu "bind" akun?',
      'Bind adalah akun pihak ketiga yang tertaut ke akun game (mis. Moonton, '
          'Google, Facebook, VK). Pastikan penjual melepas bind lamanya dan '
          'kamu menautkan bind milikmu sendiri setelah membeli.'
    ),
    (
      'Apa yang harus dilakukan setelah membeli akun?',
      'Segera ganti email, password, dan tautkan bind milikmu. Aktifkan '
          'verifikasi dua langkah jika gamenya mendukung. Simpan bukti '
          'transaksi dan chat sebagai jaga-jaga.'
    ),
    (
      'Apakah ada garansi / refund?',
      'Jika akun bermasalah dalam 1x24 jam setelah serah terima (mis. tidak '
          'bisa login padahal data benar), hubungi admin JBAG via WhatsApp '
          'untuk mediasi dengan penjual.'
    ),
    (
      'Bagaimana cara menjual akunku?',
      'Buka tab "Jual", lalu chat admin via WhatsApp. Siapkan screenshot '
          'profil, rank, dan koleksi skin/bundle. Tim kami verifikasi dulu '
          'sebelum iklanmu tayang.'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bantuan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF00C853).withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF00C853).withOpacity(0.35),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.shield_outlined,
                  color: Color(0xFF00C853),
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Keamananmu prioritas kami. Baca panduan di bawah '
                    'sebelum bertransaksi.',
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Pertanyaan Umum',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
          const SizedBox(height: 8),
          ..._faqs.map(
            (f) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF2A2A2A)),
                ),
                child: ExpansionTile(
                  title: Text(
                    f.$1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  iconColor: const Color(0xFFFFB300),
                  collapsedIconColor: Colors.grey[500],
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Text(
                        f.$2,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 13,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
