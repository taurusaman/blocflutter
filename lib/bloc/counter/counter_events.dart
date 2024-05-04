//abstract class acts  as a base class  and it  helps to implements its funnctionality to it's sub classes
//it defines interface or behaviour which will be used by sub classes

import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
  @override
  List<Object> get props => [];
}



class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent{}
