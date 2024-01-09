// ignore_for_file: avoid_redundant_argument_values

import 'dart:async';
import 'dart:math' as math;

import 'package:deriv_auth/core/extensions/context_extension.dart';
import 'package:deriv_auth/core/helpers/semantic_labels.dart';
import 'package:deriv_auth/features/get_started/models/deriv_get_started_slide_model.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/deriv_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// An onboarding page which showcases key features of the app.
class DerivGetStartedLayout extends StatefulWidget {
  /// Initializes [DerivGetStartedLayout].
  const DerivGetStartedLayout({
    required this.slides,
    required this.appLogoIconPath,
    required this.backgroundImagePath,
    required this.onLoginTapped,
    required this.onSignupTapped,
    required this.onTapNavigation,
    Key? key,
  }) : super(key: key);

  /// Path to the app logo icon.
  final String appLogoIconPath;

  /// Path to the background image.
  final String backgroundImagePath;

  /// List of slides to be shown.
  final List<DerivGetStartedSlideModel> slides;

  /// Callback to be called when login button is tapped.
  final VoidCallback onLoginTapped;

  /// Callback to be called when signup button is tapped.
  final VoidCallback onSignupTapped;

  /// Navigation to be called when screen is tapped seven times.
  final VoidCallback onTapNavigation;

  @override
  State<DerivGetStartedLayout> createState() => _DerivGetStartedLayoutState();
}

class _DerivGetStartedLayoutState extends State<DerivGetStartedLayout> {
  static const Duration _autoScrollInterval = Duration(seconds: 4);
  static const Duration _scrollAnimationDuration = Duration(seconds: 1);
  static const Alignment _slideImageAlignment = Alignment.center;
  static const double _slideImageSize = 340;
  static const double _rotationAnimationAngle = math.pi / 2;

  late final PageController _pageController;
  late Timer _autoScrollTimer;

  double get _sliderPageOffset => _pageController.page ?? 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _autoScrollTimer = _buildNewScrollTimer();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.colors.primary,
        appBar: _buildAppBar(context),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: <Widget>[
                    _buildBackground(),
                    _buildSlider(),
                  ],
                ),
              ),
              // ),
              Padding(
                padding: const EdgeInsets.all(ThemeProvider.margin24),
                child: _buildPageIndicator(),
              ),
              Container(
                color: context.theme.colors.secondary,
                padding: const EdgeInsets.all(ThemeProvider.margin16),
                child: _buildButtons(),
              )
            ],
          ),
        ),
      );

  void _resetScrollTimer() {
    _autoScrollTimer.cancel();
    _autoScrollTimer = _buildNewScrollTimer();
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) => AppBar(
        backgroundColor: context.theme.colors.secondary,
        centerTitle: false,
        title: AppSettingGestureDetector(
            onTapNavigation: widget.onTapNavigation,
            child: SvgPicture.asset(widget.appLogoIconPath)),
      );

  Timer _buildNewScrollTimer() => Timer.periodic(
        _autoScrollInterval,
        (_) => _pageController.animateToPage((_sliderPageOffset + 1).round(),
            duration: _scrollAnimationDuration, curve: Curves.easeInOutCubic),
      );

  Widget _buildPageIndicator() => AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? child) {
        final int index = _pageController.hasClients
            ? _sliderPageOffset.round() % widget.slides.length
            : 0;

        return AnimatedSmoothIndicator(
          activeIndex: index,
          count: widget.slides.length,
          effect: WormEffect(
            dotWidth: ThemeProvider.margin08,
            dotHeight: ThemeProvider.margin08,
            dotColor: context.theme.colors.coral.withOpacity(0.16),
            activeDotColor: context.theme.colors.coral,
          ),
        );
      });

  Widget _buildButtons() => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Semantics(
            explicitChildNodes: true,
            label: SemanticsLabels.starterPageSignupButtonSemantic,
            child: PrimaryButton(
              onPressed: widget.onSignupTapped,
              child: Center(
                child: Text(
                  context.localization.actionGetAFreeAccount,
                  style: context.theme.textStyle(
                    textStyle: TextStyles.body2,
                    color: context.theme.colors.prominent,
                  ),
                ),
              ),
            ),
          ),
          Semantics(
            explicitChildNodes: true,
            label: SemanticsLabels.starterPageLoginButtonSemantic,
            child: SecondaryButton(
              onPressed: widget.onLoginTapped,
              child: Center(
                child: Text(
                  context.localization.actionLogin,
                  style: context.theme.textStyle(
                    textStyle: TextStyles.body2,
                    color: context.theme.colors.prominent,
                  ),
                ),
              ),
            ),
          )
        ],
      );

  Widget _buildSlider() => Listener(
        onPointerDown: (_) => _autoScrollTimer.cancel(),
        onPointerUp: (_) => _resetScrollTimer(),
        child: PageView.builder(
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) => widget.slides
              .map(
                (DerivGetStartedSlideModel slide) => _buildSliderItem(
                  assetName: slide.imagePath,
                  supportingText: slide.supportingText,
                ),
              )
              .toList()[index % widget.slides.length],
        ),
      );

  Widget _buildBackground() => AnimatedBuilder(
        animation: _pageController,
        builder: (BuildContext context, Widget? child) {
          final double angle = _pageController.hasClients
              ? -_sliderPageOffset * _rotationAnimationAngle
              : 0;

          return Align(
            alignment: _slideImageAlignment,
            child: SizedBox(
              height: _slideImageSize,
              width: _slideImageSize,
              child: Transform.rotate(
                angle: angle,
                child: child,
              ),
            ),
          );
        },
        child: SvgPicture.asset(
          widget.backgroundImagePath,
        ),
      );

  Widget _buildSliderItem({
    required String assetName,
    required String supportingText,
  }) =>
      Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Align(
            alignment: _slideImageAlignment,
            child: SizedBox(
              height: _slideImageSize,
              width: _slideImageSize,
              child: SvgPicture.asset(assetName),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              supportingText,
              style: context.theme.textStyle(
                textStyle: TextStyles.title,
                color: context.theme.colors.general,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );

  @override
  void dispose() {
    _pageController.dispose();
    _autoScrollTimer.cancel();

    super.dispose();
  }
}
