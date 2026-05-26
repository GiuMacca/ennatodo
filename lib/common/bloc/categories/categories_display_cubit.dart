import 'package:ennatodo/common/bloc/categories/categories_display_state.dart';
import 'package:ennatodo/domain/category/usecases/get_categories.dart';
import 'package:ennatodo/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesLoading());

  void displayCategories() async {
    var returnedData = await sl<GetCategoriesUsecase>().call();

    returnedData.fold(
      (error) {
        emit(CategoriesLoadFailure());
      },
      (data) {
        emit(CategoriesLoaded(categories: data));
      },
    );
  }
}
