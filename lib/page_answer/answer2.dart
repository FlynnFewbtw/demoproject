import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SocialMediaPost(),
    );
  }
}

class SocialMediaPost extends StatelessWidget {
  const SocialMediaPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media Post'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          // First Row: Profile Picture and Username
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue, // Placeholder for profile picture
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('User Name',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('5 minutes ago', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20), // Spacing between rows

          // Second Row: Post Image
          Container(
            width: double.infinity,
            height: 200,
            color: const Color.fromARGB(
                83, 72, 89, 130), // Placeholder for post image
          ),
          const SizedBox(height: 20), // Spacing between rows

          // Third Row: Like, Comment, Share Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Like')),
              ElevatedButton(onPressed: () {}, child: const Text('Comment')),
              ElevatedButton(onPressed: () {}, child: const Text('Share')),
            ],
          ),
        ],
      ),
    );
  }
}
