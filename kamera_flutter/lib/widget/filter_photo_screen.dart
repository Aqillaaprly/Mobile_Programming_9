import 'dart:io';
import 'package:flutter/material.dart';
import 'filter_selector.dart';

class FilterPhotoScreen extends StatefulWidget {
  const FilterPhotoScreen({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  State<FilterPhotoScreen> createState() => _FilterPhotoScreenState();
}

class _FilterPhotoScreenState extends State<FilterPhotoScreen> {
  final _filters = [
    Colors.white,
    Colors.orangeAccent,
    Colors.redAccent,
    Colors.purpleAccent,
    Colors.blueAccent,
    Colors.teal,
    Colors.greenAccent,
    Colors.brown,
    Colors.grey,
    Colors.deepPurple,
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  void dispose() {
    _filterColor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apply Filter')),
      body: Material(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: _buildPhotoWithFilter(),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: _buildFilterSelector(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder<Color>(
      valueListenable: _filterColor,
      builder: (context, color, child) {
        return Image.file(
          File(widget.imagePath),
          color: color.withOpacity(0.3),
          colorBlendMode: BlendMode.overlay,
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget _buildFilterSelector() {
    return FilterSelector(
      onFilterChanged: _onFilterChanged,
      filters: _filters,
    );
  }
}