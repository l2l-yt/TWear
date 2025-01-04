import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:twear/core/theme/theme.dart';
import 'package:twear/core/utils/get_theme_state.dart';

class DescriptionEditor extends StatelessWidget {
  const DescriptionEditor({
    super.key,
    required QuillController editorController,
    required ScrollController scrollController,
    required this.focusNode,
  })  : _editorController = editorController,
        _scrollController = scrollController;
  final FocusNode focusNode;
  final QuillController _editorController;
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    CTheme themeMode = getThemeMode(context);
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
