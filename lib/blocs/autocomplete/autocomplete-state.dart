import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kamelfoodapp/models/place_autocomplete_model.dart';

abstract class AutocompleteState extends Equatable {
  const AutocompleteState();
  @override
  List<Object?> get props => [];
}

class AutocompleteLoading extends AutocompleteState {}

class AutocompleteLoaded extends AutocompleteState {
  final List<PlaceAutocomplete> autocomplete;
  const AutocompleteLoaded({required this.autocomplete});
  @override
  List<Object?> get props => [autocomplete];
}

class AutocompleteError extends AutocompleteState {}
