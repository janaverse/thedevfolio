import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/profile_card.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1000;
    final bool isTablet = width >= 650 && width < 1000;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1400,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop
                      ? 24
                      : isTablet
                          ? 20
                          : 16,
                  vertical: 24,
                ),
                child: isDesktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 350,
                            child: ProfileCard(),
                          ),
                          SizedBox(width: 30),
                          Expanded(
                            child: MainContent(),
                          ),
                        ],
                      )
                    : Column(
                        children: const [
                          ProfileCard(),
                          SizedBox(height: 30),
                          MainContent(),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AboutSection(),
        SizedBox(height: 30),
        SkillsSection(),
        SizedBox(height: 40),
        ContactSection(),
        SizedBox(height: 30),
        Footer(),
      ],
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isSmall = width < 600;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isSmall ? 20 : 28),
      decoration: BoxDecoration(
        color: AppTheme.card,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.pink.withOpacity(.25),
        ),
      ),
      child: isSmall
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: const BoxDecoration(
                        color: AppTheme.pink,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.send_rounded,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Expanded(
                      child: Text(
                        "Let's Connect",
                        style: TextStyle(
                          color: AppTheme.pink,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                const Text(
                  'I am open to new opportunities and collaborations.',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Get In Touch'),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: const BoxDecoration(
                    color: AppTheme.pink,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.send_rounded,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's Connect",
                        style: TextStyle(
                          color: AppTheme.pink,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'I am open to new opportunities and collaborations.',
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Get In Touch'),
                ),
              ],
            ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          '© 2026 Jana ALmeziney. All rights reserved.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.textSecondary,
          ),
        ),
      ),
    );
  }
}