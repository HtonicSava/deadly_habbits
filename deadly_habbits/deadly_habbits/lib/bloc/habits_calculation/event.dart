part of 'bloc.dart';

abstract class HabitEvent extends Equatable{
 const HabitEvent();
}

class HabitAdded extends HabitEvent {
  final Habit habit;
  const HabitAdded({required this.habit});

  @override
  List<Object?> get props => [habit];
}

class HabitCalculationsRequired extends HabitEvent {
  const HabitCalculationsRequired();

  @override
  List<Object?> get props => [];
}