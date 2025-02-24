import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterInitial extends CounterState {
  @override
  List<Object> get props => [];
}

class CounterValue extends CounterState {
  final int counter;

  const CounterValue(this.counter);

  @override
  List<Object> get props => [counter];
}