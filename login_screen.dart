import 'package:elvator_app/lib/tech/screen/technician_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';
import 'owner/main_screen.dart';
import 'technician_signup_screen.dart';

enum UserRole { owner, technician }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscure = true;
  bool _isLoading = false;
  bool _rememberMe = false;
  UserRole _role = UserRole.owner;
  final int _activeFloor = 3;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(milliseconds: 1000));
      if (!mounted) return;
      setState(() => _isLoading = false);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => _role == UserRole.technician
              ? const TechnicianHomeScreen()
              : const MainScreen(),
        ),
      );
    }
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
            child: Form(
              key: _formKey,
              child: _GlassCard(
                c: c,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildMark(c),
                    const SizedBox(height: 28),
                    Text(
                      'Welcome back, Owner',
                      style: displayFont.copyWith(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: c.textPrimary,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sign in to manage your buildings, elevators\nand maintenance requests.',
                      style: bodyFont.copyWith(
                        fontSize: 13.5,
                        color: c.muted,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    _RoleToggle(
                      selected: _role,
                      bodyFont: bodyFont,
                      c: c,
                      onChanged: (r) => setState(() => _role = r),
                    ),
                    const SizedBox(height: 24),
                    _label('EMAIL', bodyFont, c),
                    const SizedBox(height: 8),
                    _InputField(
                      controller: _emailController,
                      hint: 'you@company.com',
                      icon: Icons.mail_outline_rounded,
                      bodyFont: bodyFont,
                      c: c,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    _label('PASSWORD', bodyFont, c),
                    const SizedBox(height: 8),
                    _InputField(
                      controller: _passwordController,
                      hint: '••••••••••',
                      icon: Icons.lock_outline_rounded,
                      obscure: _obscure,
                      bodyFont: bodyFont,
                      c: c,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      trailing: IconButton(
                        splashRadius: 18,
                        icon: Icon(
                          _obscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 19,
                          color: c.muted,
                        ),
                        onPressed: () => setState(() => _obscure = !_obscure),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Remember Me & Forgot Password Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => _rememberMe = !_rememberMe),
                          behavior: HitTestBehavior.opaque,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Checkbox(
                                  value: _rememberMe,
                                  onChanged: (val) => setState(() => _rememberMe = val ?? false),
                                  activeColor: c.gold,
                                  checkColor: Colors.black,
                                  side: BorderSide(color: c.panelBorder, width: 1.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Remember me',
                                style: bodyFont.copyWith(
                                  fontSize: 12.5,
                                  color: c.muted,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(4),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            child: Text(
                              'Forgot password?',
                              style: bodyFont.copyWith(
                                fontSize: 12.5,
                                color: c.goldSoft,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 26),
                    _SignInButton(
                      bodyFont: bodyFont,
                      c: c,
                      isLoading: _isLoading,
                      onPressed: _handleSignIn,
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        Expanded(child: Divider(color: c.panelBorder, thickness: 1)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text('or',
                              style: bodyFont.copyWith(color: c.muted, fontSize: 12)),
                        ),
                        Expanded(child: Divider(color: c.panelBorder, thickness: 1)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _GhostButton(
                      bodyFont: bodyFont,
                      c: c,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 28),
                    Center(
                      child: GestureDetector(
                        onTap: _role == UserRole.technician
                            ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const TechnicianSignUpScreen(),
                            ),
                          );
                        }
                            : () {},
                        child: RichText(
                          text: TextSpan(
                            style: bodyFont.copyWith(fontSize: 12.5, color: c.muted),
                            children: _role == UserRole.technician
                                ? [
                              const TextSpan(text: "New technician? "),
                              TextSpan(
                                text: 'Apply to join',
                                style: TextStyle(
                                  color: c.goldSoft,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ]
                                : [
                              const TextSpan(text: "Don't have access yet? "),
                              TextSpan(
                                text: 'Contact admin',
                                style: TextStyle(
                                  color: c.goldSoft,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
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
      letterSpacing: 1.2,
      color: c.muted,
      fontWeight: FontWeight.w600,
    ),
  );

  Widget _buildMark(AppColors c) {
    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [c.gold, c.gold.withOpacity(0.7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(Icons.apartment_rounded, color: Colors.black87, size: 24),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(3, (i) {
            final floor = 5 - i;
            final active = floor == _activeFloor;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: active ? c.gold : c.panelBorder,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'FL $floor',
                    style: TextStyle(
                      fontSize: 9,
                      letterSpacing: 0.6,
                      color: active ? c.goldSoft : c.muted.withOpacity(0.5),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _RoleToggle extends StatelessWidget {
  final UserRole selected;
  final TextStyle bodyFont;
  final AppColors c;
  final ValueChanged<UserRole> onChanged;

  const _RoleToggle({
    required this.selected,
    required this.bodyFont,
    required this.c,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final options = [
      (UserRole.owner, 'Owner', Icons.apartment_rounded),
      (UserRole.technician, 'Technician', Icons.engineering_outlined),
    ];
    return Row(
      children: options.map((opt) {
        final (role, label, icon) = opt;
        final active = role == selected;
        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(role),
            child: Container(
              margin: EdgeInsets.only(right: role == UserRole.owner ? 10 : 0),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: active ? c.gold.withOpacity(0.12) : c.panel,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: active ? c.gold : c.panelBorder),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 16, color: active ? c.goldSoft : c.muted),
                  const SizedBox(width: 7),
                  Text(
                    label,
                    style: bodyFont.copyWith(
                      fontSize: 13,
                      color: active ? c.goldSoft : c.muted,
                      fontWeight: active ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _GlassCard extends StatelessWidget {
  final Widget child;
  final AppColors c;

  const _GlassCard({required this.child, required this.c});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
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

class _SignInButton extends StatelessWidget {
  final TextStyle bodyFont;
  final AppColors c;
  final bool isLoading;
  final VoidCallback onPressed;

  const _SignInButton({
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
            BoxShadow(
              color: c.gold.withOpacity(0.25),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
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
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: c.bg,
                ),
              )
                  : Text(
                'Sign in',
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

class _GhostButton extends StatelessWidget {
  final TextStyle bodyFont;
  final AppColors c;
  final VoidCallback onPressed;

  const _GhostButton({
    required this.bodyFont,
    required this.c,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: c.panelBorder),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          'Use company SSO',
          style: bodyFont.copyWith(
            color: c.textPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}