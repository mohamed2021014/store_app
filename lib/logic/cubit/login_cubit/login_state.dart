part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLodingState extends LoginState {}

final class LoginSucsessState extends LoginState {}

final class LoginErrorState extends LoginState {
  final String messige;
  LoginErrorState({required this.messige});
}

final class ObscurText extends LoginState {
  final bool isselected;
  ObscurText({required this.isselected});
}
