import 'package:flutter/material.dart';
import 'onboarding_quiz1_reason_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../widgets/inter_text.dart';

class OnboardingQuiz1Screen extends StatelessWidget {
  const OnboardingQuiz1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121A28),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              // Progress bar
              LinearPercentIndicator(
                percent: 0.25,
                lineHeight: 8,
                barRadius: const Radius.circular(10),
                backgroundColor: const Color(0xFF303A48),
                linearGradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF06B6D4)]),
              ),
              const SizedBox(height: 12),
              // Step indicator
              const Center(child: Text('Step 1 of 4', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 16))),
              const SizedBox(height: 32),
              // Title
              const InterText(
                'Your Rivr Budget Is Permission to Succeed',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(height: 16),
              // Subtitle
              const Text(
                'This is your moment to commit to lasting change. Not someday. No later. Right now.',
                style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 28),
              // Commitments
              const Text('By continuing, I commit to:', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 18),
              _CommitmentItem(text: 'This is your moment to commit to lasting change. Not someday. No later. Right now.'),
              const SizedBox(height: 12),
              _CommitmentItem(text: 'Building better habits that support the life I want'),
              const SizedBox(height: 12),
              _CommitmentItem(text: 'Following through—even when it\'s hard'),
              const SizedBox(height: 12),
              _CommitmentItem(text: 'Making this the last budget I\'ll ever need to start'),
              const Spacer(),
              // Call-to-action button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(colors: [Color(0xFF008FED), Color(0xFF00D1E9)]),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingQuiz1ReasonScreen()));
                    },
                    child: const Text(
                      'I Commit to Changing My Life\n With A Rivr Budget',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              // Bottom description
              const Center(
                child: Text(
                  'This is more than a budget. You\'re no longer just hoping things will change - you\'re making it happen.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class _CommitmentItem extends StatelessWidget {
  final String text;
  const _CommitmentItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          width: 22,
          height: 22,
          decoration: const BoxDecoration(color: Color(0xFF00A3FF), shape: BoxShape.circle),
          child: const Icon(Icons.check, color: Colors.white, size: 16),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400))),
      ],
    );
  }
}
