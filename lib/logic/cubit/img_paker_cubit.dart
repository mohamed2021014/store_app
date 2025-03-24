// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';

// class ImageCubit extends Cubit<File?> {
//   ImageCubit() : super(null);

//   final ImagePicker _picker = ImagePicker();

//   Future<void> pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       File imageFile = File(pickedFile.path);
//       emit(File(pickedFile.path)); // تحديث الحالة بالصورة المختارة
//     }
//       List<int> imageBytes = await imageFile.readAsBytes();
//       String base64String = base64Encode(imageBytes);
//       _saveImage(base64String);
//   }
// }
import 'dart:io';
import 'dart:convert'; // لتحويل الصورة إلى Base64
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageCubit extends Cubit<File?> {
  ImageCubit() : super(null) {
    _loadImage(); // تحميل الصورة المحفوظة عند تشغيل التطبيق
  }

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      emit(imageFile); // تحديث الحالة بالصورة المختارة
      await _saveImage(imageFile); // حفظ الصورة
    }
  }

  Future<void> _saveImage(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64String = base64Encode(imageBytes);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("saved_image", base64String);
    print("✅ تم حفظ الصورة في SharedPreferences");
  }

  Future<void> _loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedBase64Image = prefs.getString("saved_image");

    if (savedBase64Image != null) {
      List<int> imageBytes = base64Decode(savedBase64Image);
      File tempFile = File('${Directory.systemTemp.path}/temp_image.png');
      await tempFile.writeAsBytes(imageBytes);

      emit(tempFile); // تحميل الصورة من SharedPreferences
      print("✅ تم تحميل الصورة من SharedPreferences");
    }
  }
}
