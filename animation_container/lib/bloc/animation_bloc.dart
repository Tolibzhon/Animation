import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'animation_event.dart';
part 'animation_state.dart';

class AnimationBloc extends Bloc<AnimationEvent, AnimationState> {
  AnimationBloc()
      : super(AnimationInitial(
            height: 20, width: 20, radius: 20, color: Colors.amber)) {
    on<ChangeEvent>(
      (event, emit) => emit(
        AnimationInitial(
            height: Random().nextInt(300),
            width: Random().nextInt(300),
            radius: Random().nextInt(50),
            color: Color(Random().nextInt(0xffffffff))),
      ),
    );
  }
}
