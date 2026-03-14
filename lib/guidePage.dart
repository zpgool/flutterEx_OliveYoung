import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/loginPage.dart';

class Guidepage extends StatefulWidget {
  const Guidepage({super.key});

  @override
  State<Guidepage> createState() => _GuidePageState();
}

class _GuidePageState extends State<Guidepage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<List<Map<String, dynamic>>> _pages = [
    [
      {'text': '3시간 안에 받아보는\n', 'green': false},
      {'text': '오늘드림', 'green': true},
      {'text': ' 빠른배송', 'green': false},
    ],
    [
      {'text': '천만리뷰', 'green': true},
      {'text': '에서도\n간편한 맞춤 리뷰 탐색', 'green': false},
    ],
    [
      {'text': '지금 찾는 상품,\n', 'green': false},
      {'text': '가까운 매장에서 재고 확인', 'green': true},
    ],
    [
      {'text': '친구 생일 당일 도착!\n퀵보다 빠른 ', 'green': false},
      {'text': '선물하기', 'green': true},
    ],
    [
      {'text': '지금 로그인하고\n', 'green': false},
      {'text': '올리브영', 'green': true},
      {'text': '을 시작해보세요', 'green': false},
    ],
  ];

  final List<String> _descs = [
    '오늘드림 주소 등록하면\n가까운 매장 자동연결',
    '피부 컨디션 맞춤부터\n관심 키워드 검색까지',
    '올영 매장의 재고 확인하고\n빠르게 픽업 주문까지!',
    '친구 집 근처 매장에서\n신속한 선물 전달',
    '지금 받을 수 있는\n다양한 혜택',
  ];

  Widget _buildIconItem(IconData icon, String text) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xfff0f1f4),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(icon, color: CupertinoColors.black, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            color: CupertinoColors.black,
            fontSize: 13,
            fontWeight: FontWeight(600),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          const SizedBox(height: 50),

          // X 버튼
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CupertinoButton(
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
              ),
            ],
          ),


          // PageView
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) =>
                      setState(() => _currentPage = index),
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 텍스트
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: _pages[index].map<TextSpan>((part) {
                                    return TextSpan(
                                      text: part['text'],
                                      style: TextStyle(
                                        color: part['green']
                                            ? Color(0xff7fdb23)
                                            : Color(0xff000000),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                _descs[index],
                                style: TextStyle(
                                  color: Color(0xffa5aaaf),
                                  fontSize: 15,
                                  fontWeight: FontWeight(600),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 70),

                        // 마지막 페이지 vs 나머지
                        if (index == _pages.length - 1)
                          Expanded(
                            child: Column(
                              children: [
                                // 아이콘 4개
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 70,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          _buildIconItem(
                                            CupertinoIcons.shopping_cart,
                                            '첫 구매 딜',
                                          ),

                                          const SizedBox(width: 70),

                                          _buildIconItem(
                                            CupertinoIcons.ticket,
                                            '오늘드림 쿠폰',
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 30),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          _buildIconItem(
                                            CupertinoIcons.tickets,
                                            '첫 구매 쿠폰',
                                          ),

                                          const SizedBox(width: 70),

                                          _buildIconItem(
                                            CupertinoIcons.plus_circled,
                                            'CJ ONE 적립',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Spacer(),

                                // 하단 버튼
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            const Loginpage(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 90,
                                    color: Color(0xff83dc29),
                                    child: Center(
                                      child: Text(
                                        '올리브영 시작하기',
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
                          )
                        else
                          Center(
                            child: Image.asset(
                              'assets/guideImg$index.png',
                              width: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                      ],
                    );
                  },
                ),

                // 인디케이터
                Positioned(
                  top: 150,
                  left: 20,
                  child: Row(
                    children: List.generate(_pages.length, (i) {
                      return Container(
                        margin: EdgeInsets.only(right: 6),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == i
                              ? Color(0xff000000)
                              : Color(0xffd9d9d9),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
