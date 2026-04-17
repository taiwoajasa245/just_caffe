import 'package:just_caffe/src/app.dart';
import 'package:just_caffe/src/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => AppTheme(), child: App()));
}
