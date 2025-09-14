import 'package:flickd/core/services/secure_storge.dart';
import 'package:flickd/core/utils/constants/api_endpoints.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> storeCredentials() async {
  await Stroge.write(
    key: Api.accessTokenKey,
    value: dotenv.env[Api.accessTokenKey]!,
  );
  await Stroge.write(
    key: Api.baseUrlKey,
    value: dotenv.env[Api.baseUrlKey]!,
  );
  await Stroge.write(
    key: Api.baseImageUrlKey,
    value: dotenv.env[Api.baseImageUrlKey]!,
  );
}
