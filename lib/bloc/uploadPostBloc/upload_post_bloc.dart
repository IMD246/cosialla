import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_picker_widget/media_picker_widget.dart';
import 'package:uuid/uuid.dart';

import '../../models/post_media.dart';
import '../../repositories/remote_repository/remote_post_media_repository.dart';
import '../../repositories/remote_repository/remote_post_repository.dart';
import '../../repositories/remote_repository/remote_storage_repository.dart';
import 'upload_post_event.dart';
import 'upload_post_state.dart';

class UploadPostBloc extends Bloc<UploadPostEvent, UploadPostState> {
  final RemotePostMediaRepository remotePostMediaRepository;
  final RemotePostRepository remotePostRepository;
  final RemoteStorageRepository remoteStorageRepository;
  String textPost = "";
  List<Media> listMedia = [];
  UploadPostBloc({
    required this.remotePostMediaRepository,
    required this.remotePostRepository,
    required this.remoteStorageRepository,
  }) : super(
          InitializeUploadPostState(
            listMedia: [],
            textPost: "",
          ),
        ) {
    on<UploadEvent>(
      (event, emit) async {
        try {
          final uuidPost = await Uuid().v4();
          await remotePostRepository.createPost(
            postId: uuidPost,
            mapPost: event.post.toMap(),
          );
          for (var i = 0; i < event.listMedia.length; i++) {
            final media = event.listMedia[i];
            if (media.file != null) {
              final uuidPostMedia = await Uuid().v4();
              final postMedia = PostMedia(
                id: uuidPostMedia,
                nameFile: media.title.toString(),
                stampTime: DateTime.now(),
                type: media.mediaType.toString(),
              );
              await remotePostMediaRepository.createPostMedia(
                postMediaId: uuidPostMedia,
                mapPostMedia: postMedia.toMap(),
                postId: uuidPost,
              );
              SettableMetadata? settableMetaData = null;
              if (media.mediaType == MediaType.image) {
                settableMetaData = SettableMetadata(
                  contentType: "images/jpeg",
                );
              }
              await remoteStorageRepository.uploadFile(
                file: media.file!,
                filePath: "post/$uuidPost}",
                fileName: media.title.toString(),
                settableMetaData: settableMetaData,
              );
            }
          }
        } catch (e) {
          print(e.toString());
          ProcessingUploadPostState(
            textPost: textPost,
            listMedia: listMedia,
          );
        }
      },
    );
    on<UpdateListMediaEvent>((event, emit) {
      listMedia = event.listMedia;
      emit(ProcessingUploadPostState(
        textPost: textPost,
        listMedia: event.listMedia,
      ));
    });
    on<UpdateTextPostEvent>((event, emit) {
      textPost = event.text;
      emit(ProcessingUploadPostState(
        textPost: textPost,
        listMedia: listMedia,
      ));
    });
    on<DeleteItemMediaEvent>(
      (event, emit) {
        listMedia.removeAt(event.index);
        emit(ProcessingUploadPostState(
          textPost: textPost,
          listMedia: listMedia,
        ));
      },
    );
  }
}
