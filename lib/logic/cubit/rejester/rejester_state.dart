part of 'rejester_cubit.dart';

@immutable
sealed class RejesterState {}

final class RejesterInitial extends RejesterState {}

final class RejesterLOding extends RejesterState {}

final class Rejestersucess extends RejesterState {}

final class EmailVerifii extends RejesterState {
  EmailVerifii();
}

final class RejesterIError extends RejesterState {
  final String messige;

  RejesterIError({required this.messige});
}
