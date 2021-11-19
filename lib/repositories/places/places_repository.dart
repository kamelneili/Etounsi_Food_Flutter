import 'dart:convert';

import 'package:kamelfoodapp/models/place_autocomplete_model.dart';
import 'package:kamelfoodapp/repositories/places/base_places_repository.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesRepository extends BasePlacesRepository {
  final String key = 'AIzaSyBBb-rdYAQCzJKSGP1lHkkdoKwnBUTSDPY';
  final String types = 'geocode';
  Future<List<PlaceAutocomplete>> getAutocomplete(String searchInput) async {
    print(searchInput);
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    var json = convert.jsonDecode(response.body);
    print(json);
    var results = json['predictions'] as List;
    print(results);
    return results.map((place) => PlaceAutocomplete.fromJson(place)).toList();
  }
}
