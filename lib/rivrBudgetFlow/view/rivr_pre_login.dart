// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import '../../../controller/navigation_controller.dart';
// import '../../widgets/inter_text.dart';

// class RivrPreLoginScreen extends StatelessWidget {
//   const RivrPreLoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF121A28),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 children: [
//                   const SizedBox(height: 8),
//                   // Logo in circle
//                   Center(
//                     child: Container(
//                       width: 220,
//                       height: 220,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         // color: const Color(0xFF23242A),
//                       ),
//                       child: Center(child: Image.asset('assets/images/preLoginLogo.png', width: 220, height: 220)),
//                     ),
//                   ),
//                   const SizedBox(height: 28),
//                   // App name
//                   const InterText('Rivr BudgetFlow', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
//                   const SizedBox(height: 16),
//                   // Page indicator
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFF008FED), shape: BoxShape.circle)),
//                       const SizedBox(width: 6),
//                       Container(width: 10, height: 10, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
//                       const SizedBox(width: 6),
//                       Container(width: 10, height: 10, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   // Google login button
//                   SizedBox(
//                     width: double.infinity,
//                     height: 54,
//                     child: ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF1F2937),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                         elevation: 0,
//                       ),
//                       icon: SvgPicture.asset('assets/images/rivrGoogleIcon.svg', width: 24, height: 24),
//                       label: const InterText('Continue with Google', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
//                       onPressed: () {},
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   // Apple login button
//                   SizedBox(
//                     width: double.infinity,
//                     height: 54,
//                     child: ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF1F2937),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                         elevation: 0,
//                       ),
//                       icon: SvgPicture.asset('assets/images/rivrAppleIcon.svg', width: 24, height: 24),
//                       label: const InterText('Continue with Apple', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
//                       onPressed: () {},
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   // Divider with 'or'
//                   Row(
//                     children: [
//                       const Expanded(child: Divider(color: Colors.white24, thickness: 1)),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                         child: InterText('or', style: TextStyle(color: Colors.white54, fontWeight: FontWeight.w600, fontSize: 16)),
//                       ),
//                       const Expanded(child: Divider(color: Colors.white24, thickness: 1)),
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                   // Email login button with gradient
//                   SizedBox(
//                     width: double.infinity,
//                     height: 54,
//                     child: DecoratedBox(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         gradient: const LinearGradient(colors: [Color(0xFF008FED), Color(0xFF00D1E9)]),
//                       ),
//                       child: TextButton.icon(
//                         style: TextButton.styleFrom(
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                         ),
//                         icon: SvgPicture.asset('assets/images/rivrEmailIcon.svg', width: 24, height: 24),
//                         label: const InterText('Continue With Email', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
//                         onPressed: () {
//                           final navigationController = Get.find<NavigationController>();
//                           navigationController.navigateToLogin();
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   // Already have an account link
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text('Already have an account? ', style: TextStyle(color: Colors.white70, fontSize: 15)),
//                       GestureDetector(
//                         onTap: () {
//                           final navigationController = Get.find<NavigationController>();
//                           navigationController.navigateToLogin();
//                         },
//                         child: const Text('Sign In', style: TextStyle(color: Color(0xFF00D1E9), fontWeight: FontWeight.bold, fontSize: 15)),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                   // Remove the dollar image from here
//                   // const Spacer(),
//                 ],
//               ),
//             ),
//             // Dollar image always at the bottom
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Image.asset(
//                 'assets/images/pre_login_dollar.png',
//                 width: double.infinity,
//                 height: 90,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../controller/navigation_controller.dart';
import '../../widgets/inter_text.dart';

class RivrPreLoginScreen extends StatefulWidget {
  const RivrPreLoginScreen({super.key});

  @override
  State<RivrPreLoginScreen> createState() => _RivrPreLoginScreenState();
}

class _RivrPreLoginScreenState extends State<RivrPreLoginScreen> {
  int _currentIndex = 0;

  final List<String> _carouselTexts = [
    'Rivr BudgetFlow',
    'Ad-Free Budgeting',
    '15-Day Free Trial',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121A28),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 0),
                  // Static logo
                  Container(
                    width: 220,
                    height: 220,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset('assets/images/preLoginLogo.png', width: 180, height: 180),
                    ),
                  ),
                 // const SizedBox(height: 10),
                  // Carousel for text only
                  CarouselSlider.builder(
                    itemCount: _carouselTexts.length,
                    itemBuilder: (context, index, realIndex) {
                      return InterText(
                        _carouselTexts[index], 
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)
                      );
                    },
                    options: CarouselOptions(
                      height: 40,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_carouselTexts.length, (index) {
                      return Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index ? const Color(0xFF008FED) : Colors.white,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  // Google login button
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F2937),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      icon: SvgPicture.asset('assets/images/rivrGoogleIcon.svg', width: 24, height: 24),
                      label: const InterText('Continue with Google', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Apple login button
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F2937),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      icon: SvgPicture.asset('assets/images/rivrAppleIcon.svg', width: 24, height: 24),
                      label: const InterText('Continue with Apple', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Divider with 'or'
                  Row(
                    children: [
                      const Expanded(child: Divider(color: Colors.white24, thickness: 1)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: InterText('or', style: const TextStyle(color: Colors.white54, fontWeight: FontWeight.w600, fontSize: 16)),
                      ),
                      const Expanded(child: Divider(color: Colors.white24, thickness: 1)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Email login button
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(colors: [Color(0xFF008FED), Color(0xFF00D1E9)]),
                      ),
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        icon: SvgPicture.asset('assets/images/rivrEmailIcon.svg', width: 24, height: 24),
                        label: const InterText('Continue With Email', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                        onPressed: () {
                          final navigationController = Get.find<NavigationController>();
                          navigationController.navigateToLogin();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Already have an account link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? ', style: TextStyle(color: Colors.white70, fontSize: 15)),
                      GestureDetector(
                        onTap: () {
                          final navigationController = Get.find<NavigationController>();
                          navigationController.navigateToLogin();
                        },
                        child: const Text('Sign In', style: TextStyle(color: Color(0xFF00D1E9), fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            // Dollar image at the bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/pre_login_dollar.png',
                width: double.infinity,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
