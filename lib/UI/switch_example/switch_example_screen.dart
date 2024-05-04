import 'package:blocflutter/bloc/switch_example/bloc/switch_bloc.dart';
import 'package:blocflutter/bloc/switch_example/bloc/switch_event.dart';
import 'package:blocflutter/bloc/switch_example/bloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //SizedBox(height: 210,),
                Text('Notifications'),
                BlocBuilder<SwitchBloc, SwitchStates>(
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    print('Switch widget build');
                    return Switch(
                        value: state.isSwitch,
                        onChanged: (newValue) {
                          context
                              .read<SwitchBloc>()
                              .add(EnableorDisableNotification());
                        });
                  },
                )
              ],
            ),
            SizedBox(height: 10),
            BlocBuilder<SwitchBloc, SwitchStates>(
              buildWhen: (previous, current) =>
                  previous.slider != current.slider,
              builder: (context, state) {
                print('Slider');
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            BlocBuilder<SwitchBloc, SwitchStates>(
              builder: (context, state) {
                return Slider(
                    value: state.slider,
                    onChanged: (newValue) {
                      context
                          .read<SwitchBloc>()
                          .add(SliderEvent(slider: newValue));
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
