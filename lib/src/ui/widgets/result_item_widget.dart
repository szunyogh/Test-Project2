import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Widget navigationPage;
  const ResultItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.navigationPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: OpenContainer<bool>(
        openBuilder: (BuildContext _, VoidCallback openContainer) {
          return navigationPage;
        },
        closedShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        closedElevation: 5,
        closedColor: Colors.grey[200]!,
        useRootNavigator: true,
        closedBuilder: (BuildContext _, VoidCallback openContainer) {
          return Container(
            height: 90,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(20),
                  ),
                  child: Image.network(
                    image,
                    errorBuilder: (context, error, stackt) {
                      return Container(
                        height: 90,
                        width: 90,
                        color: Colors.black,
                      );
                    },
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title),
                      const SizedBox(height: 10),
                      Text(subtitle),
                    ],
                  ),
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
