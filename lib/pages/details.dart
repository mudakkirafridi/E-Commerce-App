import 'package:e_commerce_app/services/database_methods.dart';
import 'package:e_commerce_app/services/shared_pref_helper.dart';
import 'package:e_commerce_app/widgets/widget_support.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String name, image, price, details;
  DetailScreen(
      {super.key,
      required this.name,
      required this.details,
      required this.image,
      required this.price});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1, total = 0;
  String? id;

  getTheSharedPref() async {
    id = await SharedPrefHelper().getUserid();
    setState(() {});
  }

  onTheLoad() async {
    await getTheSharedPref();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    onTheLoad();
    total = int.parse(widget.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new_outlined)),
            Image.network(
              widget.image,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    widget.name,
                    style: AppWidget.semiBoldTextStyle(),
                  )
                ]),
                const Spacer(),
                InkWell(
                  onTap: () {
                    if (quantity > 1) {
                      setState(() {
                        --quantity;
                        total = total - int.parse(widget.price);
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  quantity.toString(),
                  style: AppWidget.semiBoldTextStyle(),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      ++quantity;
                      total = total + int.parse(widget.price);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.details,
              maxLines: 1,
              style: AppWidget.lightTextStyle(),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  'Delivery Time',
                  style: AppWidget.semiBoldTextStyle(),
                ),
                const SizedBox(
                  width: 25,
                ),
                const Icon(
                  Icons.alarm,
                  color: Colors.black54,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '30 Min',
                  style: AppWidget.semiBoldTextStyle(),
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price ',
                        style: AppWidget.semiBoldTextStyle(),
                      ),
                      Text(
                        '\$' + total.toString(),
                        style: AppWidget.headlineTextStyle(),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      Map<String, dynamic> addFoodCart = {
                        "name": widget.name,
                        "quantity": quantity.toString(),
                        "total": total.toString(),
                        "image": widget.image
                      };
                      await MyDatabaseMethod().addFoodToCart(addFoodCart, id!);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Food Add To Cart')));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 3,
                                spreadRadius: 2)
                          ],
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            'Add To Card',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Poppins'),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
