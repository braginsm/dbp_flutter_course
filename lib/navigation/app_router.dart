import 'package:flutter/material.dart';

final AppRouter appRouter = AppRouter();

class AppRouter {
  Future<T?>? goTo<T extends Object?>({
    required BuildContext context,
    required Widget route,
  }) {
    return Navigator.push<T>(
      context,
      MaterialPageRoute(
        builder: (context) => route,
        settings: RouteSettings(
          name: route.runtimeType.toString(),
        ),
      ),
    );
  }

  void goBack(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}
