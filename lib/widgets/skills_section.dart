import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      ['Dart', 0.85],
      ['Flutter', 0.85],
      ['HTML', 0.80],
      ['CSS', 0.75],
      ['Firebase', 0.70],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SKILLS',
          style: TextStyle(
            color: AppTheme.pink,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 20),

        Wrap(
          spacing: 15,
          runSpacing: 20,
          children: skills.map((skill) {
            return SkillCard(
              name: skill[0] as String,
              percentage: skill[1] as double,
            );
          }).toList(),
        ),

        const SizedBox(height: 40),

        const Text(
          'TOOLS & TECHNOLOGIES',
          style: TextStyle(
            color: AppTheme.pink,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 20),

        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            ToolChip(
              icon: Icons.code,
              name: 'VS Code',
            ),
            ToolChip(
              icon: Icons.source,
              name: 'GitHub',
            ),
            ToolChip(
              icon: Icons.cloud_outlined,
              name: 'Firebase',
            ),
          ],
        ),

        const SizedBox(height: 40),

        const Text(
          'COURSES',
          style: TextStyle(
            color: AppTheme.pink,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 20),

        const CourseCard(
          title: 'Dart Courses',
          platform: 'Satr Platform',
          hours: '7 Hours',
        ),

        const SizedBox(height: 12),

        const CourseCard(
          title: 'Flutter Courses',
          platform: 'Satr Platform',
          hours: '7 Hours',
        ),

        const SizedBox(height: 12),

        const CourseCard(
          title: 'UI/UX Courses',
          platform: 'Satr Platform',
          hours: '6 Hours',
        ),
      ],
    );
  }
}

class SkillCard extends StatelessWidget {
  final String name;
  final double percentage;

  const SkillCard({
    super.key,
    required this.name,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width < 400 ? 135 : 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppTheme.card,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: AppTheme.pink.withOpacity(.2),
              ),
            ),
            child: const Icon(
              Icons.code,
              color: AppTheme.pink,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 7),

          LinearProgressIndicator(
            value: percentage,
            minHeight: 5,
            backgroundColor: Colors.white12,
            color: AppTheme.pink,
            borderRadius: BorderRadius.circular(10),
          ),

          const SizedBox(height: 5),

          Text(
            '${(percentage * 100).toInt()}%',
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class ToolChip extends StatelessWidget {
  final IconData icon;
  final String name;

  const ToolChip({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: AppTheme.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white.withOpacity(.08),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppTheme.pink,
          ),
          const SizedBox(width: 10),
          Text(name),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String platform;
  final String hours;

  const CourseCard({
    super.key,
    required this.title,
    required this.platform,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white.withOpacity(.08),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppTheme.pink.withOpacity(.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.school_outlined,
              color: AppTheme.pink,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  platform,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          Text(
            hours,
            style: const TextStyle(
              color: AppTheme.pink,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}