import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Stack(
          children: [
            AppBar(
              title: const Text('Profile Page'),
              backgroundColor: Colors.orange,
            ),
            Positioned(
              top: 20,
              left: 255,
              child: Transform.rotate(
                angle: 0.785398, // หมุน 45 องศา (radians)
                child: Container(
                  color: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 4),
                  child: const Text(
                    'DEBUG',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'User Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Profile Information Section
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 20),
                  Icon(Icons.email, color: Colors.blue),
                  SizedBox(width: 10),
                  Text('user@example.com', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(width: 20),
                  Icon(Icons.phone, color: Colors.blue),
                  SizedBox(width: 10),
                  Text('123-456-7890', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(width: 20),
                  Icon(Icons.location_on, color: Colors.blue),
                  SizedBox(width: 10),
                  Text('123 Main Street', style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
          const Spacer(),

          // Menu Section (Buttons)
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // จัดตำแหน่งซ้าย-ขวา
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 50.0), // เพิ่มระยะห่างจากขอบซ้าย
                child: ElevatedButton(
                  onPressed: () {
                    // Add edit profile functionality
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                  ),
                  child: const Text('Edit Profile'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 50.0), // เพิ่มระยะห่างจากขอบขวา
                child: ElevatedButton(
                  onPressed: () {
                    // Add logout functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                  ),
                  child: const Text('Logout'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
