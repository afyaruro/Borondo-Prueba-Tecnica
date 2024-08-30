import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final IconData icon;
  final String text;
  final ValueChanged<String>? onDateChanged;

  const CustomDatePicker({
    super.key,
    required this.icon,
    required this.text,
    this.onDateChanged,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final FocusNode _focusNode = FocusNode();
  Color _borderColor = const Color(0xffb5b5b5);
  Color _textColor = Colors.black;
  String? _selectedDate;

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

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        String formattedDay = picked.day.toString().padLeft(2, '0');
        String formattedMonth = picked.month.toString().padLeft(2, '0');
        String formattedYear = picked.year.toString();
        _selectedDate = "$formattedDay-$formattedMonth-$formattedYear";
        if (widget.onDateChanged != null) {
          widget.onDateChanged!(_selectedDate!);
        }
      });
    }
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
            child: GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: _selectedDate ?? widget.text,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: _selectedDate == null
                          ? const Color.fromARGB(255, 105, 105, 105)
                          : _textColor,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: _selectedDate == null
                        ? const Color.fromARGB(255, 105, 105, 105)
                        : _textColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
