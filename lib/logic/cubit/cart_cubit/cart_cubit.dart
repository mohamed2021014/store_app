import 'package:ecommerce_app/core/constant/strings.dart';
import 'package:ecommerce_app/model/cart_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final Box<CartItem> cartBox = Hive.box(Strings.cartbox);

  CartCubit() : super(CartInitial()) {
    _update();
  }

  void addToCart(CartItem items) {
    try {
      bool itemexites = false;
      for (var item in cartBox.values) {
        if (item.name == items.name) {
          item.quantity += items.quantity;
          item.save();
          itemexites = true;
          break;
        }
      }
      if (!itemexites) {
        cartBox.add(items);
      }
      _update();
    } catch (ex) {
      emit(ErrorCartState(messige: "$ex"));
    }
  }

  void removeFromCart(int index) {
    cartBox.deleteAt(index);
    _update();
  }

  _update() {
    final cartitem = cartBox.values.toList();
    final totil = total(cartitem);
    emit(SucessCartState(cartitem: cartBox.values.toList(), totil));
  }

  List<CartItem> fatchDataCart() {
    return cartBox.values.toList();
  }

  double total(List<CartItem> items) {
    double total = 0.0;
    for (var item in items) {
      total += item.price * item.quantity;
    }

    return total;
  }

  void incrementQuantity(int index) {
    final item = cartBox.getAt(index);
    if (item != null) {
      item.quantity++;
      cartBox.putAt(index, item);
      _update();
    }
  }

  void decrementQuantity(int index) {
    final item = cartBox.getAt(index);
    if (item != null && item.quantity > 1) {
      item.quantity--;
      cartBox.putAt(index, item);
      _update();
    }
  }
}
