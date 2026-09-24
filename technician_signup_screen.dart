import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

/// A technician doesn't get an account instantly — they submit an
/// application (name, contact info, specialty, experience) that an admin
/// reviews before granting access. This screen only handles the submission
/// step; approval/rejection would happen on a backend + admin screen that
/// doesn't exist yet in this prototype.
class TechnicianSignUpScreen extends StatefulWidget {
  const TechnicianSignUpScreen({super.key});

  @override
  State<TechnicianSignUpScreen> createState() => _TechnicianSignUpScreenState();
}

class _TechnicianSignUpScreenState extends State<TechnicianSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _experienceController = TextEditingController();
  final _noteController = TextEditingController();

  String? _specialty;
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _submitting = false;
  bool _submitted = false;

  static const _specialties = [
    'Elevator systems',
    'Electrical',
    'General maintenance',
    'HVAC',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    _experienceController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final formOk = _formKey.currentState?.validate() ?? false;
    if (!formOk || _specialty == null) {
      if (_specialty == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a specialty')),
        );
      }
      return;
    }
    setState(() => _submitting = true);
    await Future.delayed(const Duration(milliseconds: 1000));
    if (!mounted) return;
    setState(() {
      _submitting = false;
      _submitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final displayFont = GoogleFonts.spaceGrotesk();
    final bodyFont = GoogleFonts.inter();

    return Scaffold(
      backgroundColor: c.bg,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: _GlassCard(
              c: c,
              child: _submitted
                  ? _SuccessState(displayFont: displayFont, bodyFont: bodyFont, c: c)
                  : Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () => Navigator.of(context).maybePop(),
                          icon: Icon(Icons.arrow_back_ios_new_rounded,
                              size: 16, color: c.muted),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            gradient: LinearGradient(
                              colors: [c.gold, const Color(0xFF8A6A32)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Icon(Icons.engineering_outlined, color: c.onGold, size: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Apply as a Technician',
                      style: displayFont.copyWith(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: c.textPrimary,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tell us about yourself. An admin will review your '
                          'application and reach out once it\'s approved.',
                      style: bodyFont.copyWith(fontSize: 13, color: c.muted, height: 1.5),
                    ),
                    const SizedBox(height: 28),
                    _label('FULL NAME', bodyFont, c),
                    const SizedBox(height: 8),
                    _InputField(
                      controller: _nameController,
                      hint: 'Youssef Mahmoud',
                      icon: Icons.person_outline_rounded,
                      bodyFont: bodyFont,
                      c: c,
                      validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Please enter your name' : null,
                    ),
                    const SizedBox(height: 18),
                    _label('EMAIL', bodyFont, c),
                    const SizedBox(height: 8),
                    _InputField(
                      controller: _emailController,
                      hint: 'you@example.com',
                      icon: Icons.mail_outline_rounded,
                      bodyFont: bodyFont,
                      c: c,
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Please enter your email';
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 18),
                    _label('PHONE NUMBER', bodyFont, c),
                    const SizedBox(height: 8),
                    _InputField(
                      controller: _phoneController,
                      hint: '+20 10 1234 5678',
                      icon: Icons.call_outlined,
                      bodyFont: bodyFont,
                      c: c,
                      keyboardType: TextInputType.phone,
                      validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Please enter your phone number' : null,
                    ),
                    const SizedBox(height: 18),
                    _label('SPECIALTY', bodyFont, c),
                    const SizedBox(height: 8),
                    _SpecialtyField(
                      value: _specialty,
                      options: _specialties,
                      bodyFont: bodyFont,
                      c: c,
                      onChanged: (v) => setState(() => _specialty = v),
                    ),
                    const SizedBox(height: 18),
                    _label('YEARS OF EXPERIENCE', bodyFont, c),
                    const SizedBox(height: 8),
                    _InputField(
                      controller: _experienceController,
                      hint: 'e.g. 4',
                      icon: Icons.workspace_premium_outlined,
                      bodyFont: bodyFont,
                      c: c,
                      keyboardType: TextInputType.number,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) return 'Please enter years of experience';
                        if (int.tryParse(v.trim()) == null) return 'Enter a number';
                        return null;
                      },
                    ),
                    const SizedBox(height: 18),
                    _label('PASSWORD', bodyFont, c),
                    const SizedBox(height: 8),
                    _InputField(
                      controller: _passwordController,
                      hint: '••••••••••',
                      icon: Icons.lock_outline_rounded,
                      obscure: _obscurePassword,
                      bodyFont: bodyFont,
                      c: c,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Please enter a password';
                        if (v.length < 6) return 'Password must be at least 6 characters';
                        return null;
                      },
                      trailing: IconButton(
                        splashRadius: 18,
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 19,
                          color: c.muted,
                        ),
                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                    const SizedBox(height: 18),
                    _label('CONFIRM PASSWORD', bodyFont, c),
                    const SizedBox(height: 8),
                    _InputField(
                      controller: _confirmController,
                      hint: '••••••••••',
                      icon: Icons.lock_outline_rounded,
                      obscure: _obscureConfirm,
                      bodyFont: bodyFont,
                      c: c,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Please confirm your password';
                        if (v != _passwordController.text) return 'Passwords don\'t match';
                        return null;
                      },
                      trailing: IconButton(
                        splashRadius: 18,
                        icon: Icon(
                          _obscureConfirm
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 19,
                          color: c.muted,
                        ),
                        onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                      ),
                    ),
                    const SizedBox(height: 18),
                    _label('WHY DO YOU WANT TO JOIN? (OPTIONAL)', bodyFont, c),
                    const SizedBox(height: 8),
                    _NoteField(controller: _noteController, bodyFont: bodyFont, c: c),
                    const SizedBox(height: 28),
                    _SubmitButton(
                      bodyFont: bodyFont,
                      c: c,
                      isLoading: _submitting,
                      onPressed: _submit,
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        'Already applied? Sign in once your application is approved.',
                        textAlign: TextAlign.center,
                        style: bodyFont.copyWith(fontSize: 11.5, color: c.muted),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _label(String text, TextStyle font, AppColors c) => Text(
    text,
    style: font.copyWith(
      fontSize: 11,
      letterSpacing: 1.0,
      color: c.muted,
      fontWeight: FontWeight.w600,
    ),
  );
}

// ---- Success state ----------------------------------------------------------
class _SuccessState extends StatelessWidget {
  final TextStyle displayFont;
  final TextStyle bodyFont;
  final AppColors c;
  const _SuccessState({required this.displayFont, required this.bodyFont, required this.c});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: c.green.withOpacity(0.12),
          ),
          child: Icon(Icons.check_circle_outline_rounded, color: c.green, size: 34),
        ),
        const SizedBox(height: 20),
        Text(
          'Application submitted',
          style: displayFont.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: c.textPrimary),
        ),
        const SizedBox(height: 10),
        Text(
          'Thanks for applying. An admin will review your details and '
              'contact you by email once your account is approved.',
          textAlign: TextAlign.center,
          style: bodyFont.copyWith(fontSize: 13, color: c.muted, height: 1.5),
        ),
        const SizedBox(height: 28),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: c.panelBorder),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text('Back to login',
                style: bodyFont.copyWith(
                    color: c.textPrimary, fontWeight: FontWeight.w600, fontSize: 14)),
          ),
        ),
      ],
    );
  }
}

