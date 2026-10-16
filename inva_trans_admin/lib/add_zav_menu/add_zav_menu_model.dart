import '/flutter_flow/flutter_flow_util.dart';
import 'add_zav_menu_widget.dart' show AddZavMenuWidget;
import 'package:flutter/material.dart';

class AddZavMenuModel extends FlutterFlowModel<AddZavMenuWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataKrk1 = false;
  FFUploadedFile uploadedLocalFile_uploadDataKrk1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataKrk1 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
