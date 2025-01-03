import 'package:flutter/material.dart';
import 'package:twear/core/theme/theme.dart';

class ImagesButton extends StatelessWidget {
  final VoidCallback onpress;
  final CTheme themeMode;
  const ImagesButton({super.key, required this.onpress, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        decoration: BoxDecoration(
          color: themeMode.backgroundColor,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: themeMode.borderColor ?? Colors.red,
            width: 1,
          ),
        ),
        width: 80,
        height: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 28,
              color: themeMode.iconColor,
            ),
            SizedBox(
              height: 14,
            ),
            Icon(
              Icons.add_photo_alternate,
              size: 34,
              color: themeMode.iconColor,
            )
          ],
        ),
      ),
    );
  }
}
