import 'package:dartz/dartz.dart';
import 'package:ennatodo/data/auth/models/user.dart';
import 'package:ennatodo/data/auth/models/user_creation_req.dart';
import 'package:ennatodo/data/auth/models/user_signin_req.dart';
import 'package:ennatodo/data/auth/source/auth_firebase_service.dart';
import 'package:ennatodo/domain/auth/repository/auth.dart';
import 'package:ennatodo/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReq user) async {
    // call signup da source -> auth_firebase_service.dart

    return await sl<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either<dynamic, dynamic>> signin(UserSigninReq user) async {
    return await sl<AuthFirebaseService>().signin(user);
  }

  @override
  Future<Either<dynamic, dynamic>> sendPasswordResetEmail(String email) async {
    return await sl<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    var user = await sl<AuthFirebaseService>().getUser();

    return user.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(UserModel.fromMap(data).toEntity());
      },
    );
  }
}
