// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../core/servises/theme_service.dart';
import 'cubit/get_temp_cubit.dart';

const String pushButtonForUpdat =
    'To update city temprature just click on the bellow button';
const String errorMessage = 'some thing is wrong';
const String updateButtonLable = 'Uddate temp';

class HomePage extends StatelessWidget {
  /// IN this page we will show to user name of choosen city and
  /// the temprature for that city
  /// its enough for now
  ///
  const HomePage({super.key});

  updateTheTemp(BuildContext context) =>
      context.read<GetTempCubit>().adviceRequested();

  @override
  Widget build(BuildContext context) {
    // final themeData = Theme.of(context);
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: themeData.textTheme.displayLarge,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: context.read<ThemeService>().isDarkModeOn,
            onChanged: (_) {
              context.read<ThemeService>().toggleTheme();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            BlocBuilder<GetTempCubit, GetTempState>(
              builder: (context, state) {
                if (state is GetTempInitial) {
                  return Text('City is not detemine');
                } else if (state is LoadingState) {
                  return CircularProgressIndicator(
                    color: themeData.indicatorColor,
                  );
                } else if (state is ShowTempState) {
                  return Text(
                    state.cityTempEntity.cityName,
                    style: themeData.textTheme.headlineMedium,
                  );
                } else {
                  return Text(errorMessage);
                }
                //
              },
            ),
            Expanded(flex: 1, child: Container()),
            Expanded(
                flex: 2,
                child: BlocBuilder<GetTempCubit, GetTempState>(
                  builder: (context, state) {
                    if (state is ShowTempState) {
                      return Text(
                        state.cityTempEntity.weatherText,
                        style: themeData.textTheme.headlineLarge,
                      );
                    }
                    return Container();
                  },
                )),
            Expanded(flex: 1, child: Container()),
            BlocBuilder<GetTempCubit, GetTempState>(
              builder: (context, state) {
                if (state is GetTempInitial) {
                  return Text(pushButtonForUpdat);
                } else if (state is LoadingState) {
                  return CircularProgressIndicator(
                    color: themeData.indicatorColor,
                  );
                } else if (state is ShowTempState) {
                  return Text(
                    '${state.cityTempEntity.temprature} °C',
                    style: themeData.textTheme.headlineLarge,
                  );
                } else {
                  return Text(errorMessage);
                }
              },
            ),
            Expanded(flex: 1, child: Container()),
            ElevatedButton.icon(
              onPressed: () => updateTheTemp(context),
              // onPressed: () => context.read<GetTempCubit>().adviceRequested(),
              icon: Icon(Icons.update),
              label: Text(updateButtonLable),
            )
          ],
        ),
      ),
    );
  }
}
