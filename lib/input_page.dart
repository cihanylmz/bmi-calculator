import 'results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'default_box.dart';
import 'box_contents.dart';
import 'constants.dart';

enum Genders { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genders gender;
  int height = 180;
  int weight = 60;
  int age = 18;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
          Widget>[
        Expanded(
          child: Row(children: <Widget>[
            Expanded(
              //flex: 2,

              child: DefaultBox(
                  color: gender == Genders.male
                      ? kActiveBoxColor
                      : kInactiveBoxColor,
                  cardChild: BoxContent(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                  ),
                  onPress: () {
                    setState(() {
                      gender = Genders.male;
                    });
                  }),
            ),
            Expanded(
              //flex: 2,

              child: DefaultBox(
                  color: gender == Genders.female
                      ? kActiveBoxColor
                      : kInactiveBoxColor,
                  cardChild: BoxContent(
                    icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                  ),
                  onPress: () {
                    setState(() {
                      gender = Genders.female;
                    });
                  }),
            ),
          ]),
        ),
        Expanded(
          //flex: 2,
          child: DefaultBox(
            color: kActiveBoxColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('ABC', style: kDefaultTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kDefaultNumStyle,
                    ),
                    Text(
                      'cm',
                      style: kDefaultTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      thumbColor: Color(0xFFEB1555),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      overlayColor: Color(0x29EB1555)),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newvalue) {
                      setState(() {
                        height = newvalue.round();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          //flex: 2,
          child: Row(
            children: <Widget>[
              Expanded(
                //flex: 2,
                child: DefaultBox(
                  color: kActiveBoxColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kDefaultTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kDefaultNumStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              change: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                          RoundActionButton(
                              icon: FontAwesomeIcons.minus,
                              change: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                //flex: 2,
                child: DefaultBox(
                  color: kActiveBoxColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kDefaultTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kDefaultNumStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              change: () {
                                setState(() {
                                  age++;
                                });
                              }),
                          RoundActionButton(
                              icon: FontAwesomeIcons.minus,
                              change: () {
                                setState(() {
                                  age--;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ResultsPage()));
          },
          child: Container(
            child: Center(child: (Text('CALCULATE', style: kLargeButtonTextStyle,))),
            color: kBottomBoxColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        )
      ]),
    );
  }
}

class RoundActionButton extends StatelessWidget {
  RoundActionButton({this.icon, this.change});
  final icon;
  final Function change;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      onPressed: change,
      elevation: 6,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
