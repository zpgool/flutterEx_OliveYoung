import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/home.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginPageState();
}

class _LoginPageState extends State<Loginpage> {
  bool _autoLogin = true;
  bool _saveId = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // X 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const MyHomePage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                      ),
                    ),
                    child: Icon(
                      CupertinoIcons.xmark,
                      color: CupertinoColors.black,
                      size: 27,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 로고
              Center(
                child: Text(
                  'OLIVE YOUNG',
                  style: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 28,
                    fontWeight: FontWeight(800),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // 아이디 입력
              CupertinoTextField(
                placeholder: 'CJ ONE 통합회원 아이디',
                placeholderStyle: TextStyle(color: Color(0xffa0a6ad)),
                style: TextStyle(color: CupertinoColors.black),
                cursorColor: CupertinoColors.black,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffdddddd)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              const SizedBox(height: 10),

              // 비밀번호 입력
              CupertinoTextField(
                placeholder: '비밀번호 (8~12자, 영문+숫자+특수문자)',
                placeholderStyle: TextStyle(color: Color(0xffa0a6ad)),
                style: TextStyle(color: CupertinoColors.black),
                cursorColor: CupertinoColors.black,
                obscureText: true,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffdddddd)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              const SizedBox(height: 20),

              // 안내 텍스트
              Text(
                '정보 보호를 위해 아이디, 비밀번호와 함께 자동입력 방지문자를 입력해 주세요.',
                style: TextStyle(
                  color: Color.fromARGB(255, 109, 111, 112),
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 15),

              // 캡차 이미지 + 버튼
              Row(
                children: [
                  Container(
                    width: 260,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xffeeeeee),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        '644903',
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight(700),
                          letterSpacing: 4,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.refresh,
                            size: 16,
                            color: Color(0xff555555),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '새로고침',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff555555),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.speaker_2,
                            size: 16,
                            color: Color(0xff555555),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '음성듣기',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff555555),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // 자동입력 방지문자 입력
              CupertinoTextField(
                placeholder: '자동입력 방지문자를 입력해 주세요',
                placeholderStyle: TextStyle(color: Color(0xffa0a6ad)),
                style: TextStyle(color: CupertinoColors.black),
                cursorColor: CupertinoColors.black,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffdddddd)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              const SizedBox(height: 15),

              // 자동로그인 / 아이디 저장
              Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => _autoLogin = !_autoLogin),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: _autoLogin
                                ? CupertinoColors.black
                                : CupertinoColors.white,
                            border: Border.all(color: CupertinoColors.black),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: _autoLogin
                              ? Icon(
                                  CupertinoIcons.checkmark,
                                  size: 14,
                                  color: CupertinoColors.white,
                                )
                              : null,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '자동로그인',
                          style: TextStyle(
                            fontSize: 14,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => setState(() => _saveId = !_saveId),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: _saveId
                                ? CupertinoColors.black
                                : CupertinoColors.white,
                            border: Border.all(color: CupertinoColors.black),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: _saveId
                              ? Icon(
                                  CupertinoIcons.checkmark,
                                  size: 14,
                                  color: CupertinoColors.white,
                                )
                              : null,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '아이디 저장',
                          style: TextStyle(
                            fontSize: 14,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // 로그인 버튼
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    CupertinoPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    color: CupertinoColors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '로그인',
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 17,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // 아이디 찾기 | 비밀번호 찾기
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '아이디 찾기',
                      style: TextStyle(fontSize: 14, color: Color(0xff555555)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '|',
                        style: TextStyle(color: Color(0xffdddddd)),
                      ),
                    ),
                    Text(
                      '비밀번호 찾기',
                      style: TextStyle(fontSize: 14, color: Color(0xff555555)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // 카카오 로그인
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Color(0xffFEE500),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '카카오로 로그인',
                      style: TextStyle(
                        color: CupertinoColors.black,
                        fontSize: 17,
                        fontWeight: FontWeight(700),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Apple 로그인
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffdddddd)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('', style: TextStyle(fontSize: 20)),
                        const SizedBox(width: 8),
                        Text(
                          'Apple로 로그인',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight(700),
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // 회원가입
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 52,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffdddddd)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '회원가입',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight(700),
                        color: CupertinoColors.black,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 하단 링크
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ver 3.27.0 최신 버전',
                      style: TextStyle(fontSize: 12, color: Color(0xff999999)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '캐시 데이터 삭제',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff999999),
                        ),
                      ),
                    ),
                    Text(
                      '오픈 라이선스',
                      style: TextStyle(fontSize: 12, color: Color(0xff999999)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              Center(
                child: Text(
                  '고객센터 · 공지사항',
                  style: TextStyle(fontSize: 12, color: Color(0xff999999)),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
