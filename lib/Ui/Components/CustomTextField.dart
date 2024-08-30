import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final bool isPassword;
  final String text;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.icon,
    this.isPassword = false,
    required this.text, required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  Color _borderColor = const Color(0xffb5b5b5);
  Color _textColor = Colors.black;
  bool _obscureText = true;

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
        _borderColor = const Color(0xffb5b5b5);
        _textColor = Colors.black;
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25),
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
      width: 400,
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: _borderColor,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            widget.icon,
            color: _borderColor,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: widget.isPassword && _obscureText,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: widget.text,
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: _textColor,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          if (widget.isPassword)
            IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                color: Colors.black,
              ),
              onPressed: _togglePasswordVisibility,
            ),
        ],
      ),
    );
  }
}
