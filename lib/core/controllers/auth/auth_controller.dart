import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/auth/auth_repository.dart';
import '../login_states.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this._ref) : super(LoginStateInitial());
  final Ref _ref;

  void signIn(String username, String password) async {
    state = LoginStateLoading();

    try {
      await _ref.read(authRepositoryProvider).signIn(username: username, password: password);
      state = LoginStateSuccess();
    } catch (err) {
      state = LoginStateError(err.toString());
    }
  }
}

final loginControllerProvider = StateNotifierProvider<LoginController, LoginState>(
  (ref) => LoginController(ref),
);
