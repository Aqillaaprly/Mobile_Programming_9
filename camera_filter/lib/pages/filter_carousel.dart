import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/filter_selector.dart';

class FilterCarouselPage extends StatefulWidget {
  final String imagePath;

  const FilterCarouselPage({super.key, required this.imagePath});

  @override
  State<FilterCarouselPage> createState() => _FilterCarouselPageState();
}

class _FilterCarouselPageState extends State<FilterCarouselPage> {
  double _brightness = 0.0;
  double _contrast = 1.0;

  void _updateFilter(double brightness, double contrast) {
    setState(() {
      _brightness = brightness;
      _contrast = contrast;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter Carousel')),
      body: Column(
        children: [
          Expanded(
            child: ColorFiltered(
              colorFilter: ColorFilter.matrix(<double>[
                _contrast, 0, 0, 0, _brightness * 255,
                0, _contrast, 0, 0, _brightness * 255,
                0, 0, _contrast, 0, _brightness * 255,
                0, 0, 0, 1, 0,
              ]),
              child: Image.file(File(widget.imagePath)),
            ),
          ),
          FilterSelector(onFilterSelected: _updateFilter),
        ],
      ),
    );
  }
}
