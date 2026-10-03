import 'package:flutter/material.dart';
import '../data.dart';
import '../models.dart';
import '../widgets/account_card.dart';
import '../widgets/game_chip.dart';
import 'detail_screen.dart';

/// Beranda: logo, search, chip game, akun unggulan, semua akun.
class HomeScreen extends StatelessWidget {
  final void Function({String? gameId}) onBrowse;

  const HomeScreen({super.key, required this.onBrowse});

  void _openDetail(BuildContext context, Account a) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailScreen(account: a)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final featured = accounts.where((a) => a.featured).toList();
    final rest = accounts.where((a) => !a.featured).toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFFFB300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'JBAG',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Jual Beli Akun Game',
              style: TextStyle(color: Colors.grey[400], fontSize: 13),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Search bar (navigasi ke tab Cari)
          GestureDetector(
            onTap: () => onBrowse(),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF2A2A2A)),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[500]),
                  const SizedBox(width: 10),
                  Text(
                    'Cari akun game impianmu...',
                    style: TextStyle(color: Colors.grey[500], fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Pilih Game',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 42,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: games.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final g = games[i];
                return GameChip(
                  label: g.name,
                  selected: false,
                  onTap: () => onBrowse(gameId: g.id),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Akun Unggulan',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 148,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: featured.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, i) {
                return SizedBox(
                  width: 300,
                  child: AccountCard(
                    account: featured[i],
                    onTap: () => _openDetail(context, featured[i]),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Semua Akun',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
              ),
              TextButton(
                onPressed: () => onBrowse(),
                child: const Text(
                  'Lihat Semua',
                  style: TextStyle(color: Color(0xFFFFB300)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ...rest.map(
            (a) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AccountCard(
                account: a,
                onTap: () => _openDetail(context, a),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
