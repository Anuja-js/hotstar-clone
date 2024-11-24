import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotstar/customs/custom_colors.dart';

class BrandGrid extends StatelessWidget {
  const BrandGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final brands = [
      {'name': 'Star', 'image': 'assets/images/star.png', },
      {'name': 'Pixar', 'image': 'assets/images/pixar.png', },
      {'name': 'Marvel', 'image': 'assets/images/marvel.webp',},
      {'name': 'Star Wars', 'image': 'assets/images/war.png', },
      {'name': 'National Geographic', 'image': 'assets/images/nathional.png', },
      {'name': 'Hotstar Specials', 'image': 'assets/images/special.png', },
    ];

    return Container(
      color:black,
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: brands.map((brand) => _buildBrandCard(brand)).toList(),
      ),
    );
  }

  Widget _buildBrandCard(Map<String, dynamic> brand) {
    return Container(
      width: 105.w,
      height: 50.h,padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: Image.asset(
          brand['image'],
          height: 35.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}