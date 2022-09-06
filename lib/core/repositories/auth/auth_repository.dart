import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_cocktail/core/repositories/auth/base_auth_repository.dart';
import 'package:riverpod_cocktail/services/endpoints.dart';
import '../../../pages/home.dart';

final dioProvider = Provider<Dio>((ref) => Dio());
final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository(ref.read));

class AuthRepository extends BaseAuthRepository {
  final Reader _read;

  AuthRepository(this._read);

  @override
  Future<Map<String, dynamic>> signIn({required String username, required String password}) async {
    try {
      final _body = {
        'username': username,
        'password': password,
      };

      final _url = APP_URLS(_read(domainProvider)).LoginUrl();

      print('URL: $_url');

      final response = await _read(dioProvider).post(_url, data: _body);

      print(response);

      if (response.statusCode == 200) {
        return response.data;
      }

      return {};
    } on DioError catch (err) {
      print(err);
      // throw err;
      return {};
    } on SocketException catch (err) {
      print(err);
      // throw err;
      return {};
    }
  }

  void signUp() {}

  void signOut() {}
}
