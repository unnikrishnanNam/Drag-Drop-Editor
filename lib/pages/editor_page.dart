import 'package:drag_drop_editor/helper/global_enums.dart';
import 'package:drag_drop_editor/helper/widget_converter.dart';
import 'package:drag_drop_editor/models/widget_node.dart';
import 'package:drag_drop_editor/pages/viewer_page.dart';
import 'package:drag_drop_editor/widgets/doc_button.dart';
import 'package:drag_drop_editor/widgets/placeholder/doc_colbox.dart';
import 'package:drag_drop_editor/widgets/placeholder/doc_rowbox.dart';
import 'package:drag_drop_editor/widgets/placeholder/inspector_tiles.dart';
import 'package:drag_drop_editor/widgets/placeholder/doc_textbox.dart';
import 'package:flutter/material.dart';

List<Widget> acceptedData = [];

WidgetNode serializeWidgetToNode(Widget widget) {
  if (widget is ListView) {
    final List<WidgetNode> childrenNodes =
        acceptedData.map((child) => serializeWidgetToNode(child)).toList();
    return WidgetNode(type: 'column', children: childrenNodes);
  } else if (widget is DocColBox) {
    final List<WidgetNode> childrenNodes =
        widget.children.map((child) => serializeWidgetToNode(child)).toList();
    return WidgetNode(type: 'column', children: childrenNodes);
  } else if (widget is DocRowBox) {
    final List<WidgetNode> childrenNodes =
        widget.children.map((child) => serializeWidgetToNode(child)).toList();
    return WidgetNode(type: 'row', children: childrenNodes);
  } else if (widget is DocTextBox) {
    return WidgetNode(type: 'textBox', hint: widget.hint ?? 'Tap to edit');
  }
  // You can add more conditions for other widgets as needed

  // If the widget doesn't match any known types, return an empty node
  return WidgetNode(type: 'empty');
}

class EditorPage extends StatefulWidget {
  const EditorPage({super.key});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  @override
  Widget build(BuildContext context) {
    Widget layout = ListView.builder(
      itemCount: acceptedData.length,
      itemBuilder: (context, index) => acceptedData[index],
    );
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Material(
                color: const Color(0xFFF6F6F8),
                child: Padding(
                  padding: const EdgeInsets.all(26),
                  child: SizedBox(
                    height: double.infinity,
                    child: Column(
                      children: [
                        const Text(
                          'Blueprint Editor',
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w200),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Drag and drop components to build your blueprint form',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w200),
                        ),
                        const SizedBox(height: 26),
                        Button(
                          isPrimary: true,
                          text: 'Preview',
                          onTap: () {
                            var serializedOutput =
                                serializeWidgetToNode(layout);
                            Map<String, dynamic> layoutJson =
                                serializedOutput.toJson();
                            print(layoutJson);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewerPage(
                                          jsonData: layoutJson,
                                        )));
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InspectorTiles(type: PlaceholderTypes.textbox),
                            InspectorTiles(type: PlaceholderTypes.colbox),
                            InspectorTiles(type: PlaceholderTypes.rowbox),
                          ],
                        ),
                        const SizedBox(height: 26),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF6F6F8),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: Color(0xFFEDEDF1),
                      ),
                    ),
                  ),
                  child: DragTarget<Enum>(
                    onAccept: (data) {
                      Widget widget = buildWidgetFromEnum(data);
                      setState(() {
                        acceptedData.add(widget);
                      });
                    },
                    builder: (
                      BuildContext context,
                      List<Object?> candidateData,
                      List<dynamic> rejectedData,
                    ) {
                      return layout;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
