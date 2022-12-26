part of 'bloc.dart';


enum CalculationStatus { initial, success, failure }

extension CalculationStatusX on CalculationStatus {
  bool get isInitial => this == CalculationStatus.initial;
  bool get isSuccess => this == CalculationStatus.success;
  bool get isFailure => this == CalculationStatus.failure;
}

class CalculationState extends Equatable {
  final CalculationStatus status;
  final List<Habit> habits;
  final double finalCost;

  const CalculationState(
      {this.status = CalculationStatus.initial,
      this.habits = const [],
      this.finalCost = 0.0});

  @override
  List<Object?> get props => [status, habits, finalCost];

  CalculationState copyWith(
      {CalculationStatus? status, List<Habit>? habits, double? finalCost}) {
    return CalculationState(
        status: status ?? this.status,
        habits: habits ?? this.habits,
        finalCost: finalCost ?? this.finalCost);
  }
}
