import 'package:xpersonaa/features/auth/domain/entities/app_user.dart';

abstract class AuthState {}

class AuthLoading extends AuthState{}

class AuthInitial extends AuthState{}

class Authenticated extends AuthState{
  final AppUser user;
  Authenticated(this.user);
}

class UnAuthenticated extends AuthState{}

class AuthError extends AuthState{
  final String message;
  AuthError(this.message);
}