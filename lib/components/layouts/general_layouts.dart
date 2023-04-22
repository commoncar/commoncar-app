import 'package:commoncar_app/utils/constants.dart';
import 'package:flutter/material.dart';

class GeneralScaffold extends StatelessWidget {
  const GeneralScaffold({
    Key? key,
    required this.child,
    this.appBar,
    this.backgroundColor = Colors.white,
    this.bottomNavigationBar,
    this.padding = const EdgeInsets.all(lSize),
  }) : super(key: key);

  final Widget child;
  final Widget? appBar;
  final Widget? bottomNavigationBar;
  final Color backgroundColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (appBar != null) appBar!,
          Expanded(
            child: SafeArea(
              top: appBar != null ? false : true,
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
