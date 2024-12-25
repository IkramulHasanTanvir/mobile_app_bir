import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {super.key, this.appBar, required this.body, this.bottomNavigationBar});

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      top: false,
      child: Scaffold(
          appBar: appBar,
          body: Stack(
            children: [
              SizedBox(
                height: size.height,
                width: size.width,
                child: body,
              ),
              if (bottomNavigationBar != null)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(child: bottomNavigationBar!),
                ),
            ],
          )),
    );
  }
}
