import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/widgets/app_text_form_faild.dart';
import 'package:flutter/material.dart';

class ProfileInfoField extends StatefulWidget {
  final String label;
  final String value;

  const ProfileInfoField({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  State<ProfileInfoField> createState() => _ProfileInfoFieldState();
}


class _ProfileInfoFieldState extends State<ProfileInfoField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.value);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ProfileInfoField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        verticalSpace(8),
        AppTextFormField(
          controller: controller,
          readOnly: true,
        ),
      ],
    );
  }
}