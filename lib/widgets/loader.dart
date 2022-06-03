import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

const centerLoader = CircularProgressIndicator(
    backgroundColor: Colors.blue,
    valueColor: AlwaysStoppedAnimation<Color>(
      Colors.blue,
    ));
showLoader(ctx) {
  return Loader.show(
    ctx,
    progressIndicator: const CircularProgressIndicator(
      backgroundColor: Colors.blue,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
    ),
  );
}

hideLoader() {
  return Loader.hide();
}