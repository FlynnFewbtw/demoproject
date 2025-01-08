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
      home: const GridLayoutExample(),
    );
  }
}

class GridLayoutExample extends StatelessWidget {
  const GridLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Layout'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: const Color.fromARGB(255, 246, 237, 240), // พื้นหลังสีชมพูอ่อน
        padding: const EdgeInsets.all(20.0), // ระยะขอบรอบ Grid
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                createColoredBox(Colors.red),
                createColoredBox(Colors.green),
                createColoredBox(Colors.blue),
              ],
            ),
            const SizedBox(height: 20), // ระยะห่างระหว่างแถว
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                createColoredBox(const Color.fromARGB(255, 38, 237, 255)),
                createColoredBox(Colors.purple),
                createColoredBox(Colors.yellow),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ฟังก์ชันสำหรับสร้างกล่องสี
  Widget createColoredBox(Color color) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}
