// ignore_for_file: must_be_immutable

import 'package:drag_drop_editor/widgets/FormWidgets/textbox_form.dart';
import 'package:drag_drop_editor/widgets/doc_button.dart';
import 'package:flutter/material.dart';

class DocTextBox extends StatefulWidget {
  DocTextBox({super.key, this.hint = 'Tap to edit'});
  String? hint;

  @override
  State<DocTextBox> createState() => _DocTextBoxState();
}

class _DocTextBoxState extends State<DocTextBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TextEditingController controller =
            TextEditingController(text: widget.hint);
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            backgroundColor: Colors.white,
            builder: (context) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 140),
                  child: SizedBox(
                    height: 400,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 3,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        const SizedBox(height: 20),
                        TextBoxForm(
                          controller: controller,
                          hint: 'Enter Field Value',
                        ),
                        Button(
                            text: 'Save',
                            onTap: () {
                              Navigator.pop(context, controller.text);
                            })
                      ],
                    ),
                  ),
                ),
              );
            }).then((value) => setState(() {
              widget.hint = value;
            }));
      },
      child: Container(
        height: 50,
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
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 2,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      borderRadius: BorderRadius.circular(5)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.hint ?? 'Tap to Edit',
                  style: const TextStyle(
                    color: Color(0xFFB1B1B5),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
