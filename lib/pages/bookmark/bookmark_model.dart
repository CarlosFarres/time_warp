import '/flutter_flow/flutter_flow_util.dart';
import 'bookmark_widget.dart' show BookmarkWidget;
import 'package:flutter/material.dart';

class BookmarkModel extends FlutterFlowModel<BookmarkWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
