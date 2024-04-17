import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/services/database_methods.dart';
import 'package:e_commerce_app/services/shared_pref_helper.dart';
import 'package:e_commerce_app/widgets/widget_support.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String? id, wallet;
  int total = 0, amount2 = 0;

  void startTimer() {
    Timer(const Duration(seconds: 2), () {
      amount2 = total;
      setState(() {});
    });
  }

  getTheSharedPref() async {
    id = await SharedPrefHelper().getUserid();
    wallet = await SharedPrefHelper().getUserWallet();
    setState(() {});
  }

  onTheLoad() async {
    await getTheSharedPref();
    foodStram = await MyDatabaseMethod().getFoodCart(id ?? '1');
    setState(() {});
  }

  @override
  void initState() {
    onTheLoad();
    startTimer();
    super.initState();
  }

  Stream? foodStram;

  Widget foodCart() {
    return StreamBuilder(
        stream: foodStram,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    total = total + int.parse(ds['total']);
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 10),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                height: 90,
                                width: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(ds['quantity']),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.network(
                                    ds['image'],
                                    height: 90,
                                    width: 90,
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    ds['name'],
                                    style: AppWidget.semiBoldTextStyle(),
                                  ),
                                  Text(
                                    '${ds['total']}',
                                    style: AppWidget.semiBoldTextStyle(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : const Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Food Cart',
                style: AppWidget.headlineTextStyle(),
              ),
            ),
            const Divider(
              thickness: 2,
            ),

            // Container(
            //   decoration:
            //       BoxDecoration(borderRadius: BorderRadius.circular(10)),
            //   margin: const EdgeInsets.only(right: 20, left: 20),
            //   child: Material(
            //     elevation: 5,
            //     borderRadius: BorderRadius.circular(10),
            //     child: Container(
            //       padding: const EdgeInsets.all(10),
            //       child: Row(
            //         children: [
            //           Container(
            //             height: 90,
            //             width: 40,
            //             decoration: BoxDecoration(
            //                 border: Border.all(),
            //                 borderRadius: BorderRadius.circular(10)),
            //             child: const Center(
            //               child: Text('2'),
            //             ),
            //           ),
            //           const SizedBox(
            //             width: 20,
            //           ),
            //           ClipRRect(
            //               borderRadius: BorderRadius.circular(60),
            //               child: Image.asset(
            //                 'images/food.png',
            //                 height: 90,
            //                 width: 90,
            //                 fit: BoxFit.cover,
            //               )),
            //           const SizedBox(
            //             width: 20,
            //           ),
            //           Column(
            //             children: [
            //               Text(
            //                 'Pizza',
            //                 style: AppWidget.semiBoldTextStyle(),
            //               ),
            //               Text(
            //                 '\$30',
            //                 style: AppWidget.semiBoldTextStyle(),
            //               ),
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Container(
                height: MediaQuery.of(context).size.height / 2.2,
                child: foodCart()),
            const Spacer(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Price',
                    style: AppWidget.headlineTextStyle(),
                  ),
                  Text(
                    '\$' + total.toString(),
                    style: AppWidget.semiBoldTextStyle(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                int amount = int.parse(wallet!) - amount2!;
                await MyDatabaseMethod()
                    .updateUserWaller(id!, amount.toString());
                await SharedPrefHelper().saveUserWallet(amount.toString());
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
