import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kamelfoodapp/blocs/autocomplete/autocomplete-state.dart';
import 'package:kamelfoodapp/blocs/autocomplete/autocomplete_event.dart';
import 'package:kamelfoodapp/models/place_autocomplete_model.dart';
import 'package:kamelfoodapp/repositories/places/places_repository.dart';

class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _placesSubsciption;
  AutocompleteBloc({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(AutocompleteLoading());
  @override
  Stream<AutocompleteState> mapEventToState(
    AutocompleteEvent event,
  ) async* {
    if (event is LoadAutocomplete) {
      yield* _mapLoadAutocompleteToState(event);
      print(event is LoadAutocomplete);
    }
  }

  Stream<AutocompleteState> _mapLoadAutocompleteToState(
      LoadAutocomplete event) async* {
    _placesSubsciption?.cancel();
    final List<PlaceAutocomplete> autocomplete =
        await _placesRepository.getAutocomplete(event.searchInput);
    yield AutocompleteLoaded(autocomplete: autocomplete);
  }
}
