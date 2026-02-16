// https://www.freepublicapis.com/the-cat-api
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RandomCat extends StatefulWidget {
  const RandomCat({super.key});

  @override
  State<RandomCat> createState() => _RandomCatState();
}

class _RandomCatState extends State<RandomCat> {
  RandomCatResponse? catData;
  bool isLoading = false;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Spacer(),
              ElevatedButton(onPressed: _fetchNewPhoto, child: Text('Get random cat')),
            ],
          ),
        ),
      ),
    );
  }
}

void _fetchNewPhoto() async {
  final dio = Dio();
  final response = await dio.get('https://api.thecatapi.com/v1/images/search');
  print(response.data);
}

class RandomCatResponse {
  final String url;
  final int width;
  final int height;

  RandomCatResponse({
    required this.url,
    required this.width,
    required this.height,
  });
}
