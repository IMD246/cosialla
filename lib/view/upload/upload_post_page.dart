import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../bloc/uploadPostBloc/upload_post_bloc.dart';
import '../../bloc/uploadPostBloc/upload_post_state.dart';
import '../../models/user_profile.dart';
import '../../provider/post_media_provider.dart';
import '../../provider/post_provider.dart';
import '../../provider/storage_provider.dart';
import 'components/upload_post_screen.dart';

class UploadPostPage extends StatefulWidget {
  const UploadPostPage({
    Key? key,
    required this.userProfile,
  }) : super(key: key);
  final UserProfile userProfile;

  @override
  State<UploadPostPage> createState() => _UploadPostPageState();
}

class _UploadPostPageState extends State<UploadPostPage> {
  Widget build(BuildContext context) {
    final postMediaProvider = Provider.of<PostMediaProvider>(context);
    final postProvider = Provider.of<PostProvider>(context);
    final storageProvider = Provider.of<StorageProvider>(context);
    return BlocProvider<UploadPostBloc>(
      create: (context) => UploadPostBloc(
        remotePostRepository: postProvider.remotePostRepository,
        remotePostMediaRepository: postMediaProvider.remotePostMediaRepository,
        remoteStorageRepository: storageProvider.remoteStorageRepository,
      ),
      child: BlocBuilder<UploadPostBloc, UploadPostState>(
        builder: (context, state) {
          if (state is InitializeUploadPostState) {
            return UploadPostScreen(
              userProfile: widget.userProfile,
              listMedia: state.listMedia,
              textPost: state.textPost,
            );
          } else if (state is ProcessingUploadPostState) {
            return UploadPostScreen(
              userProfile: widget.userProfile,
              listMedia: state.listMedia,
              textPost: state.textPost,
            );
          } else {
            return Scaffold(
              body: Container(
                child: Text("Something went wrong!"),
              ),
            );
          }
        },
      ),
    );
  }
}
