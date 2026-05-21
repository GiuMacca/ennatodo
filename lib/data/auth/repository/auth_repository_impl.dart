import 'package:dartz/dartz.dart';
import 'package:ennatodo/data/auth/models/user_creation_req.dart';
import 'package:ennatodo/data/auth/source/auth_firebase_service.dart';
import 'package:ennatodo/domain/auth/repository/auth.dart';
import 'package:ennatodo/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReq user) async {
    // call signup da source -> auth_firebase_service.dart

    return await sl<AuthFirebaseService>().signup(user);
  }
}
