import 'package:dartz/dartz.dart';
import 'package:ennatodo/core/usecases/usecase.dart'; 
import 'package:ennatodo/data/auth/models/user_signin_req.dart';
import 'package:ennatodo/domain/auth/repository/auth.dart';
import 'package:ennatodo/service_locator.dart';

class SigninUsecase implements UseCase<Either, UserSigninReq> {
  @override
  Future<Either<dynamic, dynamic>> call({UserSigninReq? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
