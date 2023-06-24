// ignore_for_file: prefer_const_constructors

import 'cubit/get_temp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const String pushButtonForUpdate =
    'To update city temprature just click on the bellow button';
const String errorMessage = 'some thing is wrong';
const String updateButtonLable = 'Uddate temp';
const String settingButtonLable = 'Setting';

class HomePage extends StatelessWidget {
  /// IN this page we will show to user, name of choosen city
  /// the temprature for that city
  /// its enough for now !!lol
  ///
  const HomePage({super.key});

  updateTheTemp(BuildContext context) =>
      context.read<GetTempCubit>().updateWeather();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      // appBar: MyAppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () => Navigator.of(context).pushNamed('/screens/setting') ,
                icon: Icon(
                  Icons.settings,
                  color: themeData.primaryIconTheme.color,
                ),
                label: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    settingButtonLable,
                    style: themeData.textTheme.headlineMedium,
                  ),
                ),
              ),
              Expanded(flex: 1, child: SizedBox()),
              BlocBuilder<GetTempCubit, GetTempState>(
                builder: (context, state) {
                  if (state is GetTempInitial) {
                    return Text(
                      'City is not detemine.',
                      style: themeData.textTheme.bodySmall,
                    );
                  } else if (state is LoadingState) {
                    return CircularProgressIndicator(
                      color: themeData.indicatorColor,
                    );
                  } else if (state is ShowTempState) {
                    return Text(
                      state.cityTempEntity.cityName,
                      style: themeData.textTheme.bodyMedium,
                    );
                  }
                  return Text(
                    errorMessage,
                    style: themeData.textTheme.displayLarge,
                  );
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
                        style: themeData.textTheme.bodySmall,
                      );
                    }
                    return Container();
                  },
                ),
              ),
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 12,
                child: BlocBuilder<GetTempCubit, GetTempState>(
                  builder: (context, state) {
                    if (state is GetTempInitial) {
                      return Text(
                        pushButtonForUpdate,
                        style: themeData.textTheme.displayLarge,
                      );
                    } else if (state is LoadingState) {
                      return CircularProgressIndicator(
                        color: themeData.indicatorColor,
                      );
                    } else if (state is ShowTempState) {
                      return OrientationBuilder(
                        builder: (context, orientation) {
                          if (orientation == Orientation.landscape) {
                            final width = MediaQuery.of(context).size.width;
                            return Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                Positioned.fill(
                                  child: SvgPicture.asset(
                                    'assets/images/weather_types/09d.svg',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Positioned(
                                  top: width * 0.05 * -1,
                                  child: Text(
                                    '${state.cityTempEntity.temprature} °C',
                                    // '35 °C',
                                    style:
                                        themeData.textTheme.bodyLarge!.copyWith(
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(10.0, 10.0),
                                          blurRadius: 3.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                        Shadow(
                                          offset: Offset(10.0, 10.0),
                                          blurRadius: 8.0,
                                          color: Color.fromARGB(128, 0, 0, 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Text('Landscape');
                          }
                        },
                      );
                    } else {
                      return Text(
                        errorMessage,
                        style: themeData.textTheme.bodyMedium,
                      );
                    }
                  },
                ),
              ),
              Expanded(flex: 1, child: SizedBox()),
              ElevatedButton.icon(
                onPressed: () => updateTheTemp(context),
                icon: Icon(
                  Icons.update,
                  color: themeData.primaryIconTheme.color,
                ),
                label: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    updateButtonLable,
                    style: themeData.textTheme.headlineMedium,
                  ),
                ),
              ),
              Expanded(flex: 1, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
