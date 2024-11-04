import 'dart:convert';
import 'package:crypto/crypto.dart';

extension StringExt on String {
  String hashPassword() {
    final bytes = utf8.encode(this);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
