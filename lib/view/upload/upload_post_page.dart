import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:media_picker_widget/media_picker_widget.dart';

import '../../constants/ui_image.dart';
import '../../models/user_profile.dart';
import '../../theme/colors.dart';
import 'components/list_media_post.dart';

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
  String dropdownValue = 'Public';
  final TextEditingController contentController = TextEditingController();
  List<Media> listMedia = [];
  @override
  Widget build(BuildContext context) {
    // final getFocus = FocusScope.of(context).unfocus();
    return Scaffold(
      appBar: _buildAppbar(),
      bottomNavigationBar: _buildBottomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //User
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //User
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Image User
                      // CircleAvatar(
                      //   backgroundImage:
                      //       NetworkImage(widget.userProfile.urlImage),
                      // ),
                      SizedBox(
                        width: 12.w,
                      ),
                      //Name and privacy
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.w),
                                  image: DecorationImage(
                                    image: widget.userProfile.urlImage != null
                                        ? NetworkImage(
                                            widget.userProfile.urlImage ?? "",
                                          )
                                        : Image.asset(
                                                "assets/images/defaultImage.png")
                                            .image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                widget.userProfile.fullName,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 30,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: black.withOpacity(0.3),
                              ),
                            ),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              elevation: 16,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(143, 0, 0, 0),
                                  fontWeight: FontWeight.w500),
                              underline: SizedBox(height: 0),
                              onChanged: (String? value) {
                                setState(() {
                                  print("day la value: ${value}");
                                  dropdownValue = value!;
                                });
                              },
                              items: <String>[
                                'Public',
                                'Followers',
                                'Private'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              //input content or add image or both
              Column(
                children: [
                  _inputTextPost(),
                  ListMediaPost(listMedia: listMedia),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _inputTextPost() {
    return Container(
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      child: TextField(
        maxLines: null,
        keyboardType: TextInputType.multiline,
        controller: contentController,
        onChanged: (value) {
          setState(() {});
        },
        cursorHeight: 25.h,
        decoration: InputDecoration(
          hintText: listMedia.length <= 0
              ? "Bạn đang nghĩ gì?"
              : "Bạn nghĩ gì về nội dung này...",
          hintStyle: TextStyle(
            fontSize: 20.sp,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(8), // Added this
        ),
      ),
    );
  }

  BottomAppBar _buildBottomAppBar() {
    return BottomAppBar(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () async {
                await _openMediaPicker(context).then((value) {
                  log(value.toString());
                });
              },
              child: Icon(
                Icons.photo,
                size: 32.sp,
                color: Colors.green,
              ),
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                UIImage.tagSVG,
                color: Colors.green,
                height: 32.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: Text(
        "Create A New Post",
        style: TextStyle(fontSize: 17.sp),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(top: 8.0.h),
          child: OutlinedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(
                contentController.text.trim().isNotEmpty || listMedia.length > 0
                    ? Colors.blue
                    : Colors.grey,
              ),
            ),
            onPressed:
                contentController.text.trim().isNotEmpty || listMedia.length > 0
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("pressing"),
                          ),
                        );
                      }
                    : null,
            child: Text(
              "Đăng",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<dynamic> _openMediaPicker(BuildContext context) async {
    // openCamera(onCapture: (image){
    //   setState(()=> mediaList = [image]);
    // });
    return await showModalBottomSheet(
      context: context,
      builder: (context) {
        return MediaPicker(
          mediaList: listMedia,
          onPick: (selectedList) {
            setState(() {
              listMedia = selectedList;
            });
            return Navigator.of(context).pop("check");
          },
          onCancel: () => Navigator.of(context).pop("null"),
          mediaCount: MediaCount.multiple,
          mediaType: MediaType.all,
          decoration: PickerDecoration(
            actionBarPosition: ActionBarPosition.top,
            blurStrength: 2,
            completeText: 'Next',
          ),
        );
      },
    );
  }
}
