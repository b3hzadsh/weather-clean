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

  updateTheTemp (BuildContext context) => context.read<GetTempCubit>().adviceRequested();

  @override
  Widget build(BuildContext context) {
    // final themeData = Theme.of(context);
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advicer',
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
            // Expanded(child: Container(), flex: 3),
            Text('Tehran'),
            Expanded(flex: 1, child: Container()),
            Expanded(flex: 2, child: Placeholder()),
            Expanded(flex: 1, child: Container()),
            BlocBuilder<GetTempCubit, GetTempState>(
              builder: (context, state) {
                if (kDebugMode) {
                  print(state.runtimeType);
                }
                if (state is GetTempInitial) {
                  return Text(pushButtonForUpdat);
                } else if (state is LoadingState) {
                  return CircularProgressIndicator();
                } else if (state is ShowTempState) {
                  return Text('temp : ${state.temp}');
                } else {
                  return Text(errorMessage);
                }
              },
            ),
            Expanded(flex: 1, child: Container()),
            ElevatedButton.icon(
              onPressed:()=> updateTheTemp(context),
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
