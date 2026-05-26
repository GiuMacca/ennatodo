import 'package:dartz/dartz.dart';

abstract class DestinationRepository {
  
  Future<Either> getTopFavorites();
}
