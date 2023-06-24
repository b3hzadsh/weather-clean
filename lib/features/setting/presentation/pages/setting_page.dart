import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_gradle_files/features/weather/presentation/pages/home_page/widgets/app_bar.dart';

import '../bloc/cubit/setting_cubit.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  final String buttonLable = 'Set current city with GPS';
  final String successMessage = 'City set successfully';
  final String clickButtonMessage =
      'Click on the button to Update your location ';
  updateTheLocation(BuildContext context) =>
      context.read<SettingCubit>().setNewCity();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                updateTheLocation(context);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text(buttonLable),
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
            )
          ],
        ),
      ),
    );
  }
}
