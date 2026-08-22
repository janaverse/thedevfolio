import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // =========================
        // PROJECTS
        // =========================

        const Text(
          'PROJECTS',
          style: TextStyle(
            color: AppTheme.pink,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 20),

        const ProjectCard(
          title: 'Amoora Bloom',
          description:
              'A modern gift and flower shop website designed to showcase products and make online browsing simple and elegant.',
          technologies: [
            'Flutter Web',
            'Dart',
            'Responsive Design',
          ],
          imagePath: 'assets/images/amoorabloom.png',
          demoUrl: 'https://amoorabloom.netlify.app/',
        ),

        const SizedBox(height: 15),

        const ProjectCard(
          title: 'Jana Portfolio',
          description:
              'A responsive personal portfolio website showcasing my projects, education, certificates, and contact information.',
          technologies: [
            'Flutter Web',
            'Dart',
            'Responsive Design',
          ],
          imagePath: 'assets/images/thedevfolio.png',
          demoUrl: 'https://thedevfolio.netlify.app/',
        ),

        const SizedBox(height: 15),

        const ProjectCard(
          title: 'Watto App',
          description:
              'A responsive web project built with Flutter, designed with a clean and user-friendly interface.',
          technologies: [
            'Flutter',
            'Dart',
            'Responsive Design',
          ],
          imagePath: 'assets/images/watto.png',
          demoUrl: 'https://wattoapp.netlify.app/',
        ),

        const SizedBox(height: 40),

        // =========================
        // CERTIFICATES
        // =========================

        const Text(
          'CERTIFICATES',
          style: TextStyle(
            color: AppTheme.pink,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 20),

        CourseCard(
          title: 'Dart Courses',
          platform: 'Satr Platform',
          hours: '7 Hours',
          pdfPath: 'certificates/Dart.pdf',
        ),

        const SizedBox(height: 12),

        CourseCard(
          title: 'Flutter Courses',
          platform: 'Satr Platform',
          hours: '7 Hours',
          pdfPath: 'certificates/Flutter.pdf',
        ),

        const SizedBox(height: 12),

        CourseCard(
          title: 'UI/UX Courses',
          platform: 'Satr Platform',
          hours: '6 Hours',
          pdfPath: 'certificates/UX_UI.pdf',
        ),
      ],
    );
  }
}

// =====================================================
// PROJECT CARD
// =====================================================

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final String imagePath;
  final String demoUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
    required this.imagePath,
    required this.demoUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isExpanded = false;

  Future<void> _openLink() async {
    final uri = Uri.parse(widget.demoUrl);

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.card,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isExpanded
                ? AppTheme.pink.withOpacity(.35)
                : Colors.white.withOpacity(.08),
          ),
          boxShadow: isExpanded
              ? [
                  BoxShadow(
                    color: AppTheme.pink.withOpacity(.08),
                    blurRadius: 25,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================
            // PROJECT IMAGE
            // =========================

            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: AspectRatio(
                aspectRatio: 16 / 7,
                child: Image.asset(
                  widget.imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppTheme.card,
                      child: const Center(
                        child: Icon(
                          Icons.image_outlined,
                          color: AppTheme.pink,
                          size: 40,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // =========================
            // CARD CONTENT
            // =========================

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Arrow
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      AnimatedRotation(
                        duration: const Duration(milliseconds: 300),
                        turns: isExpanded ? 0.5 : 0,
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppTheme.pink,
                          size: 27,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Description
                  Text(
                    widget.description,
                    maxLines: isExpanded ? null : 2,
                    overflow: isExpanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      height: 1.5,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Technologies
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.technologies.map((technology) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.pink.withOpacity(.10),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppTheme.pink.withOpacity(.15),
                          ),
                        ),
                        child: Text(
                          technology,
                          style: const TextStyle(
                            color: AppTheme.pink,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  // =========================
                  // EXPANDED CONTENT
                  // =========================

                  AnimatedSize(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                    child: isExpanded
                        ? Column(
                            children: [
                              const SizedBox(height: 20),

                              const Divider(
                                color: Color(0xFF30303A),
                              ),

                              const SizedBox(height: 18),

                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton.icon(
                                  onPressed: _openLink,
                                  icon: const Icon(
                                    Icons.open_in_new_rounded,
                                    size: 18,
                                  ),
                                  label: const Text(
                                    'Live Demo',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: AppTheme.pink,
                                    side: BorderSide(
                                      color:
                                          AppTheme.pink.withOpacity(.35),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 13,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// CERTIFICATE CARD
// =====================================================

class CourseCard extends StatelessWidget {
  final String title;
  final String platform;
  final String hours;
  final String pdfPath;

  const CourseCard({
    super.key,
    required this.title,
    required this.platform,
    required this.hours,
    required this.pdfPath,
  });

  Future<void> _openPdf() async {
    final uri = Uri.base.resolve(pdfPath);

    await launchUrl(
      uri,
      webOnlyWindowName: '_self',
    );
  }

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
      child: Column(
        children: [
          Row(
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

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: _openPdf,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.pink,
                side: BorderSide(
                  color: AppTheme.pink.withOpacity(.35),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 13,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'View Certificate',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.workspace_premium_outlined,
                    size: 19,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}