import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple), // สีม่วงชมพู: seed เป็นม่วง
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'แปลงกิโลเมตรเป็นไมล์'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _kmController = TextEditingController();

  double km = 0;
  double miles = 0;

  void calculate(){
    km = double.tryParse(_kmController.text) ?? 0; //ดึงค่ากิโลเมตร พยายามแปลงเลขก่อน ใส่??0 กันตาย ถ้าแปลงไม่ได้ให้ใส่0

    print("km =$km");
    setState(() {
      miles = km / 1.609; // แปลงกิโลเมตรเป็นไมล์
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient( // สีม่วงชมพู: พื้นหลังไล่สีม่วง-ชมพู
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF3E5F5), // ม่วงอ่อน
              Color(0xFFFCE4EC), // ชมพูอ่อน
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent, // สีม่วงชมพู: โปร่งใสให้เห็น gradient
                elevation: 0,
                title: Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8E24AA), // สีม่วงชมพู: ม่วงเข้ม
                  ),
                ),
                centerTitle: true,
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient( // สีม่วงชมพู: วงไล่สีรอบไอคอน
                              colors: [Color(0xFFBA68C8), Color(0xFFF06292)],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.route,
                            size: 44,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 12),

                        const Text(
                          'คำนวณแปลงกิโลเมตรเป็นไมล์',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8E24AA), // สีม่วงชมพู: ม่วงเข้ม
                          ),
                        ),

                        const SizedBox(height: 20),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient( // สีม่วงชมพู: การ์ดผลลัพธ์ไล่สี
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFFAB47BC), Color(0xFFEC407A)],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purple.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const Text(
                                "ระยะทาง",
                                style: TextStyle(color: Colors.white70, fontSize: 14),
                              ),
                              Text(
                                "${miles.toStringAsFixed(2)} ไมล์",
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // สีม่วงชมพู: ตัวหนังสือขาวตัดกับพื้นไล่สี
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        TextField(
                          controller: _kmController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "กิโลเมตร",
                            labelStyle: const TextStyle(color: Color(0xFFAD1457)), // สีม่วงชมพู: label สีชมพูเข้ม
                            prefixIcon: const Icon(Icons.straighten, color: Color(0xFFAB47BC)), // สีม่วงชมพู
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder( // สีม่วงชมพู: ขอบตอน focus เป็นชมพู
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFFEC407A), width: 2),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () => calculate(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFAB47BC), // สีม่วงชมพู: ปุ่มม่วง
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                              shadowColor: Colors.pink.withOpacity(0.4), // สีม่วงชมพู: เงาสีชมพู
                            ),
                            child: const Text(
                              "คำนวณ",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}