import 'package:flutter/material.dart';

class FooterModal extends StatefulWidget {
  const FooterModal({
    Key? key,
    required this.children,
    this.spacing,
  }) : super(key: key);

  final List<Widget> children;
  final double? spacing;

  @override
  State<FooterModal> createState() => _FooterModalState();
}

class _FooterModalState extends State<FooterModal> {
  var newChildren = <Widget>[];

  @override
  void initState() {
    super.initState();
    formatChildren();
  }

  void formatChildren() {
    newChildren = <Widget>[];
    for (var i = 0; i < widget.children.length; i++) {
      if (i == 0) {
        newChildren.add(widget.children[i]);
      } else {
        newChildren.add(
          SizedBox(
            width: widget.spacing,
          ),
        );
        newChildren.add(widget.children[i]);
      }
    }
    setState(() {
      newChildren = newChildren;
    });
  }

  @override
  Widget build(BuildContext context) {
    var i = 0;
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: newChildren,
      ),
    );
  }
}
