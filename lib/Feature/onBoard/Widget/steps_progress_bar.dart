import 'package:clinic_mobile/core/Localization/local_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepProgressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            context.read<LocaleCubit>().toggleLocale();
          },
          icon: const Icon(Icons.translate),
          color: color.primary,
        ),
        SizedBox(height: 20),
        Row(
          children: List.generate(totalSteps * 2 - 1, (index) {
            // CIRCLE
            if (index.isEven) {
              int step = index ~/ 2;

              bool isActive = step <= currentStep;

              return Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? color.primary : color.surface,
                  border: Border.all(color: color.primary, width: 2),
                ),
              );
            }
            // LINE
            else {
              int lineIndex = index ~/ 2;

              bool isActive = lineIndex < currentStep;

              return Expanded(
                child: Container(
                  height: 4,
                  color: isActive ? color.primary : color.onSurfaceVariant,
                ),
              );
            }
          }),
        ),
      ],
    );
  }
}
