import 'package:dartz/dartz.dart';
import 'package:ennatodo/data/category/models/category.dart';
import 'package:ennatodo/data/category/source/category_firebase_service.dart';
import 'package:ennatodo/domain/category/repository/category.dart';
import 'package:ennatodo/service_locator.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var categories = await sl<CategoryFirebaseService>().getCategories();

    return categories.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(CategoryModel.fromMap(data).toEntity());
      },
    );
  }
}
