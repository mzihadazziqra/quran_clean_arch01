import 'package:flutter/material.dart';

// Widget untuk menampilkan pengaturan tampilan pada halaman detail surah
class DetailSurahSettings extends StatefulWidget {
  final bool showTranslation;
  final bool showLatin;
  final Function(bool) onTranslationChanged;
  final Function(bool) onLatinChanged;

  const DetailSurahSettings({
    super.key,
    required this.showTranslation,
    required this.showLatin,
    required this.onTranslationChanged,
    required this.onLatinChanged,
  });

  @override
  State<DetailSurahSettings> createState() => _DetailSurahSettingsState();
}

class _DetailSurahSettingsState extends State<DetailSurahSettings> {
  bool _showTranslation = false; // State untuk menyimpan status terjemahan
  bool _showLatin = false; // State untuk menyimpan status teks Latin

  @override
  void initState() {
    super.initState();
    // Inisialisasi nilai state berdasarkan properti widget
    _showTranslation = widget.showTranslation;
    _showLatin = widget.showLatin;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Pengaturan Tampilan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Widget untuk mengatur tampilan terjemahan
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Terjemahan'),
                Switch(
                  value: _showTranslation,
                  onChanged: (value) {
                    setState(() {
                      _showTranslation = value;
                      widget.onTranslationChanged(value);
                    });
                  },
                ),
              ],
            ),
            // Widget untuk mengatur tampilan teks Latin
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Latin'),
                Switch(
                  value: _showLatin,
                  onChanged: (value) {
                    setState(() {
                      _showLatin = value;
                      widget.onLatinChanged(value);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
