import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_list_provider/shared/errors/local_storage_exceptions.dart';

class LocalStorageService {
  Future<void> set(String key, String? data) async {
    const storage = FlutterSecureStorage();

    try {
      await storage.write(key: key, value: data);
    } catch (error, st) {
      final errorMessage = 'Error storing data: $data with key: $key';
      log(errorMessage, error: error, stackTrace: st);
      throw LocalStorageException('ErrorMessage');
    }
  }

  Future<String?> get(String key) async {
    const storage = FlutterSecureStorage();

    try {
      return await storage.read(key: key);
    } catch (error, st) {
      final errorMessage = 'Error reading key: $key';
      log(errorMessage, error: error, stackTrace: st);
      throw LocalStorageException('ErrorMessage');
    }
  }

  Future<void> clearStorage(String key) async {
    const storage = FlutterSecureStorage();

    try {
      await storage.read(key: key);
    } catch (error, st) {
      const errorMessage = 'Error cleaning storage';
      log(errorMessage, error: error, stackTrace: st);
      throw LocalStorageException('ErrorMessage');
    }
  }
}
