import 'package:bloc/bloc.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class CounterCubit extends Cubit<double> {
  /// {@macro counter_cubit}
  CounterCubit() : super(450.50);

  /// Add 1 to the current state.
  void resetcounter() => emit(450.50);

  /// Subtract 1 from the current state.
  void decrement(double submittedAmount) => emit(submittedAmount - state);
}
