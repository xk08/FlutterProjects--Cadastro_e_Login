import 'package:flutter/material.dart';

class SimpleTextWidget extends StatelessWidget {
  final String textoRecebido;
  final Color? textColor;
  final double? textSize;

  //Retorna uma função para quem chamar o Widget
  final Function()? onSimpleTap;

  const SimpleTextWidget({
    super.key,
    required this.textoRecebido,
    this.textColor,
    this.textSize,
    this.onSimpleTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSimpleTap,
      child: Text(
        textoRecebido,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: textColor ?? Colors.white, fontSize: textSize ?? 20.0),
      ),
    );
  }
}
