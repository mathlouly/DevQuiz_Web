import 'package:bloc/bloc.dart';

class AddQuizCubit extends Cubit<int> {
  AddQuizCubit() : super(0);

  void increment() => emit(state + 1);
}
