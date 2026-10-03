import 'package:url_launcher/url_launcher.dart';
import '../models.dart';
import 'format.dart';

/// Nomor WhatsApp CS JBAG (ganti dengan nomor asli).
const String kWhatsAppNumber = '6281234567890';

/// Buka WhatsApp dengan pesan yang sudah terisi.
Future<void> openWhatsApp(String message) async {
  final uri = Uri.parse(
    'https://wa.me/$kWhatsAppNumber?text=${Uri.encodeComponent(message)}',
  );
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

/// Pesan otomatis saat pembeli tertarik pada sebuah akun.
String buyMessage(Account a) {
  return 'Halo JBAG! Saya tertarik dengan akun ini:\n\n'
      '${a.title}\n'
      'Harga: ${formatRupiah(a.price)}\n\n'
      'Apakah masih tersedia?';
}

/// Pesan otomatis untuk konsultasi jual akun.
String sellMessage() {
  return 'Halo JBAG! Saya mau jual akun game saya. '
      'Boleh info cara dan syaratnya?';
}
