import 'package:flutter/material.dart';

import '../../../../core/data/database/bookmark.dart';
import '../../../../core/theme/app_color.dart';

class BookmarkCard extends StatelessWidget {
  final Bookmark bookmark;
  final int index;
  final Function()? onPressed;
  const BookmarkCard({
    super.key,
    required this.bookmark,
    required this.index,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Text(
                  textAlign: TextAlign.end,
                  bookmark.arab,
                  style: const TextStyle(
                    fontSize: 23,
                    height: 2,
                    fontFamily: 'Uthmani',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: AppColor.primary1),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.primary2,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${bookmark.namaSurah} ayat ${bookmark.number.inSurah}',
                    style: const TextStyle(
                      color: AppColor.backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
