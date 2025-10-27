import 'package:flutter/material.dart';

class FilterSelector extends StatelessWidget {
  final Function(double brightness, double contrast) onFilterSelected;

  const FilterSelector({super.key, required this.onFilterSelected});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> filters = [
      {'name': 'Normal', 'brightness': 0.0, 'contrast': 1.0},
      {'name': 'Bright', 'brightness': 0.2, 'contrast': 1.1},
      {'name': 'Dark', 'brightness': -0.2, 'contrast': 1.0},
      {'name': 'High Contrast', 'brightness': 0.0, 'contrast': 1.5},
      {'name': 'Low Contrast', 'brightness': 0.0, 'contrast': 0.8},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];
          final String name = filter['name'] as String;
          final double brightness = filter['brightness'] as double;
          final double contrast = filter['contrast'] as double;

          return GestureDetector(
            onTap: () => onFilterSelected(brightness, contrast),
            child: Container(
              width: 100,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300,
              ),
              child: Center(
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}