import 'package:flutter/material.dart';

class SimpleTextWidget extends StatelessWidget {
  final String textoRecebido;
  final Color? textColor;
  final double? textSize;

  const SimpleTextWidget({
    super.key,
    required this.textoRecebido,
    this.textColor,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textoRecebido,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: textColor ?? Colors.white, fontSize: textSize ?? 20.0),
    );
  }
}
