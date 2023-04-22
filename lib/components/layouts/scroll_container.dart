import 'package:flutter/material.dart';

class ScrollContainer extends StatelessWidget {
  const ScrollContainer({
    Key? key,
    required this.child,
    this.onRefresh,
  }) : super(key: key);

  final Future<void> Function()? onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => RefreshIndicator(
        onRefresh: onRefresh ?? () async {},
        child: SingleChildScrollView(
          physics:
              onRefresh != null ? const AlwaysScrollableScrollPhysics() : null,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
