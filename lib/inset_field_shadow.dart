library custom_text_field;

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
part 'my_text_field.dart';

class InsetFieldShadow extends FormField<String> {
  InsetFieldShadow({
    super.key,
    super.validator,
    this.label,
    this.maxLines,
    this.suffix,
    this.prefix,
    this.keyboardType = TextInputType.text,
    this.hint,
    required this.controller,
    this.obscureText = false,
    this.margin,
    this.padding,
    this.onTap,
  }) : super(
          initialValue: controller?.text,
          builder: (FormFieldState<String> field) {
            return _MyTextField(
              field: field,
              maxLines: maxLines,
              label: label,
              suffix: suffix,
              prefix: prefix,
              keyboardType: keyboardType,
              hint: hint,
              controller: controller,
              obscureText: obscureText,
              margin: margin,
              padding: padding,
              onTap: onTap,
              onChanged: (value) {
                field.didChange(value);
              },
            );
          },
        );

  /// Label widget to display inside the text field.
  final Widget? label;

  /// Widget to display at the end of the text field.
  final Widget? suffix;

  /// Widget to display at the start of the text field.
  final Widget? prefix;

  /// The type of keyboard to use for editing the text.
  final TextInputType keyboardType;

  /// Text hint to display inside the text field when it's empty.
  final String? hint;

  /// Controller for the text being edited.
  final TextEditingController? controller;

  /// Whether to obscure the text (e.g., for passwords).
  final bool obscureText;

  /// Outer padding of the text field.
  final EdgeInsetsGeometry? margin;

  /// Inner padding of the text field.
  final EdgeInsetsGeometry? padding;

  /// Callback when the text field is tapped.
  final Function()? onTap;

  /// The maximum number of lines to display in the text field.
  final int? maxLines;
}
