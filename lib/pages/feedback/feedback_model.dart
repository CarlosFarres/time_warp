import '/flutter_flow/flutter_flow_util.dart';
import 'feedback_widget.dart' show FeedbackWidget;
import 'package:flutter/material.dart';

class FeedbackModel extends FlutterFlowModel<FeedbackWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for titleField widget.
  FocusNode? titleFieldFocusNode;
  TextEditingController? titleFieldController;
  String? Function(BuildContext, String?)? titleFieldControllerValidator;
  // State field(s) for textfeedField widget.
  FocusNode? textfeedFieldFocusNode;
  TextEditingController? textfeedFieldController;
  String? Function(BuildContext, String?)? textfeedFieldControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    titleFieldFocusNode?.dispose();
    titleFieldController?.dispose();

    textfeedFieldFocusNode?.dispose();
    textfeedFieldController?.dispose();
  }
}
