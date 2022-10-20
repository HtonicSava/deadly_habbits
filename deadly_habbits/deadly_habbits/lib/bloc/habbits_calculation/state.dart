part of 'bloc.dart';

enum CalculationStatus { initial, success, failure }

extension CalculationStatusX on CalculationStatus {
  bool get isInitial => this == CalculationStatus.initial;
  bool get isSuccess => this == CalculationStatus.success;
  bool get isFailure => this == CalculationStatus.failure;
}

class CalculationState extends Equatable {
  final CalculationStatus status;
  final List<Habbit> habbits;
  final double finalCost;

  const CalculationState(
      {this.status = CalculationStatus.initial,
      this.habbits = const [],
      this.finalCost = 0.0});

  @override
  List<Object?> get props => [status, habbits, finalCost];

  CalculationState copyWith(
      {CalculationStatus? status, List<Habbit>? habbits, double? finalCost}) {
    return CalculationState(
        status: status ?? this.status,
        habbits: habbits ?? this.habbits,
        finalCost: finalCost ?? this.finalCost);
  }
}
