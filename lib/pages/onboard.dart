import 'package:e_commerce_app/widgets/content_model.dart';
import 'package:e_commerce_app/widgets/widget_support.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PageView.builder(
              controller: _controller,
              itemCount: content.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.asset(
                        content[i].image!,
                        height: 450,
                        width: MediaQuery.of(context).size.width / 1.5,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        content[i].title!,
                        style: AppWidget.semiBoldTextStyle(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        content[i].description!,
                        style: AppWidget.lightTextStyle(),
                      )
                    ],
                  ),
                );
              }),
          // Container(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: List.generate(content.length, (index) =>
          //     buildDot(index , context)
          //     )
          //   ),
          // )
        ],
      ),
    );
  }
}
