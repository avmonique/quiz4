import 'package:flutter/material.dart';

class Quiz4Screen2 extends StatelessWidget {
  Quiz4Screen2({super.key, required this.vows});

  List<String> vows = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vowels List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Expanded(
          child: ListView.builder(
            itemCount: vows.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(vows[index],
                  style: TextStyle(fontSize: 32,),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}