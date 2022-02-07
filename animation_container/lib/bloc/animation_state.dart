part of 'animation_bloc.dart';

@immutable
abstract class AnimationState {}

class AnimationInitial extends AnimationState {
  int height;
  int width;
  int radius;
  Color color;
  AnimationInitial(
      {required this.height,
      required this.width,
      required this.radius,
      required this.color});
}
