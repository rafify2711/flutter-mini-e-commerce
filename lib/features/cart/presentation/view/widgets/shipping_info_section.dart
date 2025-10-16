import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/app_colors.dart';
import 'package:flutter_task/core/utils/app_text_style.dart';

class ShippingInfoSection extends StatefulWidget {
   const ShippingInfoSection({super.key});

  @override
  State<ShippingInfoSection> createState() => _ShippingInfoSectionState();
}

class _ShippingInfoSectionState extends State<ShippingInfoSection> {
  final List<String> creditCards = [
    '**** **** **** 5124',
    '**** **** **** 2654',
  ];
  String? selectedCard;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(8),

      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Shipping Information',style: AppTextStyles.manropeSemiBold20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButton<String>(
              isExpanded: true,
              style: AppTextStyles.manropeSemiBold16.copyWith(color: AppColors.dark),
              hint: Text('Choose a card'),
              value: selectedCard,
              items: creditCards.map((card) {
                return DropdownMenuItem<String>(
                  value: card,
                  child: Text(card),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCard = value;
                });
              },
            ),
          ),

        ],
      )
    );
  }
}
