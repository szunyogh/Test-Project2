import 'dart:convert';

ArtistModel artistModelFromJson(String str) =>
    ArtistModel.fromJson(json.decode(str));

class ArtistModel {
  final String name;
  final int id;
  final String url;
  final String listeners;
  final String imageSrc;
  final String largeImageSrc;

  ArtistModel({
    this.id = 0,
    this.name = 'Name',
    this.imageSrc = 'Image',
    this.url = 'Url',
    this.listeners = '-',
    this.largeImageSrc = 'Image',
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
        name: json['name'],
        id: int.parse(json['mbid'], onError: (s) {
          return 0;
        }),
        url: json['url'],
        listeners: json['listeners'],
        imageSrc: json['image'][2]['#text'],
        largeImageSrc: json['image'][3]['#text'],
      );
}
