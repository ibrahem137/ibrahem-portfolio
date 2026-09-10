import 'package:flutter/material.dart';

class HoverCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double hoverOffset;
  final double hoverScale;
  final Duration duration;
  final BorderRadius? borderRadius;

  const HoverCard({
    super.key,
    required this.child,
    this.onTap,
    this.hoverOffset = 6,
    this.hoverScale = 1.01,
    this.duration = const Duration(milliseconds: 180),
    this.borderRadius,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final radius = widget.borderRadius ?? BorderRadius.circular(16);

    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) {
        if (!_isHovered) {
          setState(() => _isHovered = true);
        }
      },
      onExit: (_) {
        if (_isHovered) {
          setState(() => _isHovered = false);
        }
      },
      child: AnimatedScale(
        scale: _isHovered ? widget.hoverScale : 1,
        duration: widget.duration,
        curve: Curves.easeOutCubic,
        child: AnimatedSlide(
          offset: _isHovered
              ? Offset(0, -widget.hoverOffset / 100)
              : Offset.zero,
          duration: widget.duration,
          curve: Curves.easeOutCubic,
          child: Material(
            color: Theme.of(context).colorScheme.surface.withValues(alpha: 0),
            borderRadius: radius,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: radius,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
