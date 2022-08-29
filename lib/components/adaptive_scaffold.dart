import 'package:flutter/material.dart';

class AdaptiveScaffold extends StatelessWidget {
  final Widget full;
  final Widget compact;

  const AdaptiveScaffold({
    required this.full,
    required this.compact,
    super.key,
  });

  factory AdaptiveScaffold.single({required Widget body}) {
    return AdaptiveScaffold(full: body, compact: body);
  }

  factory AdaptiveScaffold.multi({
    required Widget full,
    required Widget compact,
  }) {
    return AdaptiveScaffold(full: full, compact: compact);
  }

  @override
  Widget build(Object context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.isMobile) {
        return Scaffold(body: compact);
      } else {
        return Scaffold(body: full);
      }
    });
  }
}

extension BreakpointUtils on BoxConstraints {
  bool get isTablet => maxWidth > 730;
  bool get isDesktop => maxWidth > 1200;
  bool get isMobile => !isTablet && !isDesktop;
}
