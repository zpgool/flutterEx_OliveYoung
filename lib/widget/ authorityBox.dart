import 'package:flutter/cupertino.dart';

class AuthorityWidget extends StatelessWidget {
  final IconData icon;
  final String text1;
  final String text2;

  const AuthorityWidget({super.key, required this.icon, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xfff0f1f4),
              borderRadius: BorderRadius.circular(100),
            ),
      
            child: Icon(icon, color: CupertinoColors.black),
          ),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 15,
                  fontWeight: FontWeight(600),
                ),
              ),
              Text(
                text2,
                style: TextStyle(
                  color: const Color.fromARGB(135, 0, 0, 0),
                  fontSize: 13,
                  fontWeight: FontWeight(500),
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
