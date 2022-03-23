import 'package:dash_kit_core/dash_kit_core.dart';
import 'package:dbp_flutter_course/app/app_state.dart';
import 'package:dbp_flutter_course/core/app_store_connector.dart';
import 'package:flutter/material.dart';

class ConnectedLoadable extends StatelessWidget {
  const ConnectedLoadable({
    required this.child,
    required this.converter,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final bool Function(AppState) converter;

  @override
  Widget build(BuildContext context) {
    return AppStateConnector<bool>(
      converter: converter,
      builder: (context, isLoading) => LoadableView(
        isLoading: isLoading,
        child: child,
      ),
    );
  }
}
