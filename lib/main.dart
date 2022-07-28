import 'dart:async';

import 'package:discover_the_universe/bloc/timer/timer_bloc.dart';
import 'package:discover_the_universe/bloc/timer/timer_event.dart';
import 'package:discover_the_universe/bloc/timer/timer_state.dart';
import 'package:flutter/material.dart';

import 'screens/intro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bloc = TimerBloc();
  Timer _timer = Timer(Duration(seconds: 0),() => {});
  void _turnOnTime() {
    if(!_timer.isActive) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) => {
        bloc.eventController.sink.add(TurnOnEvent())
      });
    }
  }

  void _turnOffTime() {
    if(_timer.isActive) {
      _timer.cancel();
    }
    bloc.eventController.sink.add(TurnOffEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<TimerState>(
              stream: bloc.stateController.stream,
              initialData: bloc.state,
              builder: (BuildContext context, AsyncSnapshot<TimerState> snapshot) {
                return Text('${snapshot.data.time}');
              },
            ),
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => new IntroScreenDefault(title: "Intro Screen",)));
            },
            child: Text("Intro Screen"),)
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "turn_on",
            onPressed: _turnOnTime,
            tooltip: 'Turn On',
            child: Icon(Icons.timer),
          ),
          FloatingActionButton(
            heroTag: "turn_off",
            onPressed: _turnOffTime,
            tooltip: 'Turn Off',
            child: Icon(Icons.timer_off),
          ),
        ],
      ),
    );
  }
}
