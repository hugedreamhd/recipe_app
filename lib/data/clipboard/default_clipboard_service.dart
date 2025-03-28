import 'package:flutter/services.dart';
import 'package:recipe_app/domain/clipboard/clipboard_service.dart';

class DefaultClipboardService implements ClipboardService {
  @override
  Future<void> copyText(String text) async {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Future<String?> getText() async {
    final clipboardData = await Clipboard.getData('text/plain');
    return clipboardData?.text;
  }
}
