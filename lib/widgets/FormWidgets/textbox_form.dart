import 'package:flutter/material.dart';

class TextBoxForm extends StatefulWidget {
  const TextBoxForm({super.key, required this.hint, this.controller});
  final String hint;
  final TextEditingController? controller;

  @override
  State<TextBoxForm> createState() => _TextBoxFormState();
}

class _TextBoxFormState extends State<TextBoxForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xFFEDEDF1),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            keyboardType: TextInputType.name,
            controller: widget.controller,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              labelText: widget.hint,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
