// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final GetStorage storage;

  String user_profile_key = "user_profile_key";
  String onbaord_key = "onbaord_key";

  StorageService({required this.storage});

  Rx<Map<String, dynamic>> user = Rx<Map<String, dynamic>>({});

  Future setProfile(String name, String email, String photo) async {
    Map<String, dynamic> value = {"name": name, "email": email, "photo": photo};
    await storage.write(user_profile_key, json.encode(value));

    user(value);
  }

  String get getProfile => storage.read(user_profile_key) ?? '';
}
