import 'package:flutter/material.dart';
import 'models.dart';

const List<GameInfo> games = [
  GameInfo(
    id: 'ml',
    name: 'Mobile Legends',
    initials: 'ML',
    color: Color(0xFF1E88E5),
    statLabel: 'Skin',
  ),
  GameInfo(
    id: 'ff',
    name: 'Free Fire',
    initials: 'FF',
    color: Color(0xFFF4511E),
    statLabel: 'Bundle',
  ),
  GameInfo(
    id: 'pubgm',
    name: 'PUBG Mobile',
    initials: 'PM',
    color: Color(0xFFF9A825),
    statLabel: 'Skin Senjata',
  ),
  GameInfo(
    id: 'gi',
    name: 'Genshin Impact',
    initials: 'GI',
    color: Color(0xFF00ACC1),
    statLabel: 'Karakter B5',
  ),
  GameInfo(
    id: 'valo',
    name: 'Valorant',
    initials: 'VL',
    color: Color(0xFFE53935),
    statLabel: 'Skin Senjata',
  ),
  GameInfo(
    id: 'hok',
    name: 'Honor of Kings',
    initials: 'HK',
    color: Color(0xFF43A047),
    statLabel: 'Skin',
  ),
];

final Map<String, GameInfo> gamesById = {
  for (final g in games) g.id: g,
};

