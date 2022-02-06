import 'package:hive/hive.dart';


part 'model.g.dart';

@HiveType(typeId: 0)
class Model{
  @HiveField(0)
  bool? bomdod;
  @HiveField(1)
  bool? quyosh;
  @HiveField(2)
  bool? peshin;
  @HiveField(3)
  bool? asr;
  @HiveField(4)
  bool? shom;
  @HiveField(5)
  bool? hufton;

  Model({
    required this.bomdod,
    required this.quyosh,
    required this.peshin,
    required this.asr,
    required this.shom,
    required this.hufton,
  });
}