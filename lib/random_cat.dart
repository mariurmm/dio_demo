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

  Future<void> _fetchNewPhoto() async {
    setState(() => isLoading = true);

    final dio = Dio();
    final response = await dio.get(
      'https://api.thecatapi.com/v1/images/search',
    );

    final data = response.data[0];
    catData = RandomCatResponse(
      url: data['url'],
    );

    setState(() => isLoading = false);
  }

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
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : catData != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              catData!.url,
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: _fetchNewPhoto,
                child: Text('Get random cat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RandomCatResponse {
  final String url;

  RandomCatResponse({
    required this.url,
  });
}