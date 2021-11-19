import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:equatable/equatable.dart';
import 'package:kamelfoodapp/blocs/geolocation/geolocation_event.dart';
import 'package:kamelfoodapp/blocs/geolocation/geolocation_state.dart';
import 'package:kamelfoodapp/repositories/geolocation/geolocation_repository.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository _geolocationRepository;
  StreamSubscription? _geolocationSubsciption;
  GeolocationBloc({required GeolocationRepository geolocationRepository})
      : _geolocationRepository = geolocationRepository,
        super(GeolocationLoading());
  @override
  Stream<GeolocationState> mapEventToState(
    GeolocationEvent event,
  ) async* {
    if (event is LoadGeolocation) {
      print("event is one LoadGeolocation");

      yield* _mapLoadGeolocationToState();
      print("event is LoadGeolocation");
    } else if (event is UpdateGeolocation) {
      yield* _mapUpdateGeolocationToState(event);
    }
  }

  Stream<GeolocationState> _mapLoadGeolocationToState() async* {
    _geolocationSubsciption?.cancel();
    final Position position = await _geolocationRepository.getCurrentLocation();
    print(position);
    add(UpdateGeolocation(position: position));
  }

  Stream<GeolocationState> _mapUpdateGeolocationToState(
      UpdateGeolocation event) async* {
    yield GeolocationLoaded(position: event.position);
  }

  @override
  Future<void> close() {
    _geolocationSubsciption?.cancel();
    return super.close();
  }
}
