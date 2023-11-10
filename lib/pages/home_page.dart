import 'package:drag_drop_editor/pages/editor_page.dart';
import 'package:drag_drop_editor/widgets/doc_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 180,
          child: Button(
            isPrimary: true,
            text: 'Start Testing',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditorPage(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
