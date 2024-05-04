import 'package:bloc/bloc.dart';
import 'package:blocflutter/bloc/switch_example/bloc/switch_event.dart';
import 'package:blocflutter/bloc/switch_example/bloc/switch_state.dart';
import 'package:equatable/equatable.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchStates> {
  SwitchBloc() : super(SwitchStates()) {
    on<EnableorDisableNotification>(_enableOrDisableNotification);
     on<SliderEvent>(_slider);
  }

  void _enableOrDisableNotification(
      EnableorDisableNotification events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(
      SliderEvent events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(slider: events.slider));
  }
}
