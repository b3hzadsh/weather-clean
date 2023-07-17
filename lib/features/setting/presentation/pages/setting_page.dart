import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_gradle_files/features/setting/presentation/widgets/search_bar.dart';

import '../bloc/cubit/setting_cubit.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  final String updateButtonLable = 'Set current city with GPS';
  final String successMessage = 'City set successfully';
  final String clickButtonMessage =
      'Click on the button to Update your location ';
  final MySearchBar _searchBar = const MySearchBar();
  updateTheLocation(BuildContext context) =>
      context.read<SettingCubit>().setNewCityByGPS();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          // appBar: MyAppBar(title: 'Setting', actions: []),
          appBar: AppBar(
            title: const Text('Setting'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'set location with GPS',
                  icon: Icon(Icons.location_on),
                ),
                Tab(
                  text: 'set location with city name',
                  icon: Icon(Icons.location_city),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Column(
                // the part of set loc with the gps
                children: [
                  const SizedBox(height: 80),
                  ElevatedButton(
                    onPressed: () {
                      updateTheLocation(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 15,
                      ),
                      child: Text(updateButtonLable),
                    ),
                  ),
                  BlocBuilder<SettingCubit, SettingState>(
                    builder: (context, state) {
                      if (state is SettingStateSuccess) {
                        return Text(successMessage);
                      } else if (state is SettingInitial) {
                        return Text(clickButtonMessage);
                      } else if (state is SettingStateFailed) {
                        return Text(state.errorMessage);
                      }
                      return Container();
                    },
                  ),
                ],
              ),
              Column(
                // part for set loc with name of city
                children: <Widget>[
                  const SizedBox(height: 80),
                  _searchBar,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
