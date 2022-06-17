import 'package:flutter/material.dart';
import 'package:front_end/colors/colors.dart';

class ButtonModal extends StatefulWidget {
  const ButtonModal({
    required this.title,
    this.color,
    this.iconData,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
    this.textColor = ColorsApp.textButtonModal,
    this.height = 36,
    Key? key,
  }) : super(key: key);

  final String title;
  final Color? color;
  final IconData? iconData;
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;
  final Color textColor;
  final double? height;

  @override
  State<ButtonModal> createState() => _ButtonModalState();
}

class _ButtonModalState extends State<ButtonModal> {
  late ButtonStyle style;

  @override
  void initState() {
    super.initState();
    style = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.iconData != null ? 2 : 5),
      ),
      primary: widget.color,
      padding: widget.padding,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: widget.iconData != null
          ? ElevatedButton.icon(
              onPressed: widget.onPressed,
              icon: Icon(
                widget.iconData,
                color: widget.textColor,
                size: 20,
              ),
              label: Text(
                widget.title,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: style,
            )
          : ElevatedButton(
              onPressed: widget.onPressed,
              style: style,
              child: Text(
                widget.title,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
    );
  }
}
