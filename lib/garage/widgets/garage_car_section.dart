import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../data/garage_data.dart';
import '../models/garage_car.dart';
import 'category_chip.dart';
import 'garage_card.dart';
import 'garage_header.dart';

class GarageCarSection extends StatefulWidget {
  const GarageCarSection({super.key});

  @override
  State<GarageCarSection> createState() => _GarageCarSectionState();
}

class _GarageCarSectionState extends State<GarageCarSection> {
  String _selectedCategory = 'All';

  List<GarageCar> get _filteredCars {
    if (_selectedCategory == 'All') {
      return GarageData.cars;
    }
    return GarageData.cars
        .where((car) =>
            car.category.toLowerCase() == _selectedCategory.toLowerCase())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;

    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const GarageHeader()
              .animate()
              .fadeIn(duration: 500.ms)
              .slideY(begin: -0.1, end: 0, duration: 500.ms),
          const SizedBox(height: 30),
          // Category Filter Selector
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: GarageData.categories.map((category) {
                final isSelected = _selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: CategoryChip(
                    label: category,
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ).animate().fadeIn(duration: 500.ms, delay: 100.ms),
          const SizedBox(height: 40),
          // Vehicle Showcase Section (List on mobile, Grid on tablet)
          if (isTablet)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: 0.78,
              ),
              itemCount: _filteredCars.length,
              itemBuilder: (context, index) {
                final car = _filteredCars[index];
                return GarageCard(
                  key: ValueKey(car.id),
                  car: car,
                ).animate().fadeIn(
                      duration: 400.ms,
                      delay: Duration(milliseconds: 100 * index),
                    );
              },
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _filteredCars.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 28),
              itemBuilder: (context, index) {
                final car = _filteredCars[index];
                return GarageCard(
                  key: ValueKey(car.id),
                  car: car,
                ).animate().fadeIn(
                      duration: 400.ms,
                      delay: Duration(milliseconds: 80 * index),
                    );
              },
            ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
