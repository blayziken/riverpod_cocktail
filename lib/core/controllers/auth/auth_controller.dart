import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/status.dart';
import '../../repositories/auth/auth_repository.dart';
import '../login_states.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this._ref) : super(LoginStateInitial());
  final Ref _ref;

  void signIn(String username, String password) async {
    print('Login Controller');
    state = LoginStateLoading();

    try {
      final result = await _ref.read(authRepositoryProvider).signIn(username: username, password: password);

      if (result is Success) {
        print('SUCCESS HERE! LOGIN CONTROLLER');
        state = LoginStateSuccess();
        //  routes.go('/login');
      } else {
        print('ERROR HERE! LOGIN CONTROLLER');
        state = LoginStateFailed();
      }
    } catch (err) {
      print(err);
      print('CATCH ERROR HERE! LOGIN CONTROLLER');
      state = LoginStateError(err.toString());
    }
  }

  void signOut() {
    print('here');
    state = SignOutClicked();
  }
}

final loginControllerProvider = StateNotifierProvider<LoginController, LoginState>(
  (ref) => LoginController(ref),
);
