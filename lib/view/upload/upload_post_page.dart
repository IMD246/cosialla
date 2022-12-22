import 'package:flutter/material.dart';

import '../../models/user_profile.dart';
import '../../theme/colors.dart';

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

  @override
  Widget build(BuildContext context) {
    final TextEditingController contentController = TextEditingController();
    // final getFocus = FocusScope.of(context).unfocus();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create A New Post"),
        centerTitle: true,
      ),
      body: Container(
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
                      width: 12,
                    ),
                    //Name and privacy
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.userProfile.fullName,
                          style: TextStyle(
                              fontSize: 14,
                              color: black,
                              fontWeight: FontWeight.w500),
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
                            items: <String>['Public', 'Followers', 'Private']
                                .map<DropdownMenuItem<String>>((String value) {
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
            //input content
            TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 5,
              controller: contentController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Even Densed TextFiled',
                isDense: true, // Added this
                contentPadding: EdgeInsets.all(8), // Added this
              ),
            ),
            //input image or video

            //button push
            ElevatedButton(onPressed: () {}, child: Text("Đăng")),
          ],
        ),
      ),
    );
  }
}
