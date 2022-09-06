abstract class BaseAuthRepository {
  Future<Map<String, dynamic>> signIn({
    required String username,
    required String password,
  });
}
