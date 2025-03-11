part of 'app_cubit_cubit.dart';

@immutable
sealed class AppCubitState {}

final class AppCubitInitial extends AppCubitState {}

final class Themlitemode extends AppCubitState {}

final class ThemDarkMode extends AppCubitState {}
