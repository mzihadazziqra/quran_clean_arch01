import 'package:flutter/material.dart';

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
  bool _showTranslation = false;
  bool _showLatin = false;

  @override
  void initState() {
    super.initState();
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
