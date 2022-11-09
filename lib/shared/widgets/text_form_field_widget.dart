import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? hint;
  final bool obscureText;
  final bool enabled;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Color? labelColor;
  final Color? floatingLabelStyleColor;

  final InputBorder? border;

  final InputBorder? borderFocused;

  final TextStyle? style;

  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;
  final void Function(String? text)? onChanged;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;

  const TextFormFieldWidget({
    super.key,
    required this.label,
    required this.obscureText,
    required this.enabled,
    required this.readOnly,
    this.icon,
    this.hint,
    this.controller,
    this.suffixIcon,
    this.labelColor,
    this.floatingLabelStyleColor,
    this.border,
    this.borderFocused,
    this.style,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onTap,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      readOnly: readOnly,
      decoration: InputDecoration(
        floatingLabelStyle:
            TextStyle(color: floatingLabelStyleColor ?? Colors.white),
        labelStyle: TextStyle(color: labelColor ?? Colors.white),
        suffixIcon: suffixIcon,
        labelText: label,
        hintText: hint,
        border: border ??
            const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
        focusedBorder: borderFocused,
        prefixIcon: icon == null
            ? null
            : Icon(
                icon,
                color: Colors.white,
              ),
      ),
      obscureText: obscureText,
      enabled: enabled,
      onTap: onTap,
    );
  }
}
