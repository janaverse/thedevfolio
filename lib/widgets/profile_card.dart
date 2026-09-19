import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  Future<void> _openGitHub() async {
    final Uri url = Uri.parse('https://github.com/janaverse');

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  Future<void> _openLinkedIn() async {
    final Uri url = Uri.parse('https://www.linkedin.com/in/jana-almeziney');

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  Future<void> _openEmail() async {
    final Uri emailUri = Uri(scheme: 'mailto', path: 'j.almeziney@gmail.com');

    await launchUrl(emailUri);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isSmall = width < 400;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isSmall ? 20 : 28),
      decoration: BoxDecoration(
        color: AppTheme.card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.pink.withOpacity(.25)),
      ),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.pink, width: 2),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.pink.withOpacity(.25),
                  blurRadius: 30,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/my_logo.png',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Hi, I’m',
            style: TextStyle(fontSize: 18, color: AppTheme.textSecondary),
          ),
          const SizedBox(height: 5),
          const Text(
            'Jana Hassan AL Meziney',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.pink,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Computer Science Graduate\n& Web Developer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: AppTheme.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 30),
          const Divider(color: Color(0xFF30303A)),
          const SizedBox(height: 20),
          const InfoRow(
            icon: Icons.school_outlined,
            text: 'B.Sc. in Computer Science',
          ),
          const InfoRow(
            icon: Icons.location_on_outlined,
            text: 'Madinah, Saudi Arabia',
          ),
          const InfoRow(
            icon: Icons.email_outlined,
            text: 'j.almeziney@gmail.com',
          ),
          const InfoRow(icon: Icons.phone_outlined, text: '+966 50 920 9415'),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialButton(icon: FontAwesomeIcons.github, onTap: _openGitHub),
              SocialButton(
                icon: FontAwesomeIcons.linkedinIn,
                onTap: _openLinkedIn,
              ),
              SocialButton(icon: Icons.email_outlined, onTap: _openEmail),
            ],
          ),
          const SizedBox(height: 30),
          Link(
            uri: Uri.parse('certificates/Jana_Almeziney_CV.pdf'),
            target: LinkTarget.self,
            builder: (context, followLink) {
              return SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: followLink,
                  icon: const Icon(Icons.download),
                  label: const Text('Download CV'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.pink, size: 22),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: AppTheme.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const SocialButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: FaIcon(icon, size: 18, color: AppTheme.pink),
    );
  }
}
