import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementCounter>((event, emit) {
      if (state is CounterInitial) {
        emit(CounterValue(1));
      } else if (state is CounterValue) {
        final currentState = state as CounterValue;
        emit(CounterValue(currentState.counter + 1));
      }
    });
  }
}