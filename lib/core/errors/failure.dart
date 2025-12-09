import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with API server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');
      case DioExceptionType.unknown:
        return ServerFailure('Opps there was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(
        'Your request was not found, please try again later',
      );
    } else if (statusCode >= 500) {
      return ServerFailure(
        'There is a problem with the server, please try again later',
      );
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('There was an error, please try again later');
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.message);

  factory FirebaseFailure.fromFirebaseAuth(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return FirebaseFailure('The email address is already in use.');
      case 'invalid-email':
        return FirebaseFailure('Invalid email address.');
      case 'weak-password':
        return FirebaseFailure('Weak password.');
      case 'wrong-password':
        return FirebaseFailure('Incorrect password.');
      case 'user-disabled':
        return FirebaseFailure('User account has been disabled.');
      case 'user-not-found':
        return FirebaseFailure('User not found.');
      default:
        return FirebaseFailure('Authentication error: ${e.message ?? e.code}');
    }
  }

  factory FirebaseFailure.fromFirebase(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return FirebaseFailure(
          'You do not have permission to access this resource.',
        );
      case 'unavailable':
        return FirebaseFailure('The service is currently unavailable.');
      case 'not-found':
        return FirebaseFailure('Data not found.');
      case 'already-exists':
        return FirebaseFailure('Data already exists.');
      case 'resource-exhausted':
        return FirebaseFailure('Resource limit exceeded.');
      case 'failed-precondition':
        return FirebaseFailure('Failed precondition.');
      case 'aborted':
        return FirebaseFailure('Operation aborted.');
      case 'out-of-range':
        return FirebaseFailure('Value out of allowed range.');
      case 'unimplemented':
        return FirebaseFailure('Operation not supported.');
      case 'internal':
        return FirebaseFailure('Internal server error.');
      case 'data-loss':
        return FirebaseFailure('Data loss occurred.');
      case 'unauthenticated':
        return FirebaseFailure('You must be signed in first.');
      default:
        return FirebaseFailure('Error: ${e.message ?? e.code}');
    }
  }
}
