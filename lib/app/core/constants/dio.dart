import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(
    headers: {'Accept': 'application/json', 'Content-type': 'application/json'},
    validateStatus: (status) => status! <= 598));
