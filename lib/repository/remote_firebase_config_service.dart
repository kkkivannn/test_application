import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:test_app/core/models/url_model.dart';

class RemoteFirebaseConfigService {
  final remoteConfig = FirebaseRemoteConfig.instance;

  Future<UrlModel> init() async {
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 1),
        minimumFetchInterval: const Duration(seconds: 1),
      ),
    );
    await remoteConfig.fetchAndActivate();
    return UrlModel.fromJson(jsonDecode(remoteConfig.getString('remote_url')));
  }
}
