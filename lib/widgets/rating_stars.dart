import 'package:flutter/material.dart';

/// Bintang rating kecil, mis. ★ 4.9
class RatingStars extends StatelessWidget {
  final double rating;
  final double size;

  const RatingStars({super.key, required this.rating, this.size = 14});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, size: size, color: const Color(0xFFFFB300)),
        const SizedBox(width: 2),
        Text(
          rating.toStringAsFixed(1),
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: size - 2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
