import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AirQualityScreen(),
    );
  }
}

class AirQualityScreen extends StatefulWidget {
  @override
  _AirQualityScreenState createState() => _AirQualityScreenState();
}

class _AirQualityScreenState extends State<AirQualityScreen> {
  String apiUrl =
      "https://api.waqi.info/feed/Nakhon%20Pathom/?token=aaff7624fc592a0d3807127579b6d3b3742a3ac1";
  int? aqi;
  String city = "กำลังโหลด...";
  double? temperature;
  String airQualityStatus = "กำลังโหลด...";
  Color bgColor = Colors.grey[200]!;

  Future<void> fetchAirQuality() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          aqi = data['data']['aqi'];
          city = data['data']['city']['name'];
          temperature = data['data']['iaqi']['t']['v'].toDouble();
          airQualityStatus = getAirQualityStatus(aqi!);
          bgColor = getBgColor(aqi!);
        });
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  String getAirQualityStatus(int aqi) {
    if (aqi <= 50) return "ดีมาก 😊";
    if (aqi <= 100) return "ปานกลาง 😐";
    if (aqi <= 150) return "เริ่มมีผลกระทบ 😷";
    if (aqi <= 200) return "ไม่ดีต่อสุขภาพ 🥴";
    if (aqi <= 300) return "แย่มาก 🏭";
    return "อันตรายมาก! ☠️";
  }

  Color getBgColor(int aqi) {
    if (aqi <= 50) return Colors.green[300]!;
    if (aqi <= 100) return Colors.yellow[300]!;
    if (aqi <= 150) return Colors.orange[300]!;
    if (aqi <= 200) return Colors.red[300]!;
    if (aqi <= 300) return Colors.purple[300]!;
    return Colors.black87;
  }

  @override
  void initState() {
    super.initState();
    fetchAirQuality();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("🌏 ดัชนีคุณภาพอากาศ นครปฐม"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wb_sunny, size: 80, color: Colors.white),
            SizedBox(height: 10),
            Text("📍 จังหวัด: $city", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
                ],
              ),
              child: Column(
                children: [
                  Text("🌫 AQI: ${aqi ?? "กำลังโหลด..."}", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("$airQualityStatus", style: TextStyle(fontSize: 20, color: Colors.blueGrey[700])),
                  SizedBox(height: 20),
                  Text("🌡 อุณหภูมิ: ${temperature ?? "กำลังโหลด..."}°C", style: TextStyle(fontSize: 22)),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: fetchAirQuality,
              icon: Icon(Icons.refresh),
              label: Text("อัปเดตข้อมูล"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

