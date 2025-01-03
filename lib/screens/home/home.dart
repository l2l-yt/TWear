// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:twear/core/theme/theme.dart';
import 'package:twear/core/utils/get_theme_state.dart';
import 'package:twear/screens/global_widgets/navbar.dart';
import 'package:twear/screens/home/widgets/category.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final double swidth = MediaQuery.of(context).size.width;
    final double sheight = MediaQuery.of(context).size.height;
    final CTheme themeMode = getThemeMode(context);

    return Scaffold(
      backgroundColor: themeMode.backgroundColor,
      appBar: NavBar(
        themeMode: themeMode,
        scrollController: scrollController,
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            SizedBox(
              width: swidth,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: swidth <= 500
                        ? swidth < 400
                            ? swidth * 0.22
                            : swidth * 0.19
                        : sheight * 0.35,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 12,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: swidth <= 500
                              ? EdgeInsets.only(
                                  left: swidth <= 400 ? 8 : 19.0,
                                  top: 16,
                                  bottom: 16,
                                  right: swidth <= 400 ? 8 : 19.0)
                              : const EdgeInsets.only(
                                  left: 19, right: 19, top: 16, bottom: 16),
                          child: CategoryItem(
                            name: "Fashion",
                            img: "images/hero.jpg",
                            themeMode: themeMode,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Positioned saleMethod(double swidth) {
//     return Positioned(
//                   top: 130,
//                   left: swidth * 0.1, // Move container slightly to the right
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       AutoSizeText.rich(
//                         TextSpan(
//                           text: "Winter ",
//                           children: [
//                             TextSpan(
//                               text: "Sale!",
//                               style: TextStyle(
//                                 color: themeMode.secondaryTextColor,
//                                 fontFamily: "jman",
//                                 fontSize: 45,
//                               ),
//                             ),
//                           ],
//                           style: TextStyle(
//                             color: themeMode.getThemeType() is Light
//                                 ? Colors.white
//                                 : Colors.pinkAccent,
//                             fontFamily: "jman",
//                             fontSize: 45,
//                           ),
//                         ),
//                         maxLines: 1,
//                         minFontSize: 16, // Smaller minimum font size
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       const AutoSizeText(
//                         "40% Off",
//                         style: TextStyle(
//                           fontFamily: "jman",
//                           fontSize: 34,
//                           color: Colors.deepOrange,
//                         ),
//                         maxLines: 1,
//                         minFontSize: 16,
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 );
//   }
