import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImagePickerService {
  ImagePickerService._();
  static final instance = ImagePickerService._();

  final ImagePicker _picker = ImagePicker();

  // اختيار صورة من المعرض
  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (picked == null) return null;
      return File(picked.path);
    } catch (e) {
      log("❌ Error picking image: $e");
      return null;
    }
  }

  // رفع الصورة إلى Supabase Storage
  Future<String?> uploadImage({
    required File imageFile,
    required String bucket,
  }) async {
    try {
      final fileName = basename(imageFile.path);
      final cleanName = fileName.replaceAll(" ", "_");
      final storagePath = '${DateTime.now().millisecondsSinceEpoch}_$cleanName';

      final response = await Supabase.instance.client.storage
          .from(bucket)
          .upload(storagePath, imageFile);
      log("📤 Upload response: $response");

      if (response.isEmpty) {
        log("❌ Upload failed: empty response");
        return null;
      }

      final url = Supabase.instance.client.storage
          .from(bucket)
          .getPublicUrl(storagePath);

      log("✅ Uploaded image URL: $url");
      return url;
    } catch (e) {
      log("❌ Error uploading image: $e");
      return null;
    }
  }
}
