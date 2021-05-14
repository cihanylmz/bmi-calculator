import 'package:flutter/material.dart';

class DefaultBox extends StatelessWidget {
  DefaultBox({@required this.color, this.cardChild, this.onPress });
  final Color color;
  final cardChild;
  final Function onPress;





  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
      ),
    );
  }
}

