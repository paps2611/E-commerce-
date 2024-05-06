import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_curved_edges.dart';

class TCurvedEdgesWidget extends StatelessWidget {
  const TCurvedEdgesWidget({
    super.key,
    required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdeges(),
      child: child,
    );
  }
}
