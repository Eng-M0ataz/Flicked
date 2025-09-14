import 'package:flickd/features/home/domin/entity/movie_entity.dart';
import 'package:hive/hive.dart';

void saveDataLocally({
  required String boxName,
  required List<MovieEntity> data,
}) async {
  var box = Hive.box<MovieEntity>(boxName);
  await box.addAll(data);
}
