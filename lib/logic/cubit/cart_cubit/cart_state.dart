part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class LodingcartState extends CartState {}

final class SucessCartState extends CartState {
  final List<CartItem> cartitem;
  final double total;

  SucessCartState(this.total, {required this.cartitem});
}

final class ErrorCartState extends CartState {
  final String messige;

  ErrorCartState({required this.messige});
}
