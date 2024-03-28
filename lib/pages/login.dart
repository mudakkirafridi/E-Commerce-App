import 'package:e_commerce_app/pages/signup.dart';
import 'package:e_commerce_app/widgets/widget_support.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Color(0xffff5c30),
                    Color(0xffe74b1a),
                  ])),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40))),
              child: const Text(''),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'images/logo.png',
                      width: MediaQuery.of(context).size.width / 1.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 9,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Login',
                            style: AppWidget.headlineTextStyle(),
                          ),
                          TextField(
                            decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: AppWidget.semiBoldTextStyle(),
                                prefixIcon: const Icon(Icons.email_outlined)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: AppWidget.semiBoldTextStyle(),
                                prefixIcon: const Icon(Icons.lock_outline)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: AppWidget.semiBoldTextStyle(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 200,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                  color: const Color(0xffff5722),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text(
                                  "LogIn",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have An Account?",
                        style: AppWidget.lightTextStyle(),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                          child: Text(
                            'SignUp',
                            style: AppWidget.semiBoldTextStyle(),
                          ))
                    ],
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