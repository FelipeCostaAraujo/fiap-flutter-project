import 'package:firebase_remote_config/firebase_remote_config.dart';

class Settings {
  static String movieDbApiKey = "";
  static String movieDbBaseUrl = "https://api.themoviedb.org/3";
  static String movieDbImagesUrl = "https://image.tmdb.org/t/p/w500";
  static String movieDbLanguage = "pt-BR";
  static String movieDbRegion = "BR";
  static String movieDbToken = "";

  static Future<void> init() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    movieDbApiKey = remoteConfig.getString('movieDbApiKey');
    movieDbToken = remoteConfig.getString('movieDbToken');
  }
}
