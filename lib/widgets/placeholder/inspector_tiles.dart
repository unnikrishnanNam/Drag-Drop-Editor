import 'package:flutter/material.dart';
import '../../helper/global_enums.dart';

class InspectorTiles extends StatelessWidget {
  const InspectorTiles({super.key, required this.type});
  final Enum type;

  @override
  Widget build(BuildContext context) {
    String text = PlaceholderTypes.textbox == type
        ? 'Text Box'
        : type == PlaceholderTypes.colbox
            ? 'Column'
            : 'Row';
    String image = PlaceholderTypes.textbox == type
        ? 'lib/images/Text Input Box.png'
        : type == PlaceholderTypes.colbox
            ? 'lib/images/Column Box.png'
            : 'lib/images/Row Box.png';
    return Draggable(
      data: type,
      feedback: Image.asset(
        opacity: const AlwaysStoppedAnimation(.5),
        image,
        height: 60,
        fit: BoxFit.contain,
      ),
      child: SizedBox(
        child: Column(
          children: [
            Image.asset(
              image,
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
