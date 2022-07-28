import 'dart:async';

import 'package:discover_the_universe/bloc/timer/timer_event.dart';
import 'package:discover_the_universe/bloc/timer/timer_state.dart';
import 'package:intl/intl.dart';

class TimerBloc {
  var state = TimerState('');

  final eventController = StreamController<TimerEvent>();

  final stateController = StreamController<TimerState>();

  TimerBloc() {
    eventController.stream.listen((event) {
      if(event is TurnOnEvent) {
          var now = new DateTime.now();
          var formatter = new DateFormat('yyyy/MM/dd - HH:mm:ss');
          String formattedDate = formatter.format(now);
          state = TimerState(formattedDate);
      } else if(event is TurnOffEvent) {
        state = TimerState('');
      }

      stateController.sink.add(state);
    });
  }

  void dispose() {
    stateController.close();
    eventController.close();
  }
}