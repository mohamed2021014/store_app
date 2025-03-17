import 'package:hive/hive.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 0)
class CartItem extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  int quantity;

  @HiveField(2)
  final double price;
  @HiveField(3)
  final String img;

  CartItem({
    required this.img,
    required this.name,
    required this.quantity,
    required this.price,
  });
}
