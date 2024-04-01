import 'package:e_commerce_app/admin/home.dart';
import 'package:e_commerce_app/widgets/widget_support.dart';
import 'package:flutter/material.dart';

class FoodAddScreen extends StatefulWidget {
  const FoodAddScreen({super.key});

  @override
  State<FoodAddScreen> createState() => _FoodAddScreenState();
}

class _FoodAddScreenState extends State<FoodAddScreen> {
  final List<String> items = ['Ice-Cream', 'Salad', 'Pizza', 'Burger'];
  String? dropDownValue;
  TextEditingController nameController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();
  TextEditingController itemDetailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Items',
          style: AppWidget.headlineTextStyle(),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AdminHomeScreen()));
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin:
              const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload The Item Picture',
                style: AppWidget.semiBoldTextStyle(),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 1.5)),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 40,
                      ),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Item Name',
                style: AppWidget.semiBoldTextStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Item Name",
                      hintStyle: AppWidget.lightTextStyle()),
                ),
              ),
              //==============================
              const SizedBox(
                height: 30,
              ),
              Text(
                'Item Name Price',
                style: AppWidget.semiBoldTextStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: itemPriceController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Item Name",
                      hintStyle: AppWidget.lightTextStyle()),
                ),
              ),
              //===========================================
              const SizedBox(
                height: 30,
              ),
              Text(
                'Enter Item Details',
                style: AppWidget.semiBoldTextStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  maxLines: 5,
                  controller: itemDetailController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Item Name",
                      hintStyle: AppWidget.lightTextStyle()),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Select Category',
                style: AppWidget.semiBoldTextStyle(),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: const Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  dropdownColor: Colors.white,
                  hint: const Text('Select Category'),
                  iconSize: 35,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  onChanged: ((value) => setState(() {
                        dropDownValue = value;
                      })),
                  value: dropDownValue,
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 160,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'Add',
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
      ),
    );
  }
}
