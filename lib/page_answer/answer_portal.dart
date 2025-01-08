import 'answer1.dart';
import 'answer2.dart';
import 'answer3.dart';
import 'answer4.dart';
import 'package:flutter/material.dart';

class OptionAnswerPage extends StatelessWidget {
  const OptionAnswerPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My answer'),
        backgroundColor: const Color.fromARGB(255, 227, 70, 61),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const GridLayoutExample()),
              );
            },
            child: const Text('Answer1'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SocialMediaPost()),
              );
            },
            child: const Text('Answer2'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductLayout()),
              );
            },
            child: const Text('Answer3'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            child: const Text('Answer4'),
          ),
        ]),
      ),
    );
  }
}
