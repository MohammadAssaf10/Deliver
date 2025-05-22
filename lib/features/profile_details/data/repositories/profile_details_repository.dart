import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/repositories/base_repository_impl.dart';
import '../data_sources/profile_details_remote_data_source.dart';

@lazySingleton
class ProfileDetailsRepository extends BaseRepositoryImpl {
  final ProfileDetailsRemoteDataSource _profileDetailsRemoteDataSource;
  final FirebaseStorage _firebaseStorage;

  ProfileDetailsRepository(
    this._profileDetailsRemoteDataSource,
    this._firebaseStorage,
    super.networkInfo,
  );

  Future<Either<Failure, String?>> updateProfileDetails({
    required XFile? profileImageFile,
    required String profileImage,
    required String username,
    required String mobileNumber,
  }) async => await requestApi(
    () async {
      String newProfileImage = profileImage;
      if (profileImageFile != null) {
        final Reference profileImageRef = _firebaseStorage.ref().child(
          'rider/${profileImageFile.name}',
        );
        await profileImageRef.putFile(File(profileImageFile.path));
        newProfileImage = await profileImageRef.getDownloadURL();
      }
      return await _profileDetailsRemoteDataSource.updateProfileDetails(
        profileImage: newProfileImage,
        username: username,
        mobileNumber: mobileNumber,
      );
    },
    (message) {
      return message;
    },
  );
}
