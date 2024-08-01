import 'package:objectbox/objectbox.dart';

@Entity()
class Product {
  @Id()
  int id = 0;

  late String code;
  late String name;
  late int buyPrice;
  late int sellPrice;
  late int stock;
}

@Entity()
class Client {
  @Id()
  int id = 0;

  late String phone;
  late String name;
  late String address;
  late String hood;
}

@Entity()
class Bill {
  @Id()
  int id = 0;

  late List<int> products;

  @Property(type: PropertyType.date)
  late DateTime date;

  final client = ToOne<Client>();
}
