import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_cocktail/pages/home.dart';

// final appEndpointsProvider = StateProvider<String>((_) => '');

class APP_URLS {
  final String domain;
  APP_URLS(this.domain);

  String LoginUrl() {
    // String domain = ref.read(domainProvider);
    return 'https://$domain/api/auth/login';
  }
}
