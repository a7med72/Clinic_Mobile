import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void toggleTheme() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }

  void setLight() => emit(ThemeMode.light);

  void setDark() => emit(ThemeMode.dark);
}

// BlocProvider(
//   create: (_) => ThemeCubit(),
//   child: const MyApp(),
// );
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ThemeCubit, ThemeMode>(
//       builder: (context, themeMode) {
//         return MaterialApp(
//           theme: lightTheme,
//           darkTheme: darkTheme,
//           themeMode: themeMode,
//           home: const HomePage(),
//         );
//       },
//     );
//   }
// }
// context.read<ThemeCubit>().toggleTheme();