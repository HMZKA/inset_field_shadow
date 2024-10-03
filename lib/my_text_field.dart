part of 'inset_field_shadow.dart';

class _MyTextField extends StatelessWidget {
  final Widget? suffix;
  final Widget? label;
  final TextInputType? keyboardType;
  final String? hint;
  final TextEditingController? controller;
  final Function()? onTap;
  final bool? obscureText;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final FormFieldState field;
  final Widget? prefix;
  final int? maxLines;
  final void Function(String)? onChanged;
  const _MyTextField({
    this.suffix,
    required this.field,
    this.maxLines,
    this.label,
    this.keyboardType,
    this.hint,
    this.controller,
    this.margin,
    this.padding,
    this.onTap,
    this.obscureText,
    this.onChanged,
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 7.0),
              padding: padding,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(-0.5, -0.5),
                        blurRadius: 5,
                        blurStyle: BlurStyle.normal,
                        inset: true,
                        color: field.hasError
                            ? Colors.red.shade300
                            : Colors.black38),
                    BoxShadow(
                        offset: const Offset(0.5, 1),
                        blurRadius: 5,
                        blurStyle: BlurStyle.normal,
                        inset: true,
                        color: field.hasError
                            ? Colors.red.shade200
                            : Colors.black45)
                  ]),
              child: TextField(
                onChanged: onChanged,
                onTap: onTap,
                keyboardType: keyboardType,
                obscureText: obscureText ?? false,
                maxLines: maxLines,
                controller: controller,
                decoration: InputDecoration(
                  label: label,
                  prefixIcon: prefix,
                  border: InputBorder.none,
                  hintText: hint,
                  errorBorder: InputBorder.none,
                  suffixIcon: suffix,
                ),
              )),
          field.hasError
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    field.errorText!,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
