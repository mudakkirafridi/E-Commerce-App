import 'package:e_commerce_app/widgets/widget_support.dart';
import 'package:flutter/material.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffededeb),
      body: Container(
        child: Stack(
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
              padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(
                        MediaQuery.of(context).size.width, 110),
                  ),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 53, 53, 53),
                        Colors.black,
                      ])),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60, right: 30, left: 30),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "Let's Start With \n Admin",
                        textAlign: TextAlign.center,
                        style: AppWidget.semiBoldTextStyle(),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Material(
                        elevation: 100,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 20),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(),
                                child: Center(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Enter Username",
                                        hintStyle: AppWidget.lightTextStyle(),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        border: InputBorder.none),
                                    controller: usernameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Fill Username";
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 20),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(),
                                child: Center(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Enter Password",
                                        hintStyle: AppWidget.lightTextStyle(),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black)),
                                        border: InputBorder.none),
                                    controller: passwordController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Fill Password";
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Material(
                                elevation: 30,
                                child: Container(
                                  width: 160,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Text(
                                      'Admin LogIn',
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
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
