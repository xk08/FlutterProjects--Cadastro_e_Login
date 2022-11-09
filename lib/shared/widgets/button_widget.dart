import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? textButton;
  final Color? colorButton;

  //Retorna uma função para quem chamar o Widget
  final Function()? onPressed;

  const ButtonWidget({
    super.key,
    this.textButton,
    this.colorButton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(colorButton ?? Colors.black),
      ),
      onPressed: onPressed,
      child: Text(textButton ?? "Clique aqui"),
    );
  }
}
