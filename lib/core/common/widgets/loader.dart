import 'package:flutter/material.dart';

/// Widget untuk menampilkan indikator loading sederhana.
class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
