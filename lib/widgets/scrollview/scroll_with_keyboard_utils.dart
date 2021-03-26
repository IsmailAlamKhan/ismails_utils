import 'package:flutter/material.dart';

class IncrementIntent extends Intent {
  const IncrementIntent(this.amount);

  final double amount;
}

class DecrementIntent extends Intent {
  const DecrementIntent(this.amount);

  final double amount;
}

class IncrementAction extends Action<IncrementIntent> {
  final ScrollController scrollController;

  IncrementAction(this.scrollController);
  void incrementBy(double amount) {
    scrollController.animateTo(
      scrollController.offset + amount * 100,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  @override
  void invoke(covariant IncrementIntent intent) {
    scrollController.animateTo(
      scrollController.offset + intent.amount * 100,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}

class DecrementAction extends Action<DecrementIntent> {
  final ScrollController scrollController;

  DecrementAction(this.scrollController);

  @override
  void invoke(covariant DecrementIntent intent) {
    scrollController.animateTo(
      scrollController.offset - intent.amount * 100,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
