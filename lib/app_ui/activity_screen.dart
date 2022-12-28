import 'package:flutter/material.dart';
import 'package:sale_products/app_ui/sidebar.dart';

import 'widgets/custom_header.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});
  
  static const routeName = "/activities";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50,),
                    CustomHeader(title: "Activities",),
                  ],
                ),
              );
    /*return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50,),
          Text(
            "Activities",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5,),

          Text(
            "Enjoy your holidays",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );*/
  }
}

