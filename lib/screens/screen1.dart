import 'package:flutter/material.dart';
import 'package:quiz4/screens/screen2.dart';

class Quiz4Screen1 extends StatefulWidget {
  Quiz4Screen1({super.key});

  @override
  State<Quiz4Screen1> createState() => _Quiz4Screen1State();
}

class _Quiz4Screen1State extends State<Quiz4Screen1> {
  List<String> items = [];
  List<String> itemVowels = [];

  var textController = TextEditingController();

  void addItem() {
    String newItem = textController.text.trim();
    String nums = "1234567890";
    String vowels = "aeiouAEIOU";
    bool containsNum = false , startsVow = false;
    if (newItem.isNotEmpty) {
      containsNum = newItem.split("").any(nums.contains);
      if (!containsNum) {
        if (!items.contains(newItem)) {
          setState(() {
            items.add(newItem);
            textController.clear();
          });
          startsVow = vowels.contains(newItem[0]);
          if (startsVow) {
            itemVowels.add(newItem);
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Item should not contain a number."),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Quiz4Screen2(vows: itemVowels),
                ),
              );
            },
            icon: Icon(Icons.museum)
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter item",
              ),
            ),
            ElevatedButton(
              onPressed: addItem,
              child: Text("ADD"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(items[index],
                      style: TextStyle(fontSize: 32,),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}