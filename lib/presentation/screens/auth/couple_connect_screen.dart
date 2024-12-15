import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';
import '../main/main_screen.dart';

class CoupleConnectScreen extends StatefulWidget {
  const CoupleConnectScreen({super.key});

  @override
  State<CoupleConnectScreen> createState() => _CoupleConnectScreenState();
}

class _CoupleConnectScreenState extends State<CoupleConnectScreen> {
  final _codeController = TextEditingController();
  String _generatedCode = '';
  bool _isLoading = false;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _handleGenerateCode() async {
    // TODO: 실제 코드 생성 로직 구현
    setState(() => _isLoading = true);

    // 임시로 2초 후 랜덤 코드 생성
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _generatedCode = '123456'; // 실제로는 서버에서 생성된 코드를 받아와야 함
    });
  }

  void _handleConnect() async {
    // TODO: 실제 커플 연동 처리
    setState(() => _isLoading = true);

    // 임시로 2초 후 메인 화면으로 이동
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    setState(() => _isLoading = false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('커플 연동'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text(
                '커플과 연동하기',
                style: AppTypography.displayLarge.copyWith(
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                '상대방의 코드를 입력하거나\n내 코드를 공유해서 연동해보세요',
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              if (_generatedCode.isEmpty) ...[
                CustomButton(
                  text: '내 코드 생성하기',
                  onPressed: _handleGenerateCode,
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: AppColors.divider,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('또는'),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: AppColors.divider,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ] else ...[
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.cardBorder,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        '내 코드',
                        style: AppTypography.labelLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _generatedCode,
                        style: AppTypography.displayLarge.copyWith(
                          color: AppColors.primary,
                          letterSpacing: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
              CustomTextField(
                controller: _codeController,
                label: '상대방 코드',
                hint: '상대방의 코드를 입력해주세요',
                keyboardType: TextInputType.number,
                prefixIcon: Icon(PhosphorIcons.key(PhosphorIconsStyle.regular)),
              ),
              const Spacer(),
              CustomButton(
                text: '연동하기',
                onPressed: _handleConnect,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
