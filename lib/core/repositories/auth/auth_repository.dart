import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_cocktail/core/repositories/auth/base_auth_repository.dart';
import 'package:riverpod_cocktail/services/endpoints.dart';
import '../../../pages/home.dart';
import '../../../services/network_handler.dart';
import '../../../services/status.dart';

final dioProvider = Provider<Dio>((ref) => Dio());
final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository(ref.read));

class AuthRepository {
  final Reader _read;

  AuthRepository(this._read);

  Future<dynamic> signIn({required String username, required String password}) async {
    final _body = {'username': username, 'password': password};

    final _url = APP_URLS(_read(domainProvider)).LoginUrl();
    print(_url);

    final response = await DioService.instance!.post(endpoint: _url, body: _body);

    return response;
  }

  void signUp() {}
}
