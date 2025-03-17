part of 'fatch_data_bloc.dart';

@immutable
sealed class FatchDataState {}

final class LoidingState extends FatchDataState {}

final class LoadedState extends FatchDataState {
  final List<PrudctModel> prudictList;

  LoadedState({required this.prudictList});
}

final class ErrorState extends FatchDataState {
  final String messige;

  ErrorState({required this.messige});
}
