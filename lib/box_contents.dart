import 'package:flutter/material.dart';
import 'constants.dart';


class BoxContent extends StatelessWidget {
  BoxContent({@required this.icon, this.text});

  final IconData icon;
  final String  text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 80, color: Color(0xFF8D8E98)),
        SizedBox(height: 10),
        Text(text, style: kDefaultTextStyle)
      ],
    );
  }
}

