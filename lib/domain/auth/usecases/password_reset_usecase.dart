import 'package:dartz/dartz.dart';
import 'package:ennatodo/core/usecases/usecase.dart'; 
import 'package:ennatodo/domain/auth/repository/auth.dart';
import 'package:ennatodo/service_locator.dart';

class PasswordResetUsecase implements UseCase<Either, String> {
  @override
  Future<Either<dynamic, dynamic>> call({String? params}) async {
    return await sl<AuthRepository>().sendPasswordResetEmail(params!);
  }
}