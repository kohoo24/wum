import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';
import 'couple_connect_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nicknameController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nicknameController.dispose();
    super.dispose();
  }

  void _handleSignup() async {
    // TODO: 실제 회원가입 처리
    setState(() => _isLoading = true);

    // 임시로 2초 후 커플 연동 화면으로 이동
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    setState(() => _isLoading = false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const CoupleConnectScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text(
                '환영합니다!',
                style: AppTypography.headlineLarge.copyWith(
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                '회원가입 후 커플과 함께\n가고 싶은 곳을 공유해보세요',
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              CustomTextField(
                controller: _emailController,
                label: '이메일',
                hint: '이메일을 입력해주세요',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(PhosphorIcons.envelope()),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _passwordController,
                label: '비밀번호',
                hint: '비밀번호를 입력해주세요',
                obscureText: true,
                prefixIcon: Icon(PhosphorIcons.lock()),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _confirmPasswordController,
                label: '비밀번호 확인',
                hint: '비밀번호를 다시 입력해주세요',
                obscureText: true,
                prefixIcon: Icon(PhosphorIcons.lockKey()),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _nicknameController,
                label: '닉네임',
                hint: '닉네임을 입력해주세요',
                prefixIcon: Icon(PhosphorIcons.user()),
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: '회원가입',
                onPressed: _handleSignup,
                isLoading: _isLoading,
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: '로그인하기',
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
