
import 'package:drag_drop_editor/helper/widget_converter.dart';
import 'package:flutter/material.dart';

class ViewerPage extends StatelessWidget {
  const ViewerPage({super.key, required this.jsonData});
  final Map<String, dynamic> jsonData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Viewer Page'),
      ),
      body: Center(
        child: SingleChildScrollView(child: buildWidgetFromJson(jsonData)),
      ),
    );
  }
}
