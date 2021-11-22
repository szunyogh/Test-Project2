import 'dart:convert';
import 'package:riverpod/riverpod.dart';
import 'package:test_project/src/helpers/exception_helper.dart';
import 'package:test_project/src/models/album_model.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/src/models/artist_model.dart';
import 'package:test_project/src/providers/search_provider.dart';

final albumProvider = FutureProvider<List<dynamic>>((ref) async {
  String album = ref.watch(searchProvider);
  List<AlbumModel> result = [];
  String apiKey = "e804a6279bb4791a1c3e4b582e7352c5";
  result.clear();
  final url = Uri.parse(
      'http://ws.audioscrobbler.com/2.0/?method=album.search&album=believe&api_key=$apiKey&format=json');
  final response =
      await http.post(url, body: {"limit": "", "page": "", "album": album});
  if (response.statusCode != 200) {
    throw ExceptionHelper.convertCodeToException(
        jsonDecode(response.body)['message']);
  }

  List<dynamic> reponseResult =
      jsonDecode(response.body)["results"]["albummatches"]["album"];
  for (var element in reponseResult) {
    result.add(AlbumModel.fromJson(element));
  }
  return result;
});

final artistProvider = FutureProvider<List<ArtistModel>>((ref) async {
  String artist = ref.watch(searchProvider);
  List<ArtistModel> result = [];
  String apiKey = "e804a6279bb4791a1c3e4b582e7352c5";
  result.clear();
  final url = Uri.parse(
      'http://ws.audioscrobbler.com/2.0/?method=artist.search&artist=cher&api_key=$apiKey&format=json');

  final response =
      await http.post(url, body: {"limit": "", "page": "", "artist": artist});
  if (response.statusCode != 200) {
    throw ExceptionHelper.convertCodeToException(
        jsonDecode(response.body)['message']);
  }

  List<dynamic> reponseResult =
      jsonDecode(response.body)["results"]["artistmatches"]["artist"];
  for (var element in reponseResult) {
    result.add(ArtistModel.fromJson(element));
  }
  return result;
});