/// Data contoh — 15 listing akun (2-3 per game).
const List<Account> accounts = [
  // ── Mobile Legends ──────────────────────────────────────────────
  Account(
    id: 'ml-1',
    gameId: 'ml',
    title: 'Akun Sultan Mythical Glory 1250 Poin, 380 Skin',
    rank: 'Mythical Glory',
    level: 85,
    statCount: 380,
    price: 4500000,
    sellerName: 'BangSultan',
    sellerRating: 4.9,
    sellerSales: 230,
    bindType: 'Moonton',
    description:
        'Akun sultan full skin collector, semua role lengkap. Rank Mythical Glory '
        '1250 poin musim ini. Data aman, siap ganti email dan unbind.',
    verified: true,
    featured: true,
  ),
  Account(
    id: 'ml-2',
    gameId: 'ml',
    title: 'Akun ML Mythic 600 Poin, 210 Skin Legend 3',
    rank: 'Mythic',
    level: 72,
    statCount: 210,
    price: 1850000,
    sellerName: 'TokoAkunID',
    sellerRating: 4.8,
    sellerSales: 512,
    bindType: 'Moonton + Google',
    description:
        'Akun terawat, WR mage 62%. Ada 3 skin Legend, epic limited banyak. '
        'Cocok buat push rank musim depan.',
    verified: true,
    featured: true,
  ),
  Account(
    id: 'ml-3',
    gameId: 'ml',
    title: 'Akun ML Epic Murah, Full Hero',
    rank: 'Epic',
    level: 45,
    statCount: 60,
    price: 350000,
    sellerName: 'AkunMurah88',
    sellerRating: 4.6,
    sellerSales: 98,
    bindType: 'Facebook',
    description:
        'Akun smurf murah meriah, semua hero kebuka. Cocok buat main santai '
        'atau akun kedua.',
  ),
  // ── Free Fire ───────────────────────────────────────────────────
  Account(
    id: 'ff-1',
    gameId: 'ff',
    title: 'Akun FF Sultan Grandmaster, Bundle Rare Lengkap',
    rank: 'Grandmaster',
    level: 78,
    statCount: 150,
    price: 3200000,
    sellerName: 'BangSultan',
    sellerRating: 4.9,
    sellerSales: 230,
    bindType: 'Google + VK',
    description:
        'Bundle event lama lengkap: Hip Hop, Green Criminal, Blue Angel. '
        'SG OPM Level 7, emote rare banyak. Akun old 2018.',
    verified: true,
    featured: true,
  ),
  Account(
    id: 'ff-2',
    gameId: 'ff',
    title: 'Akun FF Diamond, SG OPM + Bundle Incubator',
    rank: 'Diamond III',
    level: 65,
    statCount: 80,
    price: 950000,
    sellerName: 'TokoAkunID',
    sellerRating: 4.8,
    sellerSales: 512,
    bindType: 'Facebook',
    description:
        'Senjata incubator lumayan lengkap, karakter semua kebuka. '
        'Siap tempur ranked maupun CS.',
    verified: true,
  ),
  Account(
    id: 'ff-3',
    gameId: 'ff',
    title: 'Akun FF Platinum Murah Buat Mabar',
    rank: 'Platinum II',
    level: 50,
    statCount: 35,
    price: 275000,
    sellerName: 'AkunMurah88',
    sellerRating: 4.6,
    sellerSales: 98,
    bindType: 'Google',
    description:
        'Akun kedua murah, bundle lumayan buat gaya-gayaan di lobby. '
        'Data aman siap ganti.',
  ),
  // ── PUBG Mobile ────────────────────────────────────────────────
  Account(
    id: 'pubgm-1',
    gameId: 'pubgm',
    title: 'Akun PUBG Conqueror, Glacier M416 Max',
    rank: 'Conqueror',
    level: 76,
    statCount: 120,
    price: 5000000,
    sellerName: 'SultanPUBG',
    sellerRating: 5.0,
    sellerSales: 76,
    bindType: 'Twitter + Google',
    description:
        'M416 Glacier level max, AKM Glacier, UMP45 max. X-Suit 1, mythic '
        'fashion banyak. Frame Conqueror 3 season berturut-turut.',
    verified: true,
    featured: true,
  ),
  Account(
    id: 'pubgm-2',
    gameId: 'pubgm',
    title: 'Akun PUBG Ace, 2 X-Suit + Skin Mobil',
    rank: 'Ace',
    level: 68,
    statCount: 70,
    price: 1500000,
    sellerName: 'TokoAkunID',
    sellerRating: 4.8,
    sellerSales: 512,
    bindType: 'Facebook',
    description:
        'X-Suit Poseidon dan Blood Raven, skin mobil McLaren. '
        'RP dari season M1, title veteran.',
  ),
  // ── Genshin Impact ──────────────────────────────────────────────
  Account(
    id: 'gi-1',
    gameId: 'gi',
    title: 'Akun Genshin Sultan AR60, 18 Karakter B5',
    rank: 'AR 60',
    level: 60,
    statCount: 18,
    price: 6500000,
    sellerName: 'BangSultan',
    sellerRating: 4.9,
    sellerSales: 230,
    bindType: 'HoYoverse',
    description:
        'Karakter limited lengkap dari awal rilis, banyak yang C2-C6 + '
        'signature. Map 100% semua region, primo achievement beres.',
    verified: true,
    featured: true,
  ),
  Account(
    id: 'gi-2',
    gameId: 'gi',
    title: 'Akun Genshin AR55, 10 B5 + Signature',
    rank: 'AR 55',
    level: 55,
    statCount: 10,
    price: 2750000,
    sellerName: 'TokoAkunID',
    sellerRating: 4.8,
    sellerSales: 512,
    bindType: 'HoYoverse + Google',
    description:
        'DPS meta lengkap: Neuvillette, Arlecchino, Mavuika + signature. '
        'Spiral Abyss 36 star gampang.',
  ),
  Account(
    id: 'gi-3',
    gameId: 'gi',
    title: 'Akun Genshin AR50 Starter Hutao + Homa',
    rank: 'AR 50',
    level: 50,
    statCount: 5,
    price: 650000,
    sellerName: 'AkunMurah88',
    sellerRating: 4.6,
    sellerSales: 98,
    bindType: 'HoYoverse',
    description:
        'Akun starter rapi, Hutao + Homa. Quest archon masih banyak, '
        'ladang primo buat gacha.',
  ),
  // ── Valorant ────────────────────────────────────────────────────
  Account(
    id: 'valo-1',
    gameId: 'valo',
    title: 'Akun Valorant Immortal 3, Reaver & Glitchpop',
    rank: 'Immortal 3',
    level: 120,
    statCount: 25,
    price: 2200000,
    sellerName: 'SultanPUBG',
    sellerRating: 5.0,
    sellerSales: 76,
    bindType: 'Riot',
    description:
        'Koleksi Reaver, Glitchpop, Prime lengkap. Rank Immortal 3 peak, '
        'tracker bagus. Region Indonesia.',
    verified: true,
  ),
  Account(
    id: 'valo-2',
    gameId: 'valo',
    title: 'Akun Valorant Diamond 2, Prime & RGX',
    rank: 'Diamond 2',
    level: 85,
    statCount: 12,
    price: 800000,
    sellerName: 'TokoAkunID',
    sellerRating: 4.8,
    sellerSales: 512,
    bindType: 'Riot',
    description:
        'Skin Prime Vandal, RGX Operator, Reaver Sheriff. Battlepass '
        'lengkap beberapa act.',
  ),
  // ── Honor of Kings ──────────────────────────────────────────────
  Account(
    id: 'hok-1',
    gameId: 'hok',
    title: 'Akun HoK Grandmaster 100 Bintang, 200 Skin',
    rank: 'Grandmaster',
    level: 90,
    statCount: 200,
    price: 1200000,
    sellerName: 'BangSultan',
    sellerRating: 4.9,
    sellerSales: 230,
    bindType: 'Google',
    description:
        'Skin Legend dan Collector banyak, hero full + arcana 150. '
        'Akun old server Indonesia.',
  ),
  Account(
    id: 'hok-2',
    gameId: 'hok',
    title: 'Akun HoK Mythic, 5 Skin Legend',
    rank: 'Mythic',
    level: 70,
    statCount: 90,
    price: 550000,
    sellerName: 'AkunMurah88',
    sellerRating: 4.6,
    sellerSales: 98,
    bindType: 'Facebook',
    description:
        'Akun rapi buat push, skin legend 5 biji. Hero meta semua kebuka.',
  ),
];
