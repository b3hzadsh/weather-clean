import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/servises/theme_service.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  const MyAppBar({super.key, required this.title, required this.actions});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return AppBar(
      title: Text(
        title,
        style: themeData.textTheme.displayLarge,
      ),
      centerTitle: true,
      actions: [
        Switch(
          value: context.read<ThemeService>().isDarkModeOn,
          onChanged: (_) {
            context.read<ThemeService>().toggleTheme();
          },
        ),
        ...actions
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
