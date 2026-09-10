import 'package:flutter/material.dart';

class RevealOnScroll extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final double offset;
  final double revealPoint;

  const RevealOnScroll({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 550),
    this.delay = Duration.zero,
    this.offset = 24,
    this.revealPoint = 0.90,
  });

  @override
  State<RevealOnScroll> createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll> {
  ScrollPosition? _scrollPosition;

  bool _visible = false;
  bool _scheduled = false;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: _visible ? 1 : 0),
      duration: widget.duration,
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, widget.offset * (1 - value)),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final position = Scrollable.maybeOf(context)?.position;

    if (_scrollPosition != position) {
      _scrollPosition?.removeListener(_checkVisibility);

      _scrollPosition = position;
      _scrollPosition?.addListener(_checkVisibility);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      _checkVisibility();
    });
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_checkVisibility);

    super.dispose();
  }

  void _checkVisibility() {
    if (!mounted || _visible || _scheduled) {
      return;
    }

    final mediaQuery = MediaQuery.maybeOf(context);

    if (mediaQuery?.disableAnimations ?? false) {
      setState(() => _visible = true);
      return;
    }

    final renderObject = context.findRenderObject();

    if (renderObject is! RenderBox || !renderObject.hasSize) {
      return;
    }

    final viewportHeight = MediaQuery.sizeOf(context).height;

    final top = renderObject.localToGlobal(Offset.zero).dy;

    final bottom = top + renderObject.size.height;

    final revealLimit = viewportHeight * widget.revealPoint;

    final shouldReveal = top <= revealLimit && bottom >= 0;

    if (!shouldReveal) {
      return;
    }

    if (widget.delay == Duration.zero) {
      setState(() => _visible = true);
      return;
    }

    _scheduled = true;

    Future<void>.delayed(widget.delay, () {
      if (!mounted) return;

      setState(() => _visible = true);
    });
  }
}
