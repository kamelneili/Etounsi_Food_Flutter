class PlaceAutocomplete {
  final String description;
  final String placeId;
  PlaceAutocomplete({required this.description, required this.placeId});
  factory PlaceAutocomplete.fromJson(Map<String, dynamic> json) {
    return PlaceAutocomplete(
        description: json['decription'], placeId: json['place_id']);
  }
}
