import 'package:flickd/core/utils/constants/sizes.dart';
import 'package:flickd/core/widgets/drob_down_button.dart';
import 'package:flutter/material.dart';

class CustomDrobDownButton extends StatelessWidget {
  const CustomDrobDownButton({
    super.key,
    required this.onChanged,
    required this.choice,
  });
  final void Function(String?)? onChanged;
  final String choice;

  @override
  Widget build(BuildContext context) {
    return CustomDropdownButton2(
      icon: const Icon(
        Icons.menu,
        size: AppSizes.mdIcon,
      ),
      buttonDecoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(),
        ),
      ),
      dropdownItems: const [
        'Popular',
        'Upcoming',
      ],
      hint: 'All',
      value: choice,
      onChanged: onChanged,
    );
  }
}
