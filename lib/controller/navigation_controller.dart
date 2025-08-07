import 'package:get/get.dart';

class NavigationController extends GetxController {
  // Track current screen for proper navigation
  var currentScreen = 'splash'.obs;
  
  // Track authentication state
  var isAuthenticated = false.obs;
  var hasCompletedOnboarding = false.obs;
  var hasSelectedSubscription = false.obs;
  
  // Navigation methods
  void navigateToPreLogin() {
    currentScreen.value = 'pre_login';
    Get.offAllNamed('/pre-login');
  }
  
  void navigateToLogin() {
    currentScreen.value = 'login';
    Get.toNamed('/login');
  }
  
  void navigateToSignUp() {
    currentScreen.value = 'signup';
    Get.toNamed('/signup');
  }
  
  void navigateToForgotPassword() {
    currentScreen.value = 'forgot_password';
    Get.toNamed('/forgot-password');
  }
  
  void navigateToForgotPasswordOtp() {
    currentScreen.value = 'forgot_password_otp';
    Get.toNamed('/forgot-password-otp');
  }
  
  void navigateToCreatePassword() {
    currentScreen.value = 'create_password';
    Get.toNamed('/create-password');
  }
  
  void navigateToSubscription() {
    currentScreen.value = 'subscription';
    Get.toNamed('/subscription');
  }
  
  void navigateToOnboarding() {
    currentScreen.value = 'onboarding';
    Get.offAllNamed('/onboarding');
  }
  
  void navigateToHome() {
    currentScreen.value = 'home';
    isAuthenticated.value = true;
    Get.offAllNamed('/home');
  }
  
  // Handle successful login/signup
  void handleSuccessfulAuth() {
    navigateToSubscription();
  }
  
  // Handle successful subscription
  void handleSuccessfulSubscription() {
    hasSelectedSubscription.value = true;
    navigateToOnboarding();
  }
  
  // Handle successful password reset
  void handleSuccessfulPasswordReset() {
    navigateToHome();
  }
} 