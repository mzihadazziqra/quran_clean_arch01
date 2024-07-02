import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/loader.dart';
import '../bloc/bookmark_bloc.dart';
import '../widgets/bookmark_card.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  void initState() {
    super.initState();
    context.read<BookmarkBloc>().add(LoadBookmarks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookmarkBloc, BookmarkState>(
        builder: (context, state) {
          if (state is BookmarkLoading) {
            return const Loader();
          } else if (state is BookmarksLoaded) {
            return ListView.builder(
              itemCount: state.bookmarks.length,
              itemBuilder: (context, index) {
                final bookmark = state.bookmarks[index];
                final indexAyat = bookmark.number.inSurah! - 1;
                return BookmarkCard(
                  bookmark: bookmark,
                  index: index,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/detail_surah',
                      arguments: {
                        'nomorSurah': bookmark.nomorSurah,
                        'indexAyat': indexAyat,
                      },
                    );
                  },
                );
              },
            );
          } else if (state is BookmarkError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
