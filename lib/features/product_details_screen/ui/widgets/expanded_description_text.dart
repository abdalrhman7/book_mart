import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class ExpandedDescriptionText extends StatefulWidget {
  const ExpandedDescriptionText({super.key, required this.description});
  final String description ;

  @override
  State<ExpandedDescriptionText> createState() =>
      _ExpandedDescriptionTextState();
}

class _ExpandedDescriptionTextState extends State<ExpandedDescriptionText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final String description = widget.description;

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: isExpanded
                ? description
                : description.length > 90
                ? '${description.substring(0, 90)}... '
                : '$description ',
            style: TextStyles.font14GraySemiBold,

          ),
          const WidgetSpan(
            child: SizedBox(width: 4),
          ),
          TextSpan(
            text: isExpanded ? 'Less' : 'More',
            style: TextStyles.font14BlackMedium.copyWith(
              color: ColorsManager.mainBinkColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
          ),
        ],
      ),
    );
  }
}
