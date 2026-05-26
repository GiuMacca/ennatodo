import 'package:dartz/dartz.dart';
import 'package:ennatodo/core/usecases/usecase.dart';
import 'package:ennatodo/domain/auth/repository/auth.dart';
import 'package:ennatodo/service_locator.dart';

class GetUserUsecase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<AuthRepository>().getUser();
  }
}
