import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final IconData icon;
  final String text;
  final Function(String) onSearchChanged;

  const CustomSearchBar({
    super.key,
    required this.icon,
    required this.text,
    required this.onSearchChanged,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final FocusNode _focusNode = FocusNode();
  Color _borderColor = const Color.fromARGB(82, 139, 139, 139);
  Color _textColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      if (_focusNode.hasFocus) {
        _borderColor = const Color(0xff00d0c1);
        _textColor = const Color(0xff00d0c1);
      } else {
        _borderColor = const Color.fromARGB(82, 139, 139, 139);
        _textColor = Colors.black;
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: _borderColor,
          )),
      child: Row(
        children: [
          Icon(
            widget.icon,
            color: _borderColor,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: widget.onSearchChanged,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: widget.text,
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: _textColor,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
