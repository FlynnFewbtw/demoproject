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
      home: const ProductLayout(),
    );
  }
}

class ProductLayout extends StatelessWidget {
  const ProductLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: const Color.fromARGB(255, 255, 132, 228),
            child: const Text(
              'Product Layout',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),

          // Category Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            color: Colors.grey[200],
            child: const Text(
              'Category: Electronics',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),

          // Product Section
          Expanded(
            child: Column(
              children: [
                // First row of products
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    productCard('Laptop', '999 THB',
                        'https://i.ytimg.com/vi/raJv1oe1MuQ/hqdefault.jpg'), // Replace with your image path
                    productCard('Smartphone', '699 THB',
                        'https://th-test-11.slatic.net/p/77074ca7258c5645edd0069bab837eb8.jpg'), // Replace with your image path
                  ],
                ),
                const SizedBox(height: 20),

                // Second row of products
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    productCard('Tablet', '499 THB',
                        'https://files.oaiusercontent.com/file-JPRBzMEVXAjDzrmKxPJ7Vf?se=2025-01-07T10%3A03%3A41Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3D7d645d99-bef7-4969-8c8a-0dbb235cff15.webp&sig=QVDucrBzMx8nFmlooldHbzC6k9rAwSVUqiC2K%2Be2Vgo%3D'), // Replace with your image path
                    productCard('Camera', '299 THB',
                        'https://f.ptcdn.info/476/016/000/1394266999-X77738302-o.jpg'), // Replace with your image path
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productCard(String name, String price, String imagePath) {
    return Column(
      children: [
        ClipRect(
          child: Image.network(
            imagePath, // Load image from URL
            width: 150,
            height: 150,
            fit: BoxFit.cover, // Adjust image to fit the container
          ),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontSize: 16)),
        Text(price, style: const TextStyle(color: Colors.green)),
      ],
    );
  }
}