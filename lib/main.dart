import 'package:flutter/material.dart';

void main() => runApp(MyStudentApp());

class MyStudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Student App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

// หน้าแรก
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าแรก', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.lerp(const Color.fromARGB(255, 34, 12, 129), const Color.fromARGB(255, 31, 127, 210), _animation.value)!,
                  Color.lerp(const Color.fromARGB(255, 16, 8, 61), const Color.fromARGB(255, 13, 15, 90), _animation.value)!,
                  Color.lerp(const Color.fromARGB(255, 64, 64, 160), const Color.fromARGB(255, 28, 213, 173), _animation.value)!,
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 16, right: 16, bottom: 16),
              child: ListView(
                children: [
                  Text(
                    'ยินดีต้อนรับสู่แอปโปรไฟล์นักศึกษา',
                    style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  _buildAnimatedButton(
                    'ดูผลการเรียน เทอม 1',
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => TermPage(term: 1))),
                  ),
                  _buildAnimatedButton(
                    'ดูผลการเรียน เทอม 2',
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => TermPage(term: 2))),
                  ),
                  _buildAnimatedButton(
                    'ดูผลการเรียน เทอม 3',
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => TermPage(term: 3))),
                  ),
                  _buildAnimatedButton(
                    'ดูผลการเรียน เทอม 4',
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => TermPage(term: 4))),
                  ),
                  _buildAnimatedButton(
                    'ดูผลการเรียน เทอม 5',
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => TermPage(term: 5))),
                  ),
                  _buildAnimatedButton(
                    'ผลลัพธ์การเรียนรู้',
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => LearningOutcomePage())),
                  ),
                  _buildAnimatedButton(
                    'ข้อมูลส่วนตัว',
                    () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage())),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedButton(String text, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.2),
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 8,
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

// หน้าผลการเรียน (ใช้ร่วมกันได้ทุกเทอม)
class TermPage extends StatelessWidget {
  final int term;
  TermPage({required this.term});

