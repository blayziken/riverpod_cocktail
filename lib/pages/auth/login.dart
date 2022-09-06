import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_cocktail/pages/auth/widgets/fields.dart';
import '../../core/controllers/auth/auth_controller.dart';
import '../../core/repositories/auth/auth_repository.dart';
import '../../utils/components/buttons.dart';
import '../../utils/text_style.dart';

TextEditingController _usernameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

// final loginProvider = FutureProvider.autoDispose<Map<String, dynamic>>(
//   (ref) => ref.read(authRepositoryProvider).signIn(
//         username: _usernameController.text,
//         password: _passwordController.text,
//       ),
// );

class EntryPage extends ConsumerWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final login = ref.watch(loginProvider);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: Container(
        color: Colors.black45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildUsername(_usernameController),
            buildUsername(_passwordController),
            CustomTextButton(
              child: BOLDTEXT(text: 'LOGIN', color: Colors.white),
              onPressed: () {
                ref.read(loginControllerProvider.notifier).signIn(
                      _usernameController.text,
                      _passwordController.text,
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Accepted extends ConsumerWidget {
  const Accepted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple),
      body: Container(
          width: double.infinity,
          color: Colors.brown,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButton(
                child: BOLDTEXT(text: 'Log Out', color: Colors.white),
                onPressed: () {
                  ref.read(loginControllerProvider.notifier).signOut();
                },
              ),
            ],
          )),
    );
  }
}
