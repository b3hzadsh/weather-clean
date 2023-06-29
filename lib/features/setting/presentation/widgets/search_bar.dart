import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_gradle_files/features/setting/data/models/city_geo_model.dart';

import '../../../../core/servises/city_service.dart';
import '../bloc/cubit/setting_cubit.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showSearch(context: context, delegate: MySearchDelegate());
        },
        icon: const Icon(Icons.search));
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = cityInfo.keys.toList();
  // List<String> searchResult =
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          }
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where(
      (searchResult) {
        final result = searchResult.toLowerCase();
        final input = query.toLowerCase();
        return result.contains(input);
      },
    ).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            context.read<SettingCubit>().setNewCityManualy(
                  CityGeoModel(
                    cityName: suggestion,
                    longitude: cityInfo[suggestion]!['longitude'] as double,
                    latitude: cityInfo[suggestion]!['latitude'] as double,
                  ), //* todo use a key static in some where instead of hard code
                );
            Navigator.of(context).pop();
            // showResults(context); // * what is this function do ?
          },
        );
      },
    );
  }
}