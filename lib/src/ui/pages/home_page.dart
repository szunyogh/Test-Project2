import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/src/helpers/debouncetime.dart';
import 'package:test_project/src/models/album_model.dart';
import 'package:test_project/src/providers/response_provider.dart';
import 'package:test_project/src/providers/search_provider.dart';
import 'package:test_project/src/ui/pages/details_page.dart';
import 'package:test_project/src/ui/widgets/home/custom_selector.dart';
import 'package:test_project/src/ui/widgets/home/album_list.dart';
import 'package:test_project/src/ui/widgets/home/artist_list.dart';
import 'package:test_project/src/ui/widgets/result_item_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late TextEditingController textController;

  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    textController.addListener(() => search());
  }

  @override
  void dispose() {
    textController.removeListener(() => search());
    textController.dispose();
    super.dispose();
  }

  void search() {
    _debouncer.run(() {
      if (textController.text != "") {
        ref.read(searchProvider.state).state = textController.text;
      } else {
        ref.read(searchProvider.state).state = "A";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int selectorIndex = ref.watch(selectorProvider);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                autofocus: false,
                controller: textController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        textController.clear();
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    hintText:
                        "Search from ${selectorIndex == 0 ? 'album' : 'artist'}"),
              ),
            ),
            CustomSelector(
              selectedCount: selectorIndex,
              onSelected: (val) {
                ref.read(selectorProvider.state).state = val;
              },
              childrens: const [Text("Album"), Text("Artist")],
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 20),
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                color: Colors.white,
                elevation: 0,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  child: selectorIndex == 0
                      ? const AlbumList()
                      : const ArtistList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
