import 'package:e_commerce_app/services/shared_pref_helper.dart';
import 'package:e_commerce_app/widgets/widget_support.dart';
import 'package:flutter/material.dart';

class WalletSreen extends StatefulWidget {
  const WalletSreen({super.key});

  @override
  State<WalletSreen> createState() => _WalletSreenState();
}

class _WalletSreenState extends State<WalletSreen> {
  String? wallet, id;
  int? add;
  TextEditingController amountController = TextEditingController();
  getTheSharedPref() async {
    wallet = await SharedPrefHelper().getUserWallet();
    id = await SharedPrefHelper().getUserid();
    setState(() {});
  }

  onTheLoad() async {
    await getTheSharedPref();
    setState(() {});
  }

  @override
  void initState() {
    onTheLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Wallet',
                  style: AppWidget.headlineTextStyle(),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 30,
              ),
              Material(
                elevation: 4,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(color: Color(0xfff2f2f2)),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/wallet.png',
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Wallet ',
                            style: AppWidget.lightTextStyle(),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '\$100',
                            style: AppWidget.semiBoldTextStyle(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Add Money',
                  style: AppWidget.semiBoldTextStyle(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: const Color(0xffe9e2e2)),
                    ),
                    child: Text(
                      '\$100',
                      style: AppWidget.semiBoldTextStyle(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: const Color(0xffe9e2e2)),
                    ),
                    child: Text(
                      '\$500',
                      style: AppWidget.semiBoldTextStyle(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: const Color(0xffe9e2e2)),
                    ),
                    child: Text(
                      '\$1000',
                      style: AppWidget.semiBoldTextStyle(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: const Color(0xffe9e2e2)),
                    ),
                    child: Text(
                      '\$2000',
                      style: AppWidget.semiBoldTextStyle(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                  child: Text('Add Money',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold)),
                ),
              )
            ],
          )),
    );
  }
}
