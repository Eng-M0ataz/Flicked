import 'package:flickd/core/get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Stroge {
  static final storge = getIt.get<FlutterSecureStorage>();
  static Future<void> write({
    required String key,
    required String value,
  }) async {
    return await storge.write(
      key: key,
      value: value,
    );
  }

  static Future<String> read({
    required String key,
  }) async {
    return await storge.read(key: key) ?? '';
  }

  static Future<void> delete({
    required String key,
  }) async {
    await storge.delete(key: key);
  }
}
