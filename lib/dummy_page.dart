import 'dart:ui';

import 'package:flutter/material.dart';

class DummyPage extends StatefulWidget {
  const DummyPage({super.key});

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  // 1
  final String category = "Your Choice";
  final String title = "The Beauty of Art";
  final String description = "The perfect body";
  final String owner = "Anonymous";

  List<String> data = [
    "https://firebasestorage.googleapis.com/v0/b/sale-products-b1eab.appspot.com/o/Capture.PNG?alt=media&token=62e48917-121b-471f-badd-308a43955e2b",
    "https://firebasestorage.googleapis.com/v0/b/sale-products-b1eab.appspot.com/o/image.png?alt=media&token=77dd8a73-283f-4998-b557-ec42dd09683b",
    "https://firebasestorage.googleapis.com/v0/b/sale-products-b1eab.appspot.com/o/image%20(2).png?alt=media&token=7fee67f6-13ef-4f1b-9152-9bed63f5d0e8",
    "https://firebasestorage.googleapis.com/v0/b/sale-products-b1eab.appspot.com/o/image%20(1).png?alt=media&token=e5b7196d-1388-4312-b253-c47af39a71b8",
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // The backgroumd Image
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Container(
            key: ValueKey<String>(data[_currentPage]),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(data[_currentPage]),
                  fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15,
                sigmaY: 15,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
        ),


        FractionallySizedBox(
          heightFactor: 0.55,
          child: PageView.builder(
            itemCount: data.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return FractionallySizedBox(
                widthFactor: 0.8,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(data[index]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 105,
                        child: Text(
                          category,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "BeautifulPeoplePersonalUse",
                            color: Colors.white,
                          ),
                            //AppTheme.darkTextTheme.bodyText1,
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Text(
                          title,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Countryside",
                            color: Colors.white,
                          ),
                          //style: AppTheme.darkTextTheme.headline4,
                        ),
                      ),

                      Positioned(
                        bottom: 50,
                        right: 0,
                        child: Text(
                          description,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Countryside",
                            color: Colors.white,
                          ),
                          //style: AppTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Positioned(
                        bottom: 5,
                        right: 0,
                        child: Text(
                          owner,
                          style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 45,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Signamaestro",
                            color: Colors.white,
                          ),
                          //style: AppTheme.darkTextTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}