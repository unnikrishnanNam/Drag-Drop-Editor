import 'package:drag_drop_editor/helper/widget_converter.dart';
import 'package:flutter/material.dart';

class DocColBox extends StatefulWidget {
  DocColBox({super.key, this.children = const []});
  List<Widget> children;

  @override
  State<DocColBox> createState() => _DocColBoxState();
}

class _DocColBoxState extends State<DocColBox> {
  List<Widget> _children = [];
  @override
  Widget build(BuildContext context) {
    return DragTarget<Enum>(
      onAccept: (data) => setState(() {
        _children.add(buildWidgetFromEnum(data));

        widget.children = _children;
      }),
      builder: (BuildContext context, List<Object?> candidateData,
          List<dynamic> rejectedData) {
        return Container(
          // height: 50,
          // width: 220,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: const Color(0xFFA3A7BA).withOpacity(0.05),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widget.children.isEmpty
                    ? [
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Center(
                            child: Text(
                              'Add Widgets Horizontally',
                              style: TextStyle(
                                  color:
                                      const Color(0xFFA3A7BA).withOpacity(0.8)),
                            ),
                          ),
                        ),
                      ]
                    : widget.children),
          ),
        );
      },
    );
  }
}
