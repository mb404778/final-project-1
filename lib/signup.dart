import 'package:final_project/login.dart'; // تأكد من أن هذا المسار صحيح
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  String gender = 'Male'; // نستخدم RadioButton لاختيار الجنس
  String dropDownValue = 'Single';
  double sliderValue = 20;
  bool light = false;
  bool _obscureText = true; // لتخزين حالة إخفاء النص أو إظهاره
  bool _obscureTextConfirm = true; // لإخفاء كلمة المرور المؤكدة
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // إضافة الخلفية المتدرجة
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)], // ألوان التدرج
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.white70,
                        size: 28,
                      ),
                      hintText: 'Enter your full name',
                      hintStyle: const TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white70),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.white70,
                        size: 28,
                      ),
                      hintText: 'Enter your email address',
                      hintStyle: const TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white70),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: _obscureText,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.white70,
                        size: 28,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.white70,
                          size: 24,
                        ),
                      ),
                      hintText: 'Enter your password',
                      hintStyle: const TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white70),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: _obscureTextConfirm,
                    onChanged: (value) {
                      setState(() {
                        confirmPassword = value;
                      });
                    },
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.white70,
                        size: 28,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureTextConfirm = !_obscureTextConfirm;
                          });
                        },
                        icon: Icon(
                          _obscureTextConfirm
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.white70,
                          size: 24,
                        ),
                      ),
                      hintText: 'Re-enter your password',
                      hintStyle: const TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white70),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text(
                        'Gender: ',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(width: 40),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Male',
                            groupValue: gender,
                            onChanged: (String? value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                            activeColor: Colors.white,
                          ),
                          const Text(
                            'Male',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Female',
                            groupValue: gender,
                            onChanged: (String? value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                            activeColor: Colors.white,
                          ),
                          const Text(
                            'Female',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Text(
                        'Age: ${sliderValue.toInt()}',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Slider(
                        min: 0,
                        max: 100,
                        value: sliderValue,
                        onChanged: (newValue) {
                          setState(() {
                            sliderValue = newValue;
                          });
                        },
                        activeColor: Colors.white,
                        inactiveColor: Colors.white70,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text(
                        'Receive Notification',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const Spacer(),
                      Switch.adaptive(
                        value: light,
                        onChanged: (value) {
                          setState(() {
                            light = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      if (name.isEmpty ||
                          email.isEmpty ||
                          password.isEmpty ||
                          confirmPassword.isEmpty ||
                          gender.isEmpty ||
                          sliderValue == 0) {
                        // التحقق من إدخال جميع الحقول
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Please fill in all fields before proceeding.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                        return;
                      }

                      if (password != confirmPassword) {
                        // التحقق من تطابق كلمة المرور
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Passwords do not match!',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                        return;
                      }

                      // الانتقال إلى صفحة تسجيل الدخول إذا كانت كل البيانات صحيحة
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF2575FC),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
