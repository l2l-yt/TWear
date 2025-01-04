import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twear/core/theme/cubit/theme_cubit.dart';
import 'package:twear/core/theme/theme.dart';
import 'package:twear/screens/home/home.dart';
import 'package:twear/screens/profile/post_product.dart';
import 'package:twear/screens/profile/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ThemeCubit())],
      child: BlocBuilder<ThemeCubit, CTheme>(
        builder: (context, themeMode) {
          return DefaultTextStyle(
            style: TextStyle(color: themeMode.primTextColor),
            child: AnimatedTheme(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              data: themeMode.getTheme(),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: const Home(),
                routes: {
                  "products": (context) => const ProfilePg(),
                  "home": (context) => const Home(),
                  "postproduct" : (context) => const PostProduct()
                },
              ),
            ),
          );
        },
      )));
}
