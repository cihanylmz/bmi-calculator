import 'package:flutter/material.dart';
import 'constants.dart';
import 'default_box.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR')
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Your Result',
            style: kDefaultNumStyle,
          ),
          Expanded(
            child: DefaultBox(
              color: kInactiveBoxColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Normal'),
                  Text('22.5', style: kDefaultNumStyle,)
                ],
              ),

            ),
          )
        ],
      )
    );
  }
}
