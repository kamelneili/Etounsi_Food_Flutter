import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kamelfoodapp/models/filter_model.dart';

abstract class FiltersState extends Equatable {
  const FiltersState();
  @override
  List<Object?> get props => [];
}

class FiltersLoading extends FiltersState {}

class FiltersLoaded extends FiltersState {
  final Filter filter;
  FiltersLoaded({this.filter = const Filter()});
  @override
  List<Object?> get props => [filter];
}

class FiltersError extends FiltersState {}
