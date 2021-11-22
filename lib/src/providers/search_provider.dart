import 'dart:async';
import 'package:riverpod/riverpod.dart';

final searchProvider = StateProvider<String>((ref) => "A");

final selectorProvider = StateProvider<int>((ref) => 0);
