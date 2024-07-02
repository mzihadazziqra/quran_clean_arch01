String extractQariName(String url) {
  final regex = RegExp(r'/([^/]+)/\d+\.mp3$');
  final match = regex.firstMatch(url);
  final qariName = match?.group(1) ?? 'Unknown Qari';
  return qariName.replaceAll('-', ' '); // Ganti tanda hubung dengan spasi
}
