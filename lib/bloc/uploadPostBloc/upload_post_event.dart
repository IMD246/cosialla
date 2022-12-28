import 'package:media_picker_widget/media_picker_widget.dart';

import '../../models/post.dart';

abstract class UploadPostEvent {}

class UploadEvent extends UploadPostEvent {
  final Post post;
  final List<Media> listMedia;

  UploadEvent({
    required this.post,
    required this.listMedia,
  });
}

class UpdateListMediaEvent extends UploadPostEvent {
  final List<Media> listMedia;

  UpdateListMediaEvent({
    required this.listMedia,
  });
}
class UpdateTextPostEvent extends UploadPostEvent {
  final String text;

  UpdateTextPostEvent({
    required this.text,
  });
}
class DeleteItemMediaEvent extends UploadPostEvent {
  final int index;

  DeleteItemMediaEvent({
    required this.index,
  });
}