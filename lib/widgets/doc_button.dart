import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.text,
    this.onTap,
    this.icon,
    this.isPrimary = true,
    this.height = 45,
  });
  final String? text;
  final bool? isPrimary;
  final Function()? onTap;
  final IconData? icon;
  final int height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: height.toDouble(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(
            colors: isPrimary!
                ? [
                    const Color(0XFFF66052),
                    const Color(0XFFDE3178),
                  ]
                : [const Color(0xFFA3A7BA), const Color(0xFFA3A7BA)],
          ),
        ),
        child: Center(
          child: icon == null
              ? Text(
                  text ?? '',
                  style: GoogleFonts.nunito(color: Colors.white, fontSize: 16),
                )
              : Icon(
                  icon,
                  color: Colors.white,
                  size: 28,
                ),
        ),
      ),
    );
  }
}
