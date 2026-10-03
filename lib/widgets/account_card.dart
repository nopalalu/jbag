import 'package:flutter/material.dart';
import '../data.dart';
import '../models.dart';
import '../utils/format.dart';
import 'rating_stars.dart';

/// Kartu listing akun: tile game + judul + spek + harga + rating.
class AccountCard extends StatelessWidget {
  final Account account;
  final VoidCallback onTap;

  const AccountCard({super.key, required this.account, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final game = gamesById[account.gameId]!;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: game.color,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                game.initials,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          account.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            height: 1.3,
                          ),
                        ),
                      ),
                      if (account.verified)
                        const Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Icon(
                            Icons.verified,
                            size: 16,
                            color: Color(0xFF00C853),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${account.rank} • Lv.${account.level} • '
                    '${account.statCount} ${game.statLabel}',
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatRupiah(account.price),
                        style: const TextStyle(
                          color: Color(0xFFFFB300),
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                      ),
                      RatingStars(rating: account.sellerRating),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
