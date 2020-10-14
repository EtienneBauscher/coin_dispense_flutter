import 'package:bloc/bloc.dart';


class CounterCubit extends Cubit<double> {
 
  CounterCubit() : super(450.50);

 
  void resetcounter() => emit(450.50);

 
  void decrement(double submittedAmount) => emit(submittedAmount - state);
}
