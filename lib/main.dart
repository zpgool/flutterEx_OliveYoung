import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/guidePage.dart';
import 'package:flutter_application_1/home.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/widget/ authorityBox.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fdnzuutprsfsstunxpag.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZkbnp1dXRwcnNmc3N0dW54cGFnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzMzNjQwNzEsImV4cCI6MjA4ODk0MDA3MX0.uPFJl7uUzuVOlkxFnfYZRJLI7D-qIl_-bxZ3qBMobUk',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: const MyIntroPage(),
      theme: CupertinoThemeData(scaffoldBackgroundColor: CupertinoColors.white),
    );
  }
}

class MyIntroPage extends StatefulWidget {
  const MyIntroPage({super.key});

  @override
  State<MyIntroPage> createState() => _MyIntroPageState();
}

class _MyIntroPageState extends State<MyIntroPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => const MyLocationPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xff83dc29),
      child: const Center(
        child: Text(
          'OLIVE YOUNG',
          style: TextStyle(
            color: CupertinoColors.white,
            fontSize: 37,
            fontWeight: FontWeight(700),
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}

class MyLocationPage extends StatefulWidget {
  const MyLocationPage({super.key});

  @override
  State<MyLocationPage> createState() => _MyLocationPageState();
}

class _MyLocationPageState extends State<MyLocationPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              '맞춤형 콘텐츠 제공을 위해',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight(700),
                color: CupertinoColors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '허용',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff83dc29),
                    fontWeight: FontWeight(700),
                  ),
                ),
                Text(
                  '을 눌러주세요',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight(700),
                    color: CupertinoColors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),
            Container(
              width: 220,
              height: 90,
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.black.withAlpha(50),
                    blurRadius: 20,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 220,
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: const Color.fromARGB(167, 192, 192, 192),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '앱에 추적 금지 요청',
                        style: TextStyle(
                          color: Color.fromARGB(255, 192, 192, 192),
                          fontSize: 17,
                          fontWeight: FontWeight(700),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                          title: Text(
                            '"올리브영"이(가) 다른 회사의 앱 및 웹사이트에 걸친 사용자의 활동을 추적하도록 허용하겠습니까?',
                          ),
                          content: Text(
                            '"허용" 해주세요! 고객님의 맞춤형 광고를 제공하기 위해 사용됩니다.',
                          ),
                          actions: [
                            CupertinoDialogAction(
                              onPressed: () => Navigator.pop(context),
                              child: Text('추적 금지 요청'),
                            ),
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              onPressed: () => Navigator.pop(context),
                              child: Text('허용'),
                            ),
                          ],
                        ),
                      );
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      width: 220,
                      height: 45,
                      child: Center(
                        child: Text(
                          '허용',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight(700),
                            color: CupertinoColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xfff0f1f4),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          CupertinoIcons.ticket,
                          color: CupertinoColors.black,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        '맞춤형 할인, 이벤트 정보를 알려드려요',
                        style: TextStyle(
                          color: CupertinoColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight(600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xfff0f1f4),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          CupertinoIcons.paintbrush,
                          color: CupertinoColors.black,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        '관심사에 맞는 콘텐츠와 상품을 볼 수 있어요',
                        style: TextStyle(
                          color: CupertinoColors.black,
                          fontSize: 15,
                          fontWeight: FontWeight(600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: 80,
              color: Color(0xfff0f1f4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Text(
                    '사용자 정보는 애플 정책 기반 개인화된 광고 제공 목적으로만 사용되며,\n허용 상태는 설정 메뉴에서 언제든지 변경할 수 있습니다.',
                    style: TextStyle(
                      color: const Color.fromARGB(138, 0, 0, 0),
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const MyAddSettingsPage(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 90,
                color: Color(0xff83dc29),
                child: Center(
                  child: Text(
                    '계속',
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight(600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyAddSettingsPage extends StatefulWidget {
  const MyAddSettingsPage({super.key});

  @override
  State<MyAddSettingsPage> createState() => _MyAddSettingsPageState();
}

class _MyAddSettingsPageState extends State<MyAddSettingsPage> {
  int _currentStep = 0;

  final List<Map<String, String>> _dialogs = [
    {
      'title': '"올리브영"에서 알림을 보내고자 합니다.',
      'content': '경고, 사운드 및 아이콘 배지가 알림에 포함될 수 있습니다.',
    },
    {
      'title': '"올리브영"이 카메라에 접근하려고 합니다.',
      'content': '고객센터 문의, 리뷰 등록 및 바코드 스캔 시 사용됩니다.',
    },
    {'title': '"올리브영"이 위치에 접근하려고 합니다.', 'content': '주변 매장 조회 시 사용됩니다.'},
    {'title': '"올리브영"이 연락처에 접근하려고 합니다.', 'content': '선물하기 연락처 불러오기 시 사용됩니다.'},
  ];

  void _onTapButton() {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(_dialogs[_currentStep]['title']!),
        content: Text(_dialogs[_currentStep]['content']!),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              _nextStep();
            },
            child: Text('허용 안함'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              _nextStep();
            },
            child: Text('허용'),
          ),
        ],
      ),
    );
  }

  void _nextStep() {
    if (_currentStep < _dialogs.length - 1) {
      setState(() => _currentStep++);
      _onTapButton();
    } else {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => const Guidepage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Text(
                    '앱 접근권한 안내',
                    style: TextStyle(
                      color: CupertinoColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight(700),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '올리브영의 다양한 서비스 제공을 위해\n아래와 같은 기능이 필요합니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromARGB(162, 0, 0, 0),
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 60),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          '선택적 접근 권한',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontSize: 15,
                            fontWeight: FontWeight(700),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  AuthorityWidget(
                    icon: CupertinoIcons.bell,
                    text1: '알림 (선택)',
                    text2: '유용한 소식 및 혜택 푸시 알림 시 사용',
                  ),
                  const SizedBox(height: 10),
                  AuthorityWidget(
                    icon: CupertinoIcons.camera,
                    text1: '사진 카메라 (선택)',
                    text2: '고객센터 문의, 리뷰 등록 및 바코드 스캔 시 사용',
                  ),
                  const SizedBox(height: 10),
                  AuthorityWidget(
                    icon: CupertinoIcons.location_solid,
                    text1: '위치 (선택)',
                    text2: '주변 매장 조회 시 사용',
                  ),
                  const SizedBox(height: 10),
                  AuthorityWidget(
                    icon: CupertinoIcons.person,
                    text1: '연락처 (선택)',
                    text2: '선물하기 연락처 불러오기 시 사용',
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          '• 필수적 접근 권한은 사용하지 않습니다.',
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight(500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 90,
            color: Color(0xfff0f1f4),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Text(
                  '선택적 접근 권한은 해당 기능을 사용할 때만 허용이 필요합니다.\n비허용시에도 해당 기능 외 서비스 이용이 가능합니다. 허용 상태는 휴대폰 설정 메뉴에서 언제든지 변경할 수 있습니다.',
                  style: TextStyle(
                    color: const Color.fromARGB(138, 0, 0, 0),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: _onTapButton,
            child: Container(
              width: double.infinity,
              height: 90,
              color: Color(0xff83dc29),
              child: Center(
                child: Text(
                  '확인',
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight(600),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
