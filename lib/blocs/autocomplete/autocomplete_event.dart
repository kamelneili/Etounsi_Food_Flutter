import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

abstract class AutocompleteEvent extends Equatable {
  const AutocompleteEvent();
  @override
  List<Object?> get props => [];
}

class LoadAutocomplete extends AutocompleteEvent {
  final String searchInput;
  LoadAutocomplete({this.searchInput = ''});
  @override
  List<Object?> get props => [searchInput];
}
