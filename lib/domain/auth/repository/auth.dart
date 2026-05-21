import 'package:dartz/dartz.dart';
import 'package:ennatodo/data/auth/models/user_creation_req.dart';

abstract class AuthRepository {

  // Either error handling
  Future<Either> signup(UserCreationReq user);
}
