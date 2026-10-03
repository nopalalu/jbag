/// Format angka menjadi "Rp 1.500.000".
String formatRupiah(int amount) {
  if (amount < 0) return '-${formatRupiah(-amount)}';
  final digits = amount.toString();
  final buf = StringBuffer();
  for (var i = 0; i < digits.length; i++) {
    final rev = digits.length - 1 - i;
    buf.write(digits[i]);
    if (rev % 3 == 0 && i != digits.length - 1) {
      buf.write('.');
    }
  }
  return 'Rp ${buf.toString()}';
}
