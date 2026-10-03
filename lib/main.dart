import 'package:flutter/material.dart';
import 'screens/browse_screen.dart';
import 'screens/help_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/sell_screen.dart';

void main() {
  runApp(const JbagApp());
}

class JbagApp extends StatelessWidget {
  const JbagApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JBAG',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFFFFB300),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFFB300),
          secondary: Color(0xFF00C853),
          surface: Color(0xFF1E1E1E),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          elevation: 0,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

/// Shell utama: 5 tab navigasi bawah.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  /// Filter game yang diminta dari Beranda (chip game).
  final ValueNotifier<String?> _browseGameFilter = ValueNotifier(null);

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(onBrowse: _goToBrowse),
      BrowseScreen(gameFilter: _browseGameFilter),
      const SellScreen(),
      const HelpScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  void dispose() {
    _browseGameFilter.dispose();
    super.dispose();
  }

  void _goToBrowse({String? gameId}) {
    _browseGameFilter.value = gameId;
    setState(() => _index = 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1A1A1A),
        selectedItemColor: const Color(0xFFFFB300),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell_outlined),
            activeIcon: Icon(Icons.sell),
            label: 'Jual',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            activeIcon: Icon(Icons.help),
            label: 'Bantuan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
