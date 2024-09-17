import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
class ImagePicker_1 extends StatefulWidget {
  const ImagePicker_1({super.key});

  @override
  State<ImagePicker_1> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker_1> {
  File? _imageFile;
  final ImagePicker _picker =ImagePicker();


  Future<void> _PickImageFromGallery()async{
    final pickedFile = await _picker.pickImage(source:ImageSource.gallery);
     if(pickedFile !=null){
       setState(() {
         _imageFile = File(pickedFile.path);
       });
     }
  }

  Future<void> _captureImagewithcamera() async{
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if(pickedFile !=null){
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: Text("Image picker demo"),
      )),),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 320,),
                     _imageFile!=null
            ? Image.file(_imageFile!,width: 300,height: 300,)
            : Text("no image selected"),
          const Gap(20),
          ElevatedButton(onPressed: _PickImageFromGallery,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            padding: MaterialStateProperty.all(EdgeInsets.all(10)),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
          child: Text("Pick Image from Gallery")),
            const Gap(20),
            ElevatedButton(
            onPressed: _captureImagewithcamera,
            style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            padding: MaterialStateProperty.all(EdgeInsets.all(10)),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
            child: Text('Capture Image with Camera'),
            ),
          ],
        ),
      ),
    );
  }
}
