import 'package:hive/hive.dart';
part 'fav_model.g.dart';

@HiveType(typeId: 1)
class FavModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String img;

  FavModel({required this.id, required this.name, required this.img});
}
