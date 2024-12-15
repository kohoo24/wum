import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';

class PlaceAddScreen extends StatefulWidget {
  const PlaceAddScreen({super.key});

  @override
  State<PlaceAddScreen> createState() => _PlaceAddScreenState();
}

class _PlaceAddScreenState extends State<PlaceAddScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  String _selectedCategory = '맛집';
  bool _isLoading = false;

  final _categories = ['맛집', '카페', '술집'];

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _handleAdd() async {
    // TODO: 장소 추가 처리
    setState(() => _isLoading = true);

    // 임시로 2초 후 이전 화면으로 이동
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    setState(() => _isLoading = false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.gradientSurface,
              ),
            ),
          ),
          // Main content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildImageUpload(),
                        const SizedBox(height: 32),
                        _buildForm(),
                      ],
                    ),
                  ),
                ),
                _buildBottomButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          GlassmorphicContainer(
            width: 48,
            height: 48,
            borderRadius: 16,
            blur: 10,
            border: 1,
            linearGradient: LinearGradient(
              colors: [
                AppColors.glassEffect.withOpacity(0.1),
                AppColors.glassEffect.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderGradient: LinearGradient(
              colors: [
                AppColors.glassBorder.withOpacity(0.1),
                AppColors.glassBorder.withOpacity(0.3),
              ],
            ),
            child: IconButton(
              icon: Icon(PhosphorIcons.caretLeft(PhosphorIconsStyle.regular)),
              onPressed: () => Navigator.pop(context),
              color: AppColors.textPrimary,
            ),
          ).animate().fadeIn().scale(),
          const SizedBox(width: 16),
          const Text(
            '새로운 장소 추가',
            style: AppTypography.titleLarge,
          ).animate().fadeIn().slideX(),
        ],
      ),
    );
  }

  Widget _buildImageUpload() {
    return GlassmorphicContainer(
      width: double.infinity,
      height: 200,
      borderRadius: 24,
      blur: 10,
      border: 1,
      linearGradient: const LinearGradient(
        colors: AppColors.gradientPrimary,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          AppColors.glassBorder.withOpacity(0.1),
          AppColors.glassBorder.withOpacity(0.3),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            PhosphorIcons.image(PhosphorIconsStyle.regular),
            size: 48,
            color: AppColors.primary.withOpacity(0.5),
          ),
          Positioned(
            bottom: 16,
            child: GlassmorphicContainer(
              width: 120,
              height: 40,
              borderRadius: 20,
              blur: 10,
              border: 1,
              linearGradient: LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.primary.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderGradient: LinearGradient(
                colors: [
                  AppColors.glassBorder.withOpacity(0.1),
                  AppColors.glassBorder.withOpacity(0.3),
                ],
              ),
              child: Center(
                child: Text(
                  '사진 추가',
                  style: AppTypography.labelLarge.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn().scale();
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: _nameController,
          label: '장소 이름',
          hint: '장소 이름을 입력해주세요',
          prefixIcon:
              Icon(PhosphorIcons.storefront(PhosphorIconsStyle.regular)),
        ).animate().fadeIn().slideX(),
        const SizedBox(height: 24),
        CustomTextField(
          controller: _addressController,
          label: '주소',
          hint: '주소를 입력해주세요',
          maxLines: 2,
          prefixIcon: Icon(PhosphorIcons.mapPin(PhosphorIconsStyle.regular)),
        ).animate().fadeIn().slideX(),
        const SizedBox(height: 24),
        Text(
          '카테고리',
          style: AppTypography.labelLarge.copyWith(
            color: AppColors.textSecondary,
          ),
        ).animate().fadeIn(),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _categories.map((category) {
            final isSelected = _selectedCategory == category;
            return GlassmorphicContainer(
              width: 100,
              height: 40,
              borderRadius: 20,
              blur: 10,
              border: 1,
              linearGradient: LinearGradient(
                colors: isSelected
                    ? AppColors.gradientPrimary
                    : [
                        AppColors.glassEffect.withOpacity(0.1),
                        AppColors.glassEffect.withOpacity(0.05),
                      ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderGradient: LinearGradient(
                colors: [
                  AppColors.glassBorder.withOpacity(0.1),
                  AppColors.glassBorder.withOpacity(0.3),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Center(
                    child: Text(
                      category,
                      style: AppTypography.labelMedium.copyWith(
                        color:
                            isSelected ? Colors.white : AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ).animate().fadeIn().scale();
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBottomButton() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: CustomButton(
        text: '추가하기',
        onPressed: _handleAdd,
        isLoading: _isLoading,
      ).animate().fadeIn().slideY(begin: 0.2),
    );
  }
}
