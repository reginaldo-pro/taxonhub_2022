import 'package:flutter/material.dart';
import 'package:front_end/colors/colors.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsTheme.backgroundColor,
        image: DecorationImage(
          image: AssetImage('image.png'),
          colorFilter: ColorFilter.mode(
            ColorsTheme.backgroundColor,
            BlendMode.dstOut,
          ),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
      child: child,
    );
  }
}
