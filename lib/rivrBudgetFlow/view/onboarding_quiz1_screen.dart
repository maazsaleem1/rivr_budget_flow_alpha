import 'package:flutter/material.dart';
import 'onboarding_quiz1_reason_screen.dart';

class OnboardingQuiz1Screen extends StatelessWidget {
  const OnboardingQuiz1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F2937),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              // Progress bar
              LinearProgressIndicator(
                value: 0.25,
                backgroundColor: Color(0xFF303A48),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF06B6D4)),
                minHeight: 8,
              ),
              const SizedBox(height: 24),
              // Step indicator
              const Center(child: Text('Step 1 of 4', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 16))),
              const SizedBox(height: 32),
              // Title
              const Text(
                'Your Rivr Budget Is Permission to Succeed',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
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
