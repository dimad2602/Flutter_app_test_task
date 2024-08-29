import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingOverlay extends StatefulWidget {
  final Widget child;

  const LoadingOverlay({super.key, required this.child});

  @override
  _LoadingOverlayState createState() => _LoadingOverlayState();

  static LoadingOverlay of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<LoadingOverlay>()!;
  }
}

class _LoadingOverlayState extends State<LoadingOverlay>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<bool> _isLoadingNotifier = ValueNotifier(true);
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    Future.delayed(const Duration(seconds: 3), () {
      if (_isLoadingNotifier.value) {
        _isLoadingNotifier.value = false;
        _animationController.dispose();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoadingNotifier,
      child: widget.child,
      builder: (context, isLoading, child) {
        if (isLoading) {
          return Stack(
            children: [
              child!,
              Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                          'lib/assets/animations/animation_example.json'),
                      const SizedBox(height: 20),
                      _buildLoadingBar(), // Полоса загрузки
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return child!;
        }
      },
    );
  }

  Widget _buildLoadingBar() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SizedBox(
          width: 200,
          height: 10,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 200 *
                      _animationController.value,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void show() {
    _isLoadingNotifier.value = true;
  }

  void hide() {
    _isLoadingNotifier.value = false;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}