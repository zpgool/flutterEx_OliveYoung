import 'package:flutter/cupertino.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<String> _tabs = ['홈', '오특', '랭킹', '매거진', 'LUXE EDIT', '세일', '기획전'];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        middle: Row(
          children: [
            Image.asset('assets/logo.png', height: 30),
            const SizedBox(width: 5),
            Text('올리브영', style: TextStyle(fontSize: 18, fontWeight: FontWeight(700), color: CupertinoColors.black)),
            const SizedBox(width: 10),
            Text('헬스+', style: TextStyle(color: Color(0xff90939a), fontSize: 16, fontWeight: FontWeight(700))),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(padding: EdgeInsets.zero, child: Icon(CupertinoIcons.search, color: CupertinoColors.black,), onPressed: () {}),
            CupertinoButton(padding: EdgeInsets.zero, child: Icon(CupertinoIcons.bell, color: CupertinoColors.black), onPressed: () {}),
            CupertinoButton(padding: EdgeInsets.zero, child: Icon(CupertinoIcons.bag, color: CupertinoColors.black), onPressed: () {}),
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [

            // 상단 탭바
            Container(
              height: 44,
              color: CupertinoColors.white,
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_tabs.length, (index) {
                    final isSelected = _selectedIndex == index;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedIndex = index),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: isSelected ? CupertinoColors.black : CupertinoColors.transparent,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _tabs[index],
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                              color: isSelected ? CupertinoColors.black : Color.fromARGB(255, 120, 120, 120),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            // 탭 내용
            Expanded(
              child: Container(),  // 여기에 각 탭 내용 넣으면 됨
            ),
          ],
        ),
      ),
    );
  }
}