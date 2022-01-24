import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autoFocus;
  final String? title;
  final String hintText;
  final String? errorText;
  final Widget? suffix;
  final Widget? prefix;
  final bool obscureText;
  final bool enabled;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int minLines;
  final int? maxLines;

  const CustomInput({
    Key? key,
    this.controller,
    this.focusNode,
    this.autoFocus = false,
    this.title,
    required this.hintText,
    this.suffix,
    this.obscureText = false,
    this.enabled = true,
    this.onSaved,
    this.textInputAction,
    this.keyboardType,
    this.prefix,
    this.minLines = 1,
    this.maxLines,
    this.validator,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    title!,
                    style: const TextStyle(
                      color: Color(0xff00111f),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xffccddec),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    prefix ?? const SizedBox(),
                    Expanded(
                      child: TextFormField(
                        validator: validator,
                        controller: controller,
                        focusNode: focusNode,
                        maxLines: maxLines,
                        minLines: minLines,
                        autofocus: autoFocus,
                        enabled: enabled,
                        textInputAction: textInputAction,
                        keyboardType: keyboardType,
                        onSaved: onSaved,
                        obscureText: obscureText,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: suffix,
                          suffixIconConstraints:
                          const BoxConstraints(maxHeight: 30),
                          hintText: hintText,
                          hintStyle: const TextStyle(
                            color: Color(0xff95abbf),
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            errorText ?? "",
            style: const TextStyle(color: Colors.red, fontSize: 12),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}