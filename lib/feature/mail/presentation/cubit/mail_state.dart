import 'package:freezed_annotation/freezed_annotation.dart';

part 'mail_state.freezed.dart';

@freezed
class MailState with _$MailState {
  const factory MailState.initial() = _Initial;
  const factory MailState.loading() = _Loading;
  const factory MailState.success() = _Success;
  const factory MailState.error(String message) = _Error;
}
