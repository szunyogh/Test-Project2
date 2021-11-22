import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/src/providers/response_provider.dart';
import 'package:test_project/src/ui/pages/details_page.dart';
import 'package:test_project/src/ui/widgets/result_item_widget.dart';

class ArtistList extends ConsumerWidget {
  const ArtistList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(artistProvider).when(data: (data) {
      if (data.isEmpty) {
        return const Center(
          child: Text("Empty"),
        );
      }
      return ListView.builder(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 15),
        itemCount: data.length,
        itemBuilder: (c, i) {
          return ResultItem(
            title: data[i].name,
            subtitle: "Listeners: ${data[i].listeners}",
            image: data[i].imageSrc,
            navigationPage: DetailsPage(
              title: 'Name: ${data[i].name}',
              subtitle: 'Listeners: ${data[i].listeners}',
              url: data[i].url,
              image: data[i].largeImageSrc,
            ),
          );
        },
      );
    }, error: (error, stackTrace) {
      return Center(
        child: Text(error.toString()),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
