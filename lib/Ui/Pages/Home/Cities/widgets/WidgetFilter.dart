import 'package:flutter/material.dart';

class WidgetFilter extends StatefulWidget {
  final String selectedFilter;
  final Function(String) onFilterSelected;

  const WidgetFilter({
    Key? key,
    required this.selectedFilter,
    required this.onFilterSelected,
  }) : super(key: key);

  @override
  _WidgetFilterState createState() => _WidgetFilterState();
}

class _WidgetFilterState extends State<WidgetFilter> {
  late String _selectedFilter;

  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.selectedFilter;
  }

  void _onFilterTap(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
    widget.onFilterSelected(filter);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(78, 184, 182, 182),
            width: 2,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                child: Text(
                  "All",
                  style: TextStyle(
                    fontWeight: _selectedFilter == "All"
                        ? FontWeight.w700
                        : FontWeight.w400,
                    color: _selectedFilter == "All"
                        ? const Color(0xff00d0c1)
                        : const Color(0xffa9a9a9),
                  ),
                ),
                onTap: () => _onFilterTap("All"),
              ),
              const SizedBox(width: 20),
              InkWell(
                child: Text(
                  "Completed",
                  style: TextStyle(
                    fontWeight: _selectedFilter == "Completed"
                        ? FontWeight.w700
                        : FontWeight.w400,
                    color: _selectedFilter == "Completed"
                        ? const Color(0xff00d0c1)
                        : const Color(0xffa9a9a9),
                  ),
                ),
                onTap: () => _onFilterTap("Completed"),
              ),
              const SizedBox(width: 20),
              InkWell(
                child: Text(
                  "Not Completed",
                  style: TextStyle(
                    fontWeight: _selectedFilter == "Not Completed"
                        ? FontWeight.w700
                        : FontWeight.w400,
                    color: _selectedFilter == "Not Completed"
                        ? const Color(0xff00d0c1)
                        : const Color(0xffa9a9a9),
                  ),
                ),
                onTap: () => _onFilterTap("Not Completed"),
              ),
            ],
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              // Acción para el botón de icono
            },
            icon: const Icon(
              Icons.segment,
              color: Color(0xffa9a9a9),
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}