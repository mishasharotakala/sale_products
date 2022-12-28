import 'package:flutter/material.dart';
import 'package:sale_products/app_ui/activity_screen.dart';
import 'package:sale_products/app_ui/sidebar.dart';
import '../app_theme.dart';
import 'hotel_screen.dart';

class ScreensRoute extends StatelessWidget {
  const ScreensRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Travel App UI",
      theme: theme,
      initialRoute: "/activities",
      routes: {
        ActivitiesScreen.routeName: (context) => const ActivitiesScreen(),
        HotelsScreen.routeName: (context) => const HotelsScreen(),
      },
      builder: (context, child) {
        return _TravelApp(
          navigator: (child!.key as GlobalKey<NavigatorState>),
          child: child,
        );
      },
    );
  }
}

class _TravelApp extends StatefulWidget {

  final GlobalKey<NavigatorState> navigator;
  final Widget child;

  const _TravelApp({required this.navigator, required this.child});

  @override
  State<_TravelApp> createState() => __TravelAppState();
}

class __TravelAppState extends State<_TravelApp> {
  
  bool isOnboarding = true;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: isOnboarding
          ? _buildOnboarding(context)
          : Row(
              children: [
                SideBar(
                  width: width,
                  height: height,
                  navigator: widget.navigator,
                ),
                Expanded(
                  child: widget.child,
                ),
              ],
            ),
    );
  }
  
  Container _buildOnboarding(context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background-2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.45,
          bottom: MediaQuery.of(context).size.height * 0.1,
          left: 30,
          right: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hidden Treasures of Our Country",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(
                    fontSize: 55,
                    //fontFamily: "BebasNeue",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isOnboarding = false;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.zero,
                elevation: 0.0,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    "Explore Now",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
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