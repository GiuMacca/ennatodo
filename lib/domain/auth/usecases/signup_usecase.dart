import 'package:dartz/dartz.dart';
import 'package:ennatodo/core/usecases/usecase.dart';
import 'package:ennatodo/data/auth/models/user_creation_req.dart';
import 'package:ennatodo/domain/auth/repository/auth.dart';
import 'package:ennatodo/service_locator.dart';

class SignupUsecase implements UseCase<Either, UserCreationReq> {
  @override
  Future<Either<dynamic, dynamic>> call({UserCreationReq? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