  final Map<int, List<Map<String, String>>> termData = {
    1: [
      {'วิชา': 'แก่นวิศวกรรมซอฟต์แวร์','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'วิศวกรรมซอฟต์แวร์เบื้องต้น','หน่วยกิต': '3', 'เกรด': 'B+'},
      {'วิชา': 'การสื่อสารข้อมูลและเครือข่าย','หน่วยกิต': '3', 'เกรด': 'B'},
    ],
    2: [
      {'วิชา': 'ระบบปฏิบัติการและการจัดโครงแบบเครื่องแม่ข่าย','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'การประมวลผลภาพดิจิทัล และการมองเห็นโดยคอมพิวเตอร์','หน่วยกิต': '3', 'เกรด': 'B+'},
      {'วิชา': 'คอมพิวเตอร์ช่วยในงานวิศวกรรมและการผลิต','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'การเขียนโปรแกรมสำหรับวิศวกรซอฟต์แวร์','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'ภาษาอังกฤษเชิงวิชาการ','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'โครงสร้างข้อมูลและขั้นตอนวิธี','หน่วยกิต': '3', 'เกรด': 'B+'},
      {'วิชา': 'โครงสร้างและสถาปัตยกรรมคอมพิวเตอร์','หน่วยกิต': '3', 'เกรด': 'B'},
      {'วิชา': 'การกำหนดความต้องการและการออกแบบทางซอฟต์แวร์','หน่วยกิต': '3', 'เกรด': 'A'},
    ],
    3: [
      {'วิชา': 'ระบบฝังตัวและระบบอินเทอร์เน็ตในทุกสิ่ง','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'ความน่าจะเป็นและสถิติในงานวิศวกรรม','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'การเขียนโปรแกรมเชิงวัตถุ','หน่วยกิต': '3', 'เกรด': 'B+'},
      {'วิชา': 'คณิตศาสตร์ดิสครีต','หน่วยกิต': '3', 'เกรด': 'B'},
      {'วิชา': 'สถาปัตยกรรมซอฟต์แวร์','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'กระบวนการซอฟต์แวร์และการประกันคุณภาพ','หน่วยกิต': '3', 'เกรด': 'B'},
    ],
    4: [
      {'วิชา': 'พีชคณิตเชิงเส้นสำหรับวิศวกรรม','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'การวิเคราะห์และออกแบบระบบ','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'การจัดการโครงการซอฟต์แวร์','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'สัมมนาทางวิศวกรรมซอฟต์แวร์','หน่วยกิต': '1', 'เกรด': 'A'},
      {'วิชา': 'คลังข้อมูลและเหมืองข้อมูล','หน่วยกิต': '3', 'เกรด': 'A'},
      {'วิชา': 'วิวัฒนาการซอฟต์แวร์และการบำรุงรักษา','หน่วยกิต': '3', 'เกรด': 'A'},
    ],
    5: [
      {'วิชา': 'โครงงานทางวิศวกรรมซอฟต์แวร์','หน่วยกิต': '3', 'เกรด': 'ไม่ระบุ'},
      {'วิชา': 'การออกแบบกราฟิกเพื่อการนำเสนอ','หน่วยกิต': '3', 'เกรด': 'ไม่ระบุ'},
      {'วิชา': 'วิศวกรรมเทคโนโลยีสื่อประสมและแอนิเมชัน','หน่วยกิต': '3', 'เกรด': 'ไม่ระบุ'},
      {'วิชา': 'การเตรียมสหกิจศึกษาและฝึกงานด้านวิศวกรรมซอฟต์แวร์','หน่วยกิต': '1', 'เกรด': 'ไม่ระบุ'},
      {'วิชา': 'ความมั่นคงปลอดภัยทางไซเบอร์เบื้องต้น','หน่วยกิต': '3', 'เกรด': 'ไม่ระบุ'},
      {'วิชา': 'ปัญญาประดิษฐ์และการเรียนรู้ของเครื่อง','หน่วยกิต': '3', 'เกรด': 'ไม่ระบุ'},
      {'วิชา': 'ธุรกิจสตาร์อัพด้านซอฟต์แวร์','หน่วยกิต': '2', 'เกรด': 'ไม่ระบุ'},
      {'วิชา': 'การออกแบบและพัฒนาโปรแกรมประยุกต์สำหรับอุปกรณ์เคลี่อนที่','หน่วยกิต': '3', 'เกรด': 'ไม่ระบุ'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    final subjects = termData[term] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('ผลการเรียน เทอม $term'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[50]!,
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // หัวตาราง
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'รายวิชา',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'หน่วยกิต',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'เกรด',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // เนื้อหาตาราง
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: subjects.length,
                    itemBuilder: (context, index) {
                      final subject = subjects[index];
                      final isEven = index % 2 == 0;
                      
                      return Container(
                        decoration: BoxDecoration(
                          color: isEven ? Colors.grey[50] : Colors.white,
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[300]!,
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  subject['วิชา']!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  subject['หน่วยกิต']!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: _getGradeColor(subject['เกรด']!),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    subject['เกรด']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              // สรุปผลการเรียน
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'จำนวนวิชา: ${subjects.length} วิชา',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[800],
                      ),
                    ),
                    Text(
                      'หน่วยกิตรวม: ${_calculateTotalCredits(subjects)} หน่วยกิต',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[800],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'A':
        return Colors.green;
      case 'B+':
        return Colors.lightGreen;
      case 'B':
        return Colors.orange;
      case 'C+':
        return Colors.deepOrange;
      case 'C':
        return Colors.red;
      case 'D':
        return Colors.red[700]!;
      case 'F':
        return Colors.red[900]!;
      default:
        return Colors.grey;
    }
  }

  int _calculateTotalCredits(List<Map<String, String>> subjects) {
    int total = 0;
    for (var subject in subjects) {
      if (subject['เกรด'] != 'ไม่ระบุ') {
        total += int.parse(subject['หน่วยกิต']!);
      }
    }
    return total;
  }
}

// หน้าแสดงผลลัพธ์การเรียนรู้
class LearningOutcomePage extends StatelessWidget {
  final List<Map<String, String>> outcomes = [
    {
      'ปี': 'ปี 1',
      'ผลลัพธ์': 'ได้เรียนรู้เกี่ยวกับการเขียนโปรแกรมพื้นฐาน, เข้าใจเกี่ยวกับเครือข่ายและการสื่อสารข้อมูล, เข้าใจเกี่ยวกับ data structure และ algorithm, เข้าใจเกี่ยวกับโปรแกรมและเทคโนโลยีการผลิตของโรงงาน'
    },
    {
      'ปี': 'ปี 2',
      'ผลลัพธ์': 'ได้เรียนรู้เกี่ยวกับความน่าจะเป็นและสถิติในงานวิศวกรรม, เข้าใจเกี่ยวกับการเขียนโปรแกรมเชิงวัตถุ, เข้าใจเกี่ยวกับการวิเคราะห์และออกแบบระบบ, เข้าใจเกี่ยวกับการจัดการโครงการซอฟต์แวร์'
    },
    {
      'ปี': 'ปี 3',
      'ผลลัพธ์': 'กำลังศึกษาอยู่'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ผลลัพธ์การเรียนรู้')),
      body: ListView.builder(
        itemCount: outcomes.length,
        itemBuilder: (context, index) {
          final item = outcomes[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(item['ปี']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item['ผลลัพธ์']!),
            ),
          );
        },
      ),
    );
  }
}

// หน้าโปรไฟล์
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ข้อมูลส่วนตัว')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 120,
                backgroundImage: AssetImage('assets/mypicture.png'), // หรือลองใช้ Image.network ก็ได้
              ),
              SizedBox(height: 16),
              Text('ชื่อ: นายศุภวิชญ์ แก่นนาค', style: TextStyle(fontSize: 30)),
              Text('รหัสนักศึกษา: 66543210031-1', style: TextStyle(fontSize: 20)),
              Text('ความชอบ: coding, เกม, ดนตรี'),
              Text('ความถนัด: typescript, Python'),
              Text('ความสามารถพิเศษ: พัฒนาเว็บแอปพลิเคชัน'),
            ],
          ),
        ),
      ),
    );
  }
}
