import 'dart:convert';

AlbumModel albumModelFromJson(String str) =>
    AlbumModel.fromJson(json.decode(str));

class AlbumModel {
  final String name;
  final String artist;
  final int id;
  final String url;
  final String imageSrc;
  final String largeImageSrc;

  AlbumModel({
    this.id = 0,
    this.name = 'Name',
    this.artist = 'Artist',
    this.imageSrc = 'Image',
    this.url = 'Url',
    this.largeImageSrc = 'Image',
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
        name: json['name'],
        artist: json['artist'],
        id: int.parse(json['mbid'], onError: (s) {
          return 0;
        }),
        url: json['url'],
        imageSrc: json['image'][2]['#text'],
        largeImageSrc: json['image'][3]['#text'],
      );
}
