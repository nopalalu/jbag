import 'package:flutter/material.dart';
import '../utils/whatsapp.dart';

/// Tab Profil: info pengguna & aplikasi.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget _menuTile({
    required IconData icon,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFFFB300)),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: TextStyle(color: Colors.grey[500], fontSize: 12),
              )
            : null,
        trailing: Icon(Icons.chevron_right, color: Colors.grey[600]),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
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
            child: Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFB300),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'JB',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pengunjung',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Jelajahi ribuan akun game\nsecond terpercaya.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _menuTile(
            icon: Icons.storefront_outlined,
            title: 'Jual Akun Saya',
            subtitle: 'Pasang iklan gratis via WhatsApp',
            onTap: () => openWhatsApp(sellMessage()),
          ),
          _menuTile(
            icon: Icons.help_outline,
            title: 'Pusat Bantuan',
            subtitle: 'FAQ transaksi aman',
          ),
          _menuTile(
            icon: Icons.description_outlined,
            title: 'Syarat & Ketentuan',
            subtitle: 'Aturan jual beli di JBAG',
          ),
          _menuTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Kebijakan Privasi',
            subtitle: 'Bagaimana datamu dilindungi',
          ),
          _menuTile(
            icon: Icons.chat_outlined,
            title: 'Hubungi Admin',
            subtitle: 'Fast respon via WhatsApp',
            onTap: () => openWhatsApp(
              'Halo JBAG! Saya butuh bantuan.',
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'JBAG v1.0.0 • Dibuat dengan bangga di Indonesia',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
