import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CreatePassScreen extends StatefulWidget {
  const CreatePassScreen({Key? key}) : super(key: key);

  @override
  State<CreatePassScreen> createState() => _CreatePassScreenState();
}

class _CreatePassScreenState extends State<CreatePassScreen> {
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _repeatPassController = TextEditingController();
  bool _obscureNew = true;
  bool _obscureRepeat = true;

  @override
  void dispose() {
    _newPassController.dispose();
    _repeatPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121A28),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121A28),
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/images/rivrArrowBack.svg'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Create New Password',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  const Text(
                    'Create Your New Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'New Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _newPassController,
                    obscureText: _obscureNew,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                      filled: true,
                      fillColor: const Color(0xFF1F2937),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureNew ? Icons.visibility_off : Icons.visibility,
                          color: const Color(0xFF6B7280),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureNew = !_obscureNew;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Repeat Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _repeatPassController,
                    obscureText: _obscureRepeat,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
                      filled: true,
                      fillColor: const Color(0xFF1F2937),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureRepeat ? Icons.visibility_off : Icons.visibility,
                          color: const Color(0xFF6B7280),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureRepeat = !_obscureRepeat;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 34),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF008FED), Color(0xFF00D1E9)],
                    ),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: const Color(0xFF232B39),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/create_pass_success.png',
                                    width: 110,
                                    height: 110,
                                  ),
                                  const SizedBox(height: 24),
                                  Image.asset(
                                    'assets/images/congratulations_gradient.png',
                                    width: 180,
                                    height: 36,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 16),
                                  const Text(
                                    'Your account is ready to use. You\nwill be redirected to the Home\npage in a few seconds..',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  Image.asset(
                                    'assets/images/spin_icon.png',
                                    width: 38,
                                    height: 38,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
