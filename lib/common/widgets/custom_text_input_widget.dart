import 'package:flutter/material.dart';

class CustomTextInputDetail {
  final String? hint;
  final String? label;
  final int? minLines;
  final int? maxLines;
  final String? content;
  final Function(String) onFieldChanged;

  const CustomTextInputDetail({
    this.hint,
    this.label,
    this.minLines,
    this.maxLines,
    this.content,
    required this.onFieldChanged,
  });
}

class CustomTextInputWidget extends StatefulWidget {
  final List<CustomTextInputDetail> detailList;

  const CustomTextInputWidget(this.detailList, {Key? key}) : super(key: key);

  @override
  State<CustomTextInputWidget> createState() => _CustomTextInputWidgetState();
}

class _CustomTextInputWidgetState extends State<CustomTextInputWidget> {
  final List<TextEditingController> _controllers = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    List<Widget> textFields = List.empty(growable: true);

    for (CustomTextInputDetail detail in widget.detailList) {
      TextEditingController controller = TextEditingController();
      _controllers.add(controller);

      if (detail.content != null) {
        controller.text = detail.content!;
      }

      textFields.add(
        TextField(
          minLines: detail.minLines,
          maxLines: detail.maxLines,
          onChanged: (value) {
            detail.onFieldChanged(value);
          },
          controller: controller,
          decoration: InputDecoration(
            labelText: detail.label,
            hintText: detail.hint,
          ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: textFields,
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }

    super.dispose();
  }
}
