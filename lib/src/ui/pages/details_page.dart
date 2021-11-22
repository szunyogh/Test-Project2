import 'package:flutter/material.dart';
import 'package:test_project/src/models/album_model.dart';
import 'package:test_project/src/ui/widgets/details/details_body.dart';
import 'package:test_project/src/ui/widgets/details/details_header.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String url;
  final String image;
  const DetailsPage(
      {Key? key,
      this.title = "Title",
      this.subtitle = "Subtitle",
      this.url = "URL",
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsHeader(imageSrc: image),
            DetailsBody(
              title: title,
              subtitle: subtitle,
              url: url,
            ),
          ],
        ),
      ),
    );
  }
}
