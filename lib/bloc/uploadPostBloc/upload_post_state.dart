// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:media_picker_widget/media_picker_widget.dart';

abstract class UploadPostState {}

class InitializeUploadPostState extends UploadPostState {
  final String textPost;
  final List<Media> listMedia;
  InitializeUploadPostState({
    required this.textPost,
    required this.listMedia,
  });
}
class ProcessingUploadPostState extends UploadPostState {
  final String textPost;
  final List<Media> listMedia;
  ProcessingUploadPostState({
    required this.textPost,
    required this.listMedia,
  });
}