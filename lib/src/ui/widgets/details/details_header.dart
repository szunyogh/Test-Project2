import 'package:flutter/material.dart';

class DetailsHeader extends StatelessWidget {
  final String imageSrc;
  const DetailsHeader({Key? key, required this.imageSrc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: double.maxFinite,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
        image:
            DecorationImage(image: NetworkImage(imageSrc), fit: BoxFit.cover),
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(30),
          color: Colors.white.withOpacity(0.4),
        ),
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }
}
