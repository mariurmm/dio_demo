// import 'package:dio_demo/dog_pic/random_dog.dart';
import 'package:dio_demo/random_cat.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     
      // home: RandomDog(),
      home: RandomCat(),
    );
  }
}

