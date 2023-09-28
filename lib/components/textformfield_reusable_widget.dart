import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldReusableWidget extends StatelessWidget {
  final String? lableText;
  final String? hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onchange;
  final FormFieldValidator<String>? validator;
  final Function onTab;
  final EdgeInsetsGeometry? padding;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final bool? enable;
  final bool? readOnly;
  final bool? autoFocus;
  final FocusNode? focusNode;

  const TextFormFieldReusableWidget({
    this.lableText,
    this.hintText,
    required this.controller,
    required this.obscureText,
    this.keyboardType,
    this.onchange,
    this.validator,
    required this.onTab,
    this.padding,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.minLines,
    this.enable,
    this.readOnly,
    this.autoFocus,
    this.focusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: TextFormField(
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        maxLength: maxLines,
        minLines: minLines,
        autofocus: autoFocus ?? false,
        enabled: enable ?? true,
        readOnly: readOnly ?? false,
        focusNode: focusNode,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onchange,
        validator: validator,
        onTap: () => onTab(),
        decoration: InputDecoration(
          labelText: lableText,
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: Icon(suffixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
          focusColor: Colors.grey[200],
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          // contentPadding: padding,
        ),
      ),
    );
  }
}
