import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class FilePickerService {
  Future<File> pickSingleFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    File file;
    if (result != null) {
      file = File(result.files.single.path);
    }
    return file;
  }

  Future<List<File>> pickMultipleFile() async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    List<File> files;
    if (result != null) {
      files = result.paths.map((path) => File(path)).toList();
    }
    return files;
  }

  Future<File> pickSingleImage() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    File file;
    if (result != null) {
      file = File(result.files.single.path);
    }
    return file;
  }

  Future<File> pickSingleVideo() async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(type: FileType.video);
    File file;
    if (result != null) {
      file = File(result.files.single.path);
    }
    return file;
  }
}
