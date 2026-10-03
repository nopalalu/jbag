import 'package:flutter/material.dart';
import '../data.dart';
import '../models.dart';
import '../widgets/account_card.dart';
import '../widgets/game_chip.dart';
import 'detail_screen.dart';

/// Tab Cari: search + filter game + sortir harga.
class BrowseScreen extends StatefulWidget {
  final ValueNotifier<String?> gameFilter;

  const BrowseScreen({super.key, required this.gameFilter});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  String _query = '';
  String? _selectedGame;
  String _sort = 'Termurah';
  final _searchCtrl = TextEditingController();

  static const _sortOptions = ['Termurah', 'Termahal', 'Rating Tertinggi'];

  @override
  void initState() {
    super.initState();
    _selectedGame = widget.gameFilter.value;
    widget.gameFilter.addListener(_onExternalFilter);
  }

  void _onExternalFilter() {
    setState(() {
      _selectedGame = widget.gameFilter.value;
      _searchCtrl.clear();
      _query = '';
    });
  }

  @override
  void dispose() {
    widget.gameFilter.removeListener(_onExternalFilter);
    _searchCtrl.dispose();
    super.dispose();
  }

  List<Account> get _filtered {
    final q = _query.trim().toLowerCase();
    final list = accounts.where((a) {
      final game = gamesById[a.gameId]!;
      final matchQuery = q.isEmpty ||
          a.title.toLowerCase().contains(q) ||
          game.name.toLowerCase().contains(q) ||
          a.rank.toLowerCase().contains(q);
      final matchGame = _selectedGame == null || a.gameId == _selectedGame;
      return matchQuery && matchGame;
    }).toList();
    switch (_sort) {
      case 'Termahal':
        list.sort((a, b) => b.price.compareTo(a.price));
      case 'Rating Tertinggi':
        list.sort((a, b) => b.sellerRating.compareTo(a.sellerRating));
      default:
        list.sort((a, b) => a.price.compareTo(b.price));
    }
    return list;
  }

  void _openDetail(Account a) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailScreen(account: a)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final results = _filtered;
    return Scaffold(
      appBar: AppBar(title: const Text('Cari Akun')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: TextField(
              controller: _searchCtrl,
              onChanged: (v) => setState(() => _query = v),
              decoration: InputDecoration(
                hintText: 'Cari akun, game, rank...',
                hintStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF2A2A2A)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF2A2A2A)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFFFB300)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 42,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: games.length + 1,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                if (i == 0) {
                  return GameChip(
                    label: 'Semua',
                    selected: _selectedGame == null,
                    onTap: () => setState(() => _selectedGame = null),
                  );
                }
                final g = games[i - 1];
                return GameChip(
                  label: g.name,
                  selected: _selectedGame == g.id,
                  onTap: () => setState(
                    () => _selectedGame = _selectedGame == g.id ? null : g.id,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${results.length} akun ditemukan',
                  style: TextStyle(color: Colors.grey[400], fontSize: 13),
                ),
                DropdownButton<String>(
                  value: _sort,
                  dropdownColor: const Color(0xFF1E1E1E),
                  underline: const SizedBox(),
                  style: const TextStyle(
                    color: Color(0xFFFFB300),
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                  items: _sortOptions
                      .map((s) =>
                          DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (v) {
                    if (v != null) setState(() => _sort = v);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: results.isEmpty
                ? Center(
                    child: Text(
                      'Tidak ada akun yang cocok.\nCoba kata kunci lain.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    itemCount: results.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: 12),
                    itemBuilder: (_, i) => AccountCard(
                      account: results[i],
                      onTap: () => _openDetail(results[i]),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
