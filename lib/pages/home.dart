import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/pages/details.dart';
import 'package:e_commerce_app/services/database_methods.dart';
import 'package:e_commerce_app/widgets/widget_support.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool iceCream = false, pizza = false, salad = false, burger = false;
  Stream? foodItemStream;
  onTheLoad() async {
    foodItemStream = await MyDatabaseMethod().getFoodItem("Burger");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    onTheLoad();
  }

  Widget allItemsVertical() {
    return StreamBuilder(
        stream: foodItemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      details: ds['details'],
                                      image: ds['image'],
                                      price: ds['price'],
                                      name: ds['name'],
                                    )));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10, bottom: 20),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds['image'],
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        ds['name'],
                                        style: AppWidget.semiBoldTextStyle(),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        ds['details'],
                                        maxLines: 1,
                                        style: AppWidget.lightTextStyle(),
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        ds['price'],
                                        style: AppWidget.semiBoldTextStyle(),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : const CircularProgressIndicator();
        });
  }

  Widget allItems() {
    return StreamBuilder(
        stream: foodItemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      details: ds['details'],
                                      image: ds['image'],
                                      price: ds['price'],
                                      name: ds['name'],
                                    )));
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
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds['image'],
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  ds['name'],
                                  style: AppWidget.semiBoldTextStyle(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  ds['details'],
                                  maxLines: 1,
                                  style: AppWidget.lightTextStyle(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  ds['price'],
                                  style: AppWidget.semiBoldTextStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : const CircularProgressIndicator();
        });
  }

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
              Container(
                height: 270,
                child: allItems(),
              ),
              const SizedBox(
                height: 30,
              ),
              allItemsVertical()
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
          onTap: () async {
            iceCream = true;
            pizza = false;
            salad = false;
            burger = false;
            foodItemStream = await MyDatabaseMethod().getFoodItem('Ice-Cream');
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
          onTap: () async {
            iceCream = false;
            pizza = true;
            salad = false;
            burger = false;
            foodItemStream = await MyDatabaseMethod().getFoodItem('Pizza');
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
          onTap: () async {
            iceCream = false;
            pizza = false;
            salad = true;
            burger = false;
            foodItemStream = await MyDatabaseMethod().getFoodItem('Salad');
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
          onTap: () async {
            iceCream = false;
            pizza = false;
            salad = false;
            burger = true;
            foodItemStream = await MyDatabaseMethod().getFoodItem('Burger');
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
