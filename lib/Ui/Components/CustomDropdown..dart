import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final IconData icon;
  final String text;
  final List<String> items;
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({
    super.key,
    required this.icon,
    required this.text,
    required this.items,
    this.onChanged,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final FocusNode _focusNode = FocusNode();
  Color _borderColor = const Color(0xffb5b5b5);
  Color _textColor = Colors.black;
  String? _selectedItem;

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
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                focusNode: _focusNode,
                value: _selectedItem,
                hint: Text(
                  widget.text,
                  style: TextStyle(
                      color: _selectedItem == null
                          ? const Color.fromARGB(255, 105, 105, 105)
                          : _textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                isExpanded: true,
                items: widget.items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          color: _textColor, fontWeight: FontWeight.w400),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedItem = newValue;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(newValue);
                  }
                },
                icon: SizedBox.shrink(), // Ocultar el icono del dropdown
                dropdownColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
