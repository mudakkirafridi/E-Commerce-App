import 'package:e_commerce_app/widgets/widget_support.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool iceCream = false, pizza = false, salad = false, burger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hello Mudakir,', style: AppWidget.boldTextFieldStyle()),
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Delicious Food', style: AppWidget.headlineTextStyle()),
            Text('Discover and Get Great Food',
                style: AppWidget.lightTextStyle()),
            const SizedBox(
              height: 20,
            ),
            showCategoryItem(),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget showCategoryItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            iceCream = true;
            pizza = false;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: iceCream ? Colors.black : Colors.white),
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'images/ice-cream.png',
                  height: 35,
                  width: 35,
                  fit: BoxFit.cover,
                  color: iceCream ? Colors.white : Colors.black,
                )),
          ),
        ),
        InkWell(
          onTap: () {
            iceCream = false;
            pizza = true;
            salad = false;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: pizza ? Colors.black : Colors.white),
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'images/pizza.png',
                  height: 35,
                  width: 35,
                  fit: BoxFit.cover,
                  color: pizza ? Colors.white : Colors.black,
                )),
          ),
        ),
        InkWell(
          onTap: () {
            iceCream = false;
            pizza = false;
            salad = true;
            burger = false;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: salad ? Colors.black : Colors.white),
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'images/salad.png',
                  height: 35,
                  width: 35,
                  fit: BoxFit.cover,
                  color: salad ? Colors.white : Colors.black,
                )),
          ),
        ),
        InkWell(
          onTap: () {
            iceCream = false;
            pizza = false;
            salad = false;
            burger = true;
            setState(() {});
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: burger ? Colors.black : Colors.white),
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'images/burger.png',
                  height: 35,
                  width: 35,
                  fit: BoxFit.cover,
                  color: burger ? Colors.white : Colors.black,
                )),
          ),
        ),
      ],
    );
  }
}
