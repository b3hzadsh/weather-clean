// ignore_for_file: prefer_const_constructors

import '../../../../../core/servises/internet_service.dart';
import '../../../../../injection_container.dart';
import 'cubit/get_temp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/app_bar.dart';

const String pushButtonForUpdate =
    'To update city temperature just click on the bellow button';
const String errorMessage = 'some thing is wrong';
const String updateButtonLable = 'Tap To Update temperature';
const String settingButtonLable = 'Setting';

class HomePageWrapperProvider extends StatelessWidget {
  const HomePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetTempCubit>(
      create: (context) => sl<GetTempCubit>(),
      child: HomePage(),
    );
  }
}

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
      appBar: MyAppBar(
        title: 'Main Page',
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed('/screens/setting'),
            icon: Icon(
              Icons.settings,
              color: themeData.primaryIconTheme.color,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(flex: 1, child: SizedBox()),
              Center(
                child: BlocBuilder<GetTempCubit, GetTempState>(
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
                    } else if (state is MainCityState) {
                      return Text(
                        state.cityName,
                        style: themeData.textTheme.bodySmall,
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
              ),
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 2,
                child: Center(
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
              ),
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 12,
                child: Center(
                  child: BlocBuilder<GetTempCubit, GetTempState>(
                    builder: (context, state) {
                      if (state is GetTempInitial) {
                        return Text(
                          pushButtonForUpdate,
                          style: themeData.textTheme.displayLarge,
                          textAlign: TextAlign.center,
                        );
                      } else if (state is LoadingState) {
                        return CircularProgressIndicator(
                          color: themeData.indicatorColor,
                        );
                      } else if (state is ShowTempState) {
                        return OrientationBuilder(
                          builder: (context, orientation) {
                            final width = orientation == Orientation.landscape
                                ? MediaQuery.of(context).size.width
                                : MediaQuery.of(context).size.height;
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  Positioned.fill(
                                      child: state.cityTempEntity.imagePath !=
                                              null
                                          ? SvgPicture.asset(
                                              state.cityTempEntity.imagePath!,
                                              fit: orientation ==
                                                      Orientation.landscape
                                                  ? BoxFit.fitHeight
                                                  : BoxFit.fitWidth,
                                            )
                                          : SizedBox()),
                                  Positioned(
                                    top: width * 0.05 * -1,
                                    child: Text(
                                      '${state.cityTempEntity.temprature} °C',
                                      style: themeData.textTheme.bodyLarge!
                                          .copyWith(
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(3.0, 3.0),
                                            blurRadius: 0.2,
                                            color: themeData
                                                .textTheme.displaySmall!.color!
                                                .withOpacity(0.75),
                                            // color: Color.fromARGB(150, 0, 0, 0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
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
              ),
              Expanded(flex: 1, child: SizedBox()),
              InkWell(
                onTap: () => updateTheTemp(context),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: themeData.colorScheme.secondary,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  child: TextButton(
                    onPressed: () => updateTheTemp(context),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          updateButtonLable,
                          style: themeData.textTheme.headlineMedium!.copyWith(
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
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
