import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final Function(String key) callback;

  const CustomSearchBar({Key? key, required this.callback}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.search),
        Expanded(
          child: TextField(
            textInputAction: TextInputAction.search,
            onChanged: (text) {
              widget.callback(text);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Search',
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
