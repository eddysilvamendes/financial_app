// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';

part 'add_categories.g.dart';

@HiveType(typeId: 2)
class Add_Categories extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String imgPath;
  Add_Categories(
    this.name,
    this.imgPath,
  );
}
