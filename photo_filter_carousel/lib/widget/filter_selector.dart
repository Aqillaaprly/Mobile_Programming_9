import 'package:flutter/material.dart';

class FilterSelector extends StatelessWidget {
  final List<Color> filters;
  final ValueChanged<Color> onFilterChanged;

  const FilterSelector({
    super.key,
    required this.filters,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.black.withOpacity(0.6),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final color = filters[index];
          return GestureDetector(
            onTap: () => onFilterChanged(color),
            child: Container(
              width: 70,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          );
        },
      ),
    );
  }
}