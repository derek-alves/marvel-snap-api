import 'dart:io';
import '../../utils/utils.dart';

class CustomEnv {
  static final Map<String, String> _env = {};
  static String _file = '.env';

  CustomEnv._();

  factory CustomEnv.fromFile(String file) {
    _file = file;
    return CustomEnv._();
  }

  static Future<T> get<T>({required String key}) async {
    if (_env.isEmpty) await _makeEnv();
    return _env[key]!.toType(T);
  }

  static Future _makeEnv() async {
    List<String> linhas =
        (await _readFile()).replaceAll(String.fromCharCode(13), '').split("\n")
          ..removeWhere(
            (element) => element.isEmpty,
          );

    for (String linha in linhas) {
      int idx = linha.indexOf("=");
      List parts = [
        linha.substring(0, idx).trim(),
        linha.substring(idx + 1).trim()
      ];
      _env.addAll({parts[0]: parts[1]});
    }
  }

  static Future<String> _readFile() async {
    return await File(_file).readAsString();
  }
}
