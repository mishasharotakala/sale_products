import 'package:flutter/material.dart';
import 'package:sale_products/app_ui/widgets/custom_header.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  static const routeName = "/hotels";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          CustomHeader(title: "Hotels"),
        ],
      ),
    );
  }
}