import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final bool show;
  final double? width;
  final double? height;
  final Widget? child;

  const CustomCircularProgressIndicator(
      {required this.show, this.width, this.height, this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indicator = show
        ? AbsorbPointer(
            child: SizedBox(
              width: width != null && width! > 0
                  ? width
                  : MediaQuery.of(context).size.width,
              height: height != null && height! > 0
                  ? height
                  : MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        : Container();

    return Stack(
      children: [child ?? Container(), indicator],
    );
  }
}
