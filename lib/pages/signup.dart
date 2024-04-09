import 'package:e_commerce_app/pages/bottom_nav.dart';
import 'package:e_commerce_app/pages/home.dart';
import 'package:e_commerce_app/pages/login.dart';
import 'package:e_commerce_app/services/database_methods.dart';
import 'package:e_commerce_app/services/shared_pref_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/widget_support.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String name = '', email = '', password = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  registration(String name, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const BottomNav()));
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Your Password Is Weak')));
        String id = randomAlphaNumeric(10);
        Map<String, dynamic> addUserInfo = {
          "name": nameController.text,
          'email': emailController.text,
          'waller': '0',
          "id": id
        };
        SharedPreferences spName = await SharedPreferences.getInstance();
        spName.setString("userName", nameController.text);
        await MyDatabaseMethod().addUserDetail(addUserInfo, id);
        await SharedPrefHelper().saveUserEmail(emailController.text);
        await SharedPrefHelper().saveUserWallet('0');
        await SharedPrefHelper().saveUserId(id);
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Your Email Is Already In Use')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Colors.black,
                      Colors.black12,
                    ])),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3),
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
                      elevation: 100,
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        height: MediaQuery.of(context).size.height / 1.7,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'SignUp',
                                  style: AppWidget.headlineTextStyle(),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Name';
                                    }
                                  },
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      hintText: "Name",
                                      hintStyle: AppWidget.semiBoldTextStyle(),
                                      prefixIcon:
                                          const Icon(Icons.person_outline)),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Email';
                                    }
                                  },
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle: AppWidget.semiBoldTextStyle(),
                                      prefixIcon:
                                          const Icon(Icons.email_outlined)),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Password';
                                    }
                                  },
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: AppWidget.semiBoldTextStyle(),
                                      prefixIcon:
                                          const Icon(Icons.lock_outline)),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        email = emailController.text.toString();
                                        password =
                                            passwordController.text.toString();
                                        name = nameController.text.toString();
                                      });
                                      registration(
                                          nameController.text.toString(),
                                          emailController.text.toString(),
                                          passwordController.text.toString());
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const BottomNav()));
                                    }
                                  },
                                  child: Material(
                                    elevation: 30,
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      width: 200,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: const Center(
                                        child: Text(
                                          "SignUp",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have An Account?",
                          style: AppWidget.lightTextStyle(),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LogInScreen()));
                            },
                            child: Text(
                              'LogIn',
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
      ),
    );
  }
}