// ---- Shared small widgets, matching login_screen's style --------------------
class _GlassCard extends StatelessWidget {
  final Widget child;
  final AppColors c;
  const _GlassCard({required this.child, required this.c});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 460),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      decoration: BoxDecoration(
        color: c.panel,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: c.panelBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscure;
  final Widget? trailing;
  final TextStyle bodyFont;
  final AppColors c;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _InputField({
    required this.controller,
    required this.hint,
    required this.icon,
    required this.bodyFont,
    required this.c,
    this.obscure = false,
    this.trailing,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      validator: validator,
      style: bodyFont.copyWith(color: c.textPrimary, fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: bodyFont.copyWith(color: c.muted.withOpacity(0.6), fontSize: 14),
        prefixIcon: Icon(icon, size: 19, color: c.muted),
        suffixIcon: trailing,
        filled: true,
        fillColor: c.panel.withOpacity(0.5),
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: c.panelBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: c.gold, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: c.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: c.red, width: 1.5),
        ),
        errorStyle: bodyFont.copyWith(fontSize: 11, color: c.red),
      ),
    );
  }
}

class _SpecialtyField extends StatelessWidget {
  final String? value;
  final List<String> options;
  final TextStyle bodyFont;
  final AppColors c;
  final ValueChanged<String?> onChanged;

  const _SpecialtyField({
    required this.value,
    required this.options,
    required this.bodyFont,
    required this.c,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: c.panel.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: c.panelBorder),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            icon: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Icon(Icons.keyboard_arrow_down_rounded, color: c.muted),
            ),
            hint: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Icon(Icons.build_outlined, size: 19, color: c.muted),
                  const SizedBox(width: 10),
                  Text('Select specialty',
                      style: bodyFont.copyWith(color: c.muted.withOpacity(0.6), fontSize: 14)),
                ],
              ),
            ),
            dropdownColor: c.panel,
            borderRadius: BorderRadius.circular(12),
            items: options
                .map((e) => DropdownMenuItem(
              value: e,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(e, style: bodyFont.copyWith(color: c.textPrimary, fontSize: 14)),
              ),
            ))
                .toList(),
            onChanged: onChanged,
            selectedItemBuilder: (context) => options
                .map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  Icon(Icons.build_outlined, size: 19, color: c.goldSoft),
                  const SizedBox(width: 10),
                  Text(e, style: bodyFont.copyWith(color: c.textPrimary, fontSize: 14)),
                ],
              ),
            ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _NoteField extends StatelessWidget {
  final TextEditingController controller;
  final TextStyle bodyFont;
  final AppColors c;
  const _NoteField({required this.controller, required this.bodyFont, required this.c});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: c.panel.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: c.panelBorder),
      ),
      child: TextField(
        controller: controller,
        maxLines: 3,
        minLines: 3,
        style: bodyFont.copyWith(color: c.textPrimary, fontSize: 14, height: 1.4),
        decoration: InputDecoration(
          hintText: 'A few words about your background or motivation…',
          hintStyle: bodyFont.copyWith(color: c.muted.withOpacity(0.6), fontSize: 13.5),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(14),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final TextStyle bodyFont;
  final AppColors c;
  final bool isLoading;
  final VoidCallback onPressed;

  const _SubmitButton({
    required this.bodyFont,
    required this.c,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(colors: [c.gold, c.gold.withOpacity(0.8)]),
          boxShadow: [
            BoxShadow(color: c.gold.withOpacity(0.25), blurRadius: 18, offset: const Offset(0, 8)),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: isLoading ? null : onPressed,
            child: Center(
              child: isLoading
                  ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2.5, color: c.bg),
              )
                  : Text(
                'Submit application',
                style: bodyFont.copyWith(
                  color: Colors.black.withOpacity(0.85),
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}