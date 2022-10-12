import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';


class Suggestion {
  final String placeId;
  final String description;

  Suggestion(this.placeId, this.description);

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}

class PlaceApiProvider {
  PlaceApiProvider(this.sessionToken);

  final sessionToken;

  static final String androidKey = 'AIzaSyByB-sLJm3J1iooY_wnXPwAUY9YNUlRftI';
  static final String iosKey = 'AIzaSyAECwAd-w7IhsuL5nJfl7fI5z5OFRKYk7c';
  final apiKey = Platform.isAndroid ? androidKey : iosKey;

  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=%28cities%29&language=$lang&key=$apiKey&sessiontoken=$sessionToken';
    final response = await Dio().get(request);

    if (response.statusCode == 200) {
      final result = response.data;
      if (result['status'] == 'OK') {
        return result['predictions']
            .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}