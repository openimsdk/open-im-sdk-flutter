import 'dart:convert';

class Utils {
  static List<T> toList<T>(String value, T f(Map<String, dynamic> map)) =>
      (formatJson(value) as List).map((e) => f(e)).toList();

  static T toObj<T>(String value, T f(Map<String, dynamic> map)) => f(formatJson(value));

  static List<dynamic> toListMap(String value) => formatJson(value);

  static dynamic formatJson(String value) => jsonDecode(value);

  static String checkOperationID(String? obj) => obj ?? DateTime.now().millisecondsSinceEpoch.toString();

  static Map<String, dynamic> cleanMap(Map<String, dynamic> map) {
    map.removeWhere((key, value) {
      if (value is Map<String, dynamic>) {
        cleanMap(value);
      }
      return value == null;
    });
    return map;
  }
}
