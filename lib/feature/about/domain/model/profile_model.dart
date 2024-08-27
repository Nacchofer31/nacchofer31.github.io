import 'package:nacchofer31_portfolio/portfolio.dart';

part 'profile_model.freezed.dart';

@freezed
class ProfileModel with _$ProfileModel {
  factory ProfileModel({
    @Default('') String fullName,
    @Default('') String role,
    @Default('') String avatarPath,
  }) = _ProfileModel;
}
