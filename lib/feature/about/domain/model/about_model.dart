import 'package:nacchofer31_portfolio/portfolio.dart';

part 'about_model.freezed.dart';

@freezed
class AboutModel with _$AboutModel {
  factory AboutModel({
    @Default('') String description,
  }) = _AboutModel;
}
