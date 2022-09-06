import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../utils/components/buttons.dart';
import '../utils/text_style.dart';

final domainProvider = StateProvider<String>((_) => '');

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.greenAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextButton(
              child: BOLDTEXT(text: 'DEMO', color: Colors.white),
              onPressed: () {
                ref.read(domainProvider.state).state = 'demo.myskoolportal.com.ng';
              },
            ),
            CustomTextButton(
              child: BOLDTEXT(text: 'ABUJA', color: Colors.white),
              onPressed: () {
                ref.read(domainProvider.state).state = 'fgbcabuja.myskoolportal.com.ng';
              },
            ),
            CustomTextButton(
              child: BOLDTEXT(text: 'PRINT', color: Colors.white),
              onPressed: () {
                context.go('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
