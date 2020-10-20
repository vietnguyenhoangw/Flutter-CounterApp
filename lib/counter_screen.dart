import 'dart:ui';

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  CounterScreenState createState() => CounterScreenState();
}

class CounterScreenState extends State<CounterScreen> {
  int _value = 0;

  void increase() {
    setState(() {
      _value++;
    });
  }

  void decrease() {
    setState(() {
      _value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Press buttons to change the value',
            style: TextStyle(fontSize: 17),
          ),
          Container(
            margin: EdgeInsets.all(25),
            child: Text(
              _value.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          FittedBox(
            child: Row(
              children: [
                GestureDetector(
                  onTap: increase,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.blue.withOpacity(.5),
                      ),
                    ),
                    child: Text(
                      '+',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: decrease,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.blue.withOpacity(.5),
                      ),
                    ),
                    child: Text(
                      '-',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
