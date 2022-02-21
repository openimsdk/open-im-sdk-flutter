import 'dart:convert';

class Utils {
  static List<T> toList<T>(String value, T f(Map<String, dynamic> map)) =>
      (_formatJson(value) as List).map((e) => f(e)).toList();

  static T toObj<T>(String value, T f(Map<String, dynamic> map)) =>
      f(_formatJson(value));

  static List<dynamic> toListMap(String value) => _formatJson(value);

  static dynamic _formatJson(String value) => jsonDecode(value);

  static String checkOperationID(String? obj) =>
      obj ?? DateTime.now().millisecondsSinceEpoch.toString();
}
