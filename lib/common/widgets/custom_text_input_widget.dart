import 'package:flutter/material.dart';

class CustomTextInputDetail {
  final String? hint;
  final String? label;
  final Function(String) onFieldChanged;

  const CustomTextInputDetail({
    this.hint,
    this.label,
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

      textFields.add(
        TextField(
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
