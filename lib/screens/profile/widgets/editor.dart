import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:twear/core/theme/theme.dart';

class DescriptionEditor extends StatelessWidget {
  const DescriptionEditor({
    super.key,
    required this.themeMode,
    required QuillController editorController,
    required ScrollController scrollController, required this.focusNode,
  })  : _editorController = editorController,
        _scrollController = scrollController;
  final FocusNode focusNode;
  final CTheme themeMode;
  final QuillController _editorController;
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: themeMode.primTextColor),
      child: QuillEditor(
        controller: _editorController,
        scrollController: _scrollController,
        focusNode: focusNode,
        configurations: const QuillEditorConfigurations(
          scrollable: true,
          autoFocus: false,
          expands: false,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
