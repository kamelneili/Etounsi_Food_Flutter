import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamelfoodapp/blocs/filters/filters_bloc.dart';
import 'package:kamelfoodapp/blocs/filters/filters_event.dart';
import 'package:kamelfoodapp/blocs/filters/filters_state.dart';
import 'package:kamelfoodapp/models/category_filter_model.dart';
import 'package:kamelfoodapp/models/category_model.dart';

class CustomCategoryFilter extends StatelessWidget {
  final List<Category> categories;
  const CustomCategoryFilter({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(builder: (context, state) {
      if (state is FiltersLoading)
        return Center(child: CircularProgressIndicator());
      else if (state is FiltersLoaded) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.filter.categoryFilters.length,
            itemBuilder: (context, index) {
              return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.filter.categoryFilters[index].category.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                            height: 25,
                            child: Checkbox(
                              value: state.filter.categoryFilters[index].value,
                              onChanged: (bool? newValue) {
                                context.read<FiltersBloc>().add(
                                    CategoryFilterUpdated(
                                        categoryFilter: state
                                            .filter.categoryFilters[index]
                                            .copyWith(
                                                value: !state
                                                    .filter
                                                    .categoryFilters[index]
                                                    .value)));
                              },
                            ))
                      ]));
            });
      } else
        return Text("something went wrong");
    });
  }
}
