import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './blocs/counter_bloc.dart';
import 'events/counter_event.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = context.bloc<CounterBloc>();

    return Scaffold(
      body: SafeArea(child: BlocBuilder<CounterBloc, int>(
        builder: (context, counter) {
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
                    '$counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                FittedBox(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          counterBloc.add(CounterEvent.increment);
                        },
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
                        onTap: () {
                          counterBloc.add(CounterEvent.decrement);
                        },
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
        },
      )),
    );
  }
}
