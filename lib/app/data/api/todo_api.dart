part of api;

class TodoApi {
  static Future<Map<String, dynamic>> getTodo() async {
    // return dio.get(baseUrl('todo'));
    Response response = await dio.get(baseUrl('todo'));
    return response.data ?? {};
  }
}
