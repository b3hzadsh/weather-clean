import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_temp_state.dart';

const generalFailureMessage = 'Ups, something gone wrong. Please try again!';
const serverFailureMessage = 'Ups, API Error. please try again!';
const cacheFailureMessage = 'Ups, chache failed. Please try again!';

class GetTempCubit extends Cubit<GetTempState> {
  GetTempCubit() : super(GetTempInitial());

  void adviceRequested() async {
    
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(const ShowTempState(25));
  }
}
