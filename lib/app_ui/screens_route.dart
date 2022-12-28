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
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Row(
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
}