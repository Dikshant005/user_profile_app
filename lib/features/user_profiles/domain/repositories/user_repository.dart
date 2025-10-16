import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsers();
  Future<Either<Failure, List<User>>> getUsersByCountry(String country);
  Future<Either<Failure, void>> toggleUserLike(String userId);
}