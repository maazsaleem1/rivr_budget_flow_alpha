import 'package:flutter/material.dart';

class InterText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const InterText(this.data, {super.key, this.style, this.textAlign, this.maxLines, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style?.copyWith(fontFamily: 'Inter') ?? const TextStyle(fontFamily: 'Inter'),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
