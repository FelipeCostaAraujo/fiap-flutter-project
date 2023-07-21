import '../entities/entities.dart';

abstract class SaveProfile {
  Future<void> call(ProfileEntity profileEntity);
}