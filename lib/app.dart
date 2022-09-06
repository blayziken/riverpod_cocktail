import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/providers/router_provider.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: Size(375, 726),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: ((context, child) {
        final router = ref.watch(routerProvider);
        return MaterialApp.router(
          title: 'Flutter Cocktail',
          theme: ThemeData(primarySwatch: Colors.blue),
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
        );
      }),
    );
  }
}
