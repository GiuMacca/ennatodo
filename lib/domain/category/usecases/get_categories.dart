import 'package:dartz/dartz.dart';
import 'package:ennatodo/core/usecases/usecase.dart';
import 'package:ennatodo/domain/category/repository/category.dart';
import 'package:ennatodo/service_locator.dart';

class GetCategoriesUsecase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<CategoryRepository>().getCategories();
  }
}