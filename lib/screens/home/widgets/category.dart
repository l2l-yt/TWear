import 'package:flutter/material.dart';
import 'package:twear/core/theme/theme.dart';
import 'package:twear/core/utils/screen_size.dart';
import 'package:twear/screens/global_widgets/glowing_container.dart';

class CategoryItem extends StatelessWidget {
  final CTheme themeMode;
  final String img;
  final String name;
  const CategoryItem(
      {super.key,
      required this.themeMode,
      required this.img,
      required this.name});

  @override
  Widget build(BuildContext context) {
    final width = getScreenSize(context).first;
    final height = getScreenSize(context).elementAt(1);
    return width <= 500
        ? FittedBox(
            child: glowingContainer(
              height: 60,
              fillColor: themeMode.backgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(
                  child: Text(
                    name,
                    style:
                        TextStyle(color: themeMode.primTextColor, fontSize: 18),
                  ),
                ),
              ),
              themeMode: themeMode,
            ),
          )
        : glowingContainer(
            fillColor: themeMode.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: height * .09,
                      foregroundImage: AssetImage(img),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      name,
                      style: TextStyle(color: themeMode.primTextColor),
                    ),
                  ],
                ),
              ),
            ),
            themeMode: themeMode,
          );
  }
}
