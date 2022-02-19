import 'dart:convert';

class Utils {
  static List<T> toList<T>(String? value, T f(Map<String, dynamic> map)) {
    var list = _formatJson(value);
    if (null == list) return <T>[];
    return (list as List).map((e) => f(e)).toList();
  }

  static T toObj<T>(String value, T f(Map<String, dynamic> map)) =>
      f(_formatJson(value));

  static List<dynamic> toListMap(String? value) => _formatJson(value) ?? [];

  static dynamic _formatJson(String? value) {
    if (null == value) return null;
    return jsonDecode(_printValue(value));
  }

  static String _printValue(value) {
    return value;
  }

  static String checkOperationID(String? obj) {
    return obj ?? DateTime.now().millisecondsSinceEpoch.toString();
  }
}
