import 'package:flutter/material.dart';
import '../data.dart';
import '../models.dart';
import '../utils/format.dart';
import '../utils/whatsapp.dart';
import '../widgets/rating_stars.dart';

/// Detail akun: banner game, spek, deskripsi, penjual, tombol beli WA.
class DetailScreen extends StatelessWidget {
  final Account account;

  const DetailScreen({super.key, required this.account});

  Widget _specTile(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[500], fontSize: 11)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final game = gamesById[account.gameId]!;
    return Scaffold(
      appBar: AppBar(title: Text(game.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner game
            Container(
              width: double.infinity,
              color: game.color,
              padding: const EdgeInsets.symmetric(vertical: 28),
              child: Column(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      game.initials,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    game.name.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          account.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            height: 1.35,
                          ),
                        ),
                      ),
                      if (account.verified)
                        const Icon(
                          Icons.verified,
                          color: Color(0xFF00C853),
                          size: 22,
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    formatRupiah(account.price),
                    style: const TextStyle(
                      color: Color(0xFFFFB300),
                      fontWeight: FontWeight.w900,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Spesifikasi Akun',
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                  ),
                  const SizedBox(height: 8),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2.6,
                    children: [
                      _specTile('Rank', account.rank),
                      _specTile('Level', '${account.level}'),
                      _specTile(game.statLabel, '${account.statCount}'),
                      _specTile('Bind', account.bindType),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Deskripsi',
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    account.description,
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Penjual',
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(12),
                      border:
                          Border.all(color: const Color(0xFF2A2A2A)),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xFFFFB300),
                          child: Text(
                            account.sellerName[0].toUpperCase(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                account.sellerName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${account.sellerSales} transaksi berhasil',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RatingStars(rating: account.sellerRating, size: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00C853).withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF00C853).withOpacity(0.35),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.shield_outlined,
                          color: Color(0xFF00C853),
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Tips aman: jangan transfer di luar JBAG, '
                            'minta bukti login screen, dan pastikan data '
                            'bind bisa diganti sebelum pembayaran lunas.',
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 12,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
          decoration: const BoxDecoration(
            color: Color(0xFF1A1A1A),
            border: Border(top: BorderSide(color: Color(0xFF2A2A2A))),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Harga',
                      style:
                          TextStyle(color: Colors.grey[500], fontSize: 11),
                    ),
                    Text(
                      formatRupiah(account.price),
                      style: const TextStyle(
                        color: Color(0xFFFFB300),
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton.icon(
                  onPressed: () =>
                      openWhatsApp(buyMessage(account)),
                  icon: const Icon(Icons.chat, color: Colors.white),
                  label: const Text(
                    'Beli via WhatsApp',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C853),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
