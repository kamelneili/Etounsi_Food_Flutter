import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamelfoodapp/blocs/filters/filters_event.dart';
import 'package:kamelfoodapp/blocs/filters/filters_state.dart';
import 'package:kamelfoodapp/models/category_filter_model.dart';
import 'package:kamelfoodapp/models/filter_model.dart';
import 'package:kamelfoodapp/models/price_filter_model.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersLoading());
  @override
  Stream<FiltersState> mapEventToState(
    FiltersEvent event,
  ) async* {
    if (event is FilterLoad) {
      yield* _mapFilterLoadToState();
    } else if (event is CategoryFilterUpdated) {
      yield* _mapCategoryFilterUpdatedToState(event, state);
    } else if (event is PriceFilterUpdated) {
      yield* _mapPriceFilterUpdatedToState(event, state);
    }
  }

  Stream<FiltersState> _mapFilterLoadToState() async* {
    yield FiltersLoaded(
        filter: Filter(
      categoryFilters: CategoryFilter.filters,
      priceFilters: PriceFilter.filters,
    ));
  }

  Stream<FiltersState> _mapCategoryFilterUpdatedToState(
    CategoryFilterUpdated event,
    FiltersState state,
  ) async* {
    if (state is FiltersLoaded) {
      final List<CategoryFilter> updatedCategoryFilters =
          state.filter.categoryFilters.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();

      yield FiltersLoaded(
          filter: Filter(
        categoryFilters: updatedCategoryFilters,
        priceFilters: state.filter.priceFilters,
      ));
    }
  }

  Stream<FiltersState> _mapPriceFilterUpdatedToState(
    PriceFilterUpdated event,
    FiltersState state,
  ) async* {
    if (state is FiltersLoaded) {
      final List<PriceFilter> updatedPriceFilters =
          state.filter.priceFilters.map((priceFilter) {
        return priceFilter.id == event.priceFilter.id
            ? event.priceFilter
            : priceFilter;
      }).toList();

      yield FiltersLoaded(
          filter: Filter(
        categoryFilters: state.filter.categoryFilters,
        priceFilters: updatedPriceFilters,
      ));
    }
  }
}
