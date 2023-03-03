import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackint/domain/auth/datasource/auth_datasource.dart';
import 'package:hackint/domain/core/errors/failures.dart';
import 'package:hackint/flows/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/sign_in.dart';

@Injectable(as: AuthRepositoryI)
class AuthRepositoryImpl implements AuthRepositoryI {
  final AuthDataSourceI remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserCredential>> signIn(SignInParams params) async {
    try {
      final result = await remoteDataSource.signIn(
        params.email,
        params.password,
      );
      return Right(result);
    } on ServerFailure catch (exception) {
      return Left(
        ServerFailure(message: 'Something went wrong: ${exception.message}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final result = await remoteDataSource.signOut();
      return Right(result);
    } on Failure catch (exception) {
      return Left(exception);
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signUp(SignInParams params) async {
    try {
      final result = await remoteDataSource.signUp(
        params.email,
        params.password,
      );
      return Right(result);
    } on ServerFailure catch (exception) {
      return Left(
        ServerFailure(message: 'Something went wrong: ${exception.message}'),
      );
    }
  }
}
