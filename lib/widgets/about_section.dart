import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final double titleSize = width < 500 ? 32 : 42;
    final double bodySize = width < 500 ? 15 : 17;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ABOUT ME',
          style: TextStyle(
            color: AppTheme.pink,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 15),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
              height: 1.2,
              color: AppTheme.textPrimary,
            ),
            children: const [
              TextSpan(text: 'Turning '),
              TextSpan(
                text: 'Ideas',
                style: TextStyle(color: AppTheme.pink),
              ),
              TextSpan(text: ' into\nBeautiful '),
              TextSpan(
                text: 'Experiences',
                style: TextStyle(color: AppTheme.pink),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "I'm a Computer Science graduate from Taibah University with a passion "
          "for building modern and user-friendly web experiences. I enjoy "
          "researching new technologies, turning ideas into real projects, "
          "and continuously developing my technical skills through learning "
          "and hands-on practice.",
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: bodySize,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 30),
        const InformationGrid(),
      ],
    );
  }
}

class InformationGrid extends StatelessWidget {
  const InformationGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final int columns = width >= 1100
        ? 3
        : width >= 650
            ? 2
            : 1;

    final items = [
      ['Education', 'B.Sc. in Computer Science', Icons.school_outlined],
      ['University', 'Taibah University', Icons.account_balance_outlined],
      ['Graduation', '2026', Icons.calendar_month_outlined],
      ['Specialization', 'Computer Science', Icons.code_rounded],
      ['Location', 'Madinah, Saudi Arabia', Icons.location_on_outlined],
      ['Focus', 'Web Development', Icons.web_outlined],
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.pink.withOpacity(.2),
        ),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          childAspectRatio: columns == 1 ? 3.2 : 1.6,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final item = items[index];

          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withOpacity(.05),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item[2] as IconData,
                  color: AppTheme.pink,
                  size: 27,
                ),
                const SizedBox(height: 8),
                Text(
                  item[0] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  item[1] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}