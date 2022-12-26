import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:media_picker_widget/media_picker_widget.dart';
import 'package:video_player/video_player.dart';

class ListMediaPost extends StatefulWidget {
  const ListMediaPost({super.key, required this.listMedia});
  final List<Media> listMedia;
  @override
  State<ListMediaPost> createState() => _ListMediaPostState();
}

class _ListMediaPostState extends State<ListMediaPost> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.listMedia.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 200.w,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 20.h,
      ),
      itemBuilder: (context, index) {
        final mediaItem = widget.listMedia.elementAt(index);

        return Stack(
          fit: StackFit.expand,
          children: [
            _itemMedia(mediaItem),
            Positioned(
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.listMedia.removeAt(index);
                  });
                },
                child: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  _itemMedia(Media media) {
    switch (media.mediaType) {
      case MediaType.video:
        return _buildVideoItem(media);
      default:
        return _imageItem(media);
    }
  }

  _imageItem(Media media) {
    return Image.file(
      media.file!,
      fit: BoxFit.cover,
    );
  }

  _buildVideoItem(Media media) {
    return VideoItem(media: media);
  }
}

class VideoItem extends StatefulWidget {
  const VideoItem({super.key, required this.media});
  final Media media;
  @override
  State<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  late VideoPlayerController videoController;
  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayerWidget();
  }

  _initVideoPlayer() async {
    videoController = VideoPlayerController.file(widget.media.file!);
    videoController.addListener(() {
      setState(() {});
    });
    await videoController.initialize();
    await videoController.setLooping(true);
    await videoController.value.volume == 0;
  }

  _videoPlayerWidget() {
    return videoController.value.isInitialized
        ? _buildVideoPlayer()
        : CircularProgressIndicator();
  }

  _buildVideoPlayer() {
    return AspectRatio(
      aspectRatio: videoController.value.aspectRatio,
      child: GestureDetector(
        onTap: () {
          setState(() {
            videoController.value.isPlaying
                ? videoController.pause()
                : videoController.play();
          });
        },
        child: Stack(
          children: [
            VideoPlayer(
              videoController,
            ),
            Center(
              child: Icon(
                videoController.value.isPlaying
                    ? Icons.stop_circle_outlined
                    : Icons.play_circle_outline_outlined,
                color: Colors.white,
                size: 32.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
