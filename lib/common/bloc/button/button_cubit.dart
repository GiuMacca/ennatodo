import 'package:dartz/dartz.dart';
import 'package:ennatodo/common/bloc/button/button_state.dart';
import 'package:ennatodo/core/usecases/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params, required UseCase usecase}) async {
    emit(ButtonLoadingState());
    try {
      Either returnedData = await usecase.call(params: params);

      returnedData.fold(
        (error) {
          emit(ButtonFailureState(
            errorMessage: error
          ));
        },
        (data) {
          emit(ButtonSuccessState());
        },
      );
    } catch (e) {
      emit(ButtonFailureState(
        errorMessage: e.toString()
      ));
    }
  }
}
