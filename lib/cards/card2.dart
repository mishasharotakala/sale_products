import 'dart:ui';
import 'package:flutter/material.dart';

class Card2 extends StatefulWidget {
  const Card2({super.key});

  @override
  State<Card2> createState() => _Card2State();
}

class _Card2State extends State<Card2> {

  List<String> data = [
    "https://firebasestorage.googleapis.com/v0/b/sale-products-b1eab.appspot.com/o/lmn.jpg?alt=media&token=16cb4424-6bd8-4fa4-a97e-9895e635f90e",
    "https://firebasestorage.googleapis.com/v0/b/sale-products-b1eab.appspot.com/o/hij.PNG?alt=media&token=cba82d44-8f38-4e20-af9c-245d9094dbc0",
    "https://firebasestorage.googleapis.com/v0/b/sale-products-b1eab.appspot.com/o/fgh.PNG?alt=media&token=6eb603c4-afaa-4c63-a454-f891c959343d",
    "https://firebasestorage.googleapis.com/v0/b/sale-products-b1eab.appspot.com/o/cde.jpg?alt=media&token=5c47b720-3937-47b3-92ca-4d90d320724d",
    "https://firebasestorage.googleapis.com/v0/b/sale-products-b1eab.appspot.com/o/ABC.jpg?alt=media&token=e2bc7e5d-5835-4b93-a127-4c78fa24bc38",
    "https://cdn.dribbble.com/userupload/2585383/file/original-ecbe1ce28078736c2476d128976d2daf.png?compress=1&resize=800x600&vertical=top",
    "https://cdn.dribbble.com/userupload/2972227/file/original-4933a31bf0ea9ed8591c97269a7d7d76.png?compress=1&resize=800x600&vertical=top",
    "https://cdn.dribbble.com/users/2142686/screenshots/14141429/image.png?compress=1&resize=800x600&vertical=top",
  ];

  //int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // The backgroumd Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(data[7]),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15,
                sigmaY: 15,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          const SizedBox(height: 25,),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(height: 8,),
                Text(
                  "What's in store?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "BeautifulPeoplePersonalUse",
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5,),
              ],
            ),
          ),
          FractionallySizedBox(
            heightFactor: 0.55,
            child: ListView(
              children: const [
                ListTile(
                  trailing: Text("R700"),
                  title: Text(
                    "Hip & Bum Combo",
                    style: TextStyle(
                      fontFamily: "BebasNeue",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("Oil, Pills and Shake"),
                ),
                ListTile(
                  trailing: Text("R100"),
                  title: Text(
                    "Hip & Bum Oil",
                    style: TextStyle(
                      fontFamily: "BebasNeue",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("Just Oil"),
                ),
                ListTile(
                  trailing: Text("R170"),
                  title: Text(
                    "Hip & Bum Enlargement Pills",
                    style: TextStyle(
                      fontFamily: "BebasNeue",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("60 Capsules"),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}