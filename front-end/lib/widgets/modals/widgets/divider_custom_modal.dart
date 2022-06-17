import 'package:flutter/material.dart';
import 'package:front_end/colors/colors.dart';

class DividerCustomModal extends StatelessWidget {
  const DividerCustomModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: ColorsApp.dividerModel,
      thickness: 1.0,
      height: 1.0,
    );
  }
}
