import 'package:dartz/dartz.dart';

abstract class DestinationFirebaseService {
  
  Future<Either> getTopFavorites();
}


class DestinationFirebaseServiceImpl extends DestinationFirebaseService{
  
  @override
  Future<Either<dynamic, dynamic>> getTopFavorites() {
    // TODO: implement getTopFavorites
    throw UnimplementedError();
  }

}