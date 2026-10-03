import 'package:flutter/material.dart';

/// Info game yang diperdagangkan di JBAG.
class GameInfo {
  final String id;
  final String name;
  final String initials;
  final Color color;

  /// Label statistik khas game ini, mis. "Skin", "Bundle", "Karakter B5".
  final String statLabel;

  const GameInfo({
    required this.id,
    required this.name,
    required this.initials,
    required this.color,
    required this.statLabel,
  });
}

/// Satu listing akun game.
class Account {
  final String id;
  final String gameId;
  final String title;
  final String rank;
  final int level;
  final int statCount;
  final int price;
  final String sellerName;
  final double sellerRating;
  final int sellerSales;
  final String bindType;
  final String description;
  final bool verified;
  final bool featured;

  const Account({
    required this.id,
    required this.gameId,
    required this.title,
    required this.rank,
    required this.level,
    required this.statCount,
    required this.price,
    required this.sellerName,
    required this.sellerRating,
    required this.sellerSales,
    required this.bindType,
    required this.description,
    this.verified = false,
    this.featured = false,
  });
}
