import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:riverpod_cocktail/services/status.dart';

// RETRIEVING TOKEN FROM STORAGE
// CAN'T I GET THIS WITH A PROVIDER? FROM LOGIN RESPONSE?
Future<Map<String, String>> _getHeaders() async {
  await Future.delayed(Duration(milliseconds: 100));
  // String? token = await storage.read(key: 'token');

  return {
    'Accept': 'application/json',
    'Content-type': 'application/json',
    // 'Authorization': 'Bearer $token',
    'jwt-auth': 'true',
  };
}

class DioService {
  static DioService? _instance;
  DioService._();

  static DioService? get instance {
    if (_instance == null) {
      _instance = DioService._();
    }
    return _instance;
  }

  // GET REQUEST
  Future<dynamic> get(String endpoint) async {
    final response = await Dio().get(
      endpoint,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'jwt-auth': 'true',
        },
      ),
    );
    return _response(response);
  }

  // POST REQUEST
  Future<dynamic> post({required String endpoint, required Map<String, dynamic> body}) async {
    final Map<String, String> _query = await _getHeaders();

    try {
      final response = await Dio().post(
        endpoint,
        data: body,
        options: Options(headers: _query),
      );

      return _response(response);
    } on DioError catch (err) {
      // print('DIO ERROR IN CATCH BLOCK: $err');
      return Failure(code: 900, errorResponse: {'message': err.toString()});
    } on SocketException catch (_) {
      return Failure(code: 900, errorResponse: {'message': 'No Internet Connection'});
    } on HttpException {
      return Failure(code: 900, errorResponse: {'message': 'Server Error'});
    }
  }
}

dynamic _response(Response response) async {
  switch (response.statusCode) {
    case 200:
      return Success(code: 200, data: response.data);
    case 201:
      return Success(code: 201, data: response.data);
    case 401:
      return Failure(code: response.statusCode, errorResponse: response.data);
    default:
      return Failure(code: response.statusCode, errorResponse: response.data);
  }
}
