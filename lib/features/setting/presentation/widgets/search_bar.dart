import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_gradle_files/features/setting/data/models/city_geo_model.dart';
import 'package:test_gradle_files/injection_container.dart';

import '../../../../core/servises/city_service.dart';
import '../bloc/cubit/setting_cubit.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: InkWell(
          onTap: () {
            showSearch(context: context, delegate: MySearchDelegate());
          },
          child: const Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.black87,
              ),
            ],
          ),
        ),
      ),
    );
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
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            // BlocProvider.of<SettingCubit>(context).setNewCityManualy(
           sl<SettingCubit>().setNewCityManualy(
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
