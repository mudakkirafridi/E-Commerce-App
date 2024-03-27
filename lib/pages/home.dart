import 'package:e_commerce_app/pages/details.dart';
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 50,
            left: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hello Mudakir,', style: AppWidget.boldTextFieldStyle()),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
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
              Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: showCategoryItem()),
              const SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DetailScreen()));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'images/ice-cream.png',
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'Vaggie Tech Hash',
                                  style: AppWidget.semiBoldTextStyle(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Fresh and Healthy',
                                  style: AppWidget.lightTextStyle(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '\$25',
                                  style: AppWidget.semiBoldTextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    //=========================================
                    Container(
                      margin: const EdgeInsets.all(4),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'images/burger.png',
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                'Mix Veg Salad',
                                style: AppWidget.semiBoldTextStyle(),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Spicy With Onion',
                                style: AppWidget.lightTextStyle(),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '\$28',
                                style: AppWidget.semiBoldTextStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'images/salad.png',
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                'Mediterramean Chicpea Salad',
                                style: AppWidget.semiBoldTextStyle(),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                'Honey Goa Cheese',
                                style: AppWidget.lightTextStyle(),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                '\$28',
                                style: AppWidget.semiBoldTextStyle(),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
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

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
