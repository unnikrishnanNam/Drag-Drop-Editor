import 'package:drag_drop_editor/helper/global_enums.dart';
import 'package:drag_drop_editor/models/widget_node.dart';
import 'package:drag_drop_editor/widgets/FormWidgets/textbox_form.dart';
import 'package:drag_drop_editor/widgets/placeholder/doc_colbox.dart';
import 'package:drag_drop_editor/widgets/placeholder/doc_rowbox.dart';
import 'package:drag_drop_editor/widgets/placeholder/doc_textbox.dart';
import 'package:flutter/material.dart';

Widget buildWidgetFromEnum(Enum type) {
  if (type == PlaceholderTypes.textbox) {
    return DocTextBox();
  } else if (type == PlaceholderTypes.colbox) {
    return DocColBox();
  } else if (type == PlaceholderTypes.rowbox) {
    return DocRowBox();
  } else {
    return const Text('Unknown');
  }
}

Widget buildWidgetFromJson(dynamic data) {
  if (data is List) {
    return Column(
      children: data.map((item) => buildWidgetFromJson(item)).toList(),
    );
  } else if (data is Map && data.containsKey('type')) {
    switch (data['type']) {
      case 'row':
        return Row(
          children: (data['children'] as List)
              .map(
                (item) => Flexible(
                  child: buildWidgetFromJson(item),
                ),
              )
              .toList(),
        );
      case 'column':
        return Column(
          children: (data['children'] as List)
              .map((item) => buildWidgetFromJson(item))
              .toList(),
        );
      case 'textBox':
        return TextBoxForm(
          hint: data['hint'],
        );
      // Add more cases for other widget types as needed
      default:
        return SizedBox(); // Return an empty widget if type is not recognized
    }
  } else {
    return SizedBox(); // Return an empty widget if data type is not recognized
  }
}
