import 'dart:convert';

class Utils {
  /// Native SDK (core v3.8) inviteUserToGroup/kickGroupMember зэрэг дээр жагсаалтын оронд хоосон мөр
  /// (`""`) буцаадаг — тэр үед `as List` "type 'String' is not a subtype of type 'List<dynamic>'" шидэж,
  /// амжилттай үйлдлийг алдаа гэж харуулдаг байсан. Жагсаалт биш бол хоосон жагсаалт буцаана.
  static List<T> toList<T>(String value, T f(Map<String, dynamic> map)) {
    final decoded = value.isEmpty ? null : formatJson(value);
    if (decoded is! List) return <T>[];
    return decoded.map((e) => f(e)).toList();
  }

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
