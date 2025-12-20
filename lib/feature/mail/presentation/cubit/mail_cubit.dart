import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nacchofer31_portfolio/feature/mail/domain/service/email_service.dart';
import 'package:nacchofer31_portfolio/feature/mail/presentation/cubit/mail_state.dart';

class MailCubit extends Cubit<MailState> {
  final EmailService _emailService;

  MailCubit({required EmailService emailService})
      : _emailService = emailService,
        super(const MailState.initial());

  Future<void> sendEmail({
    required String title,
    required String name,
    required String email,
    required String message,
  }) async {
    emit(const MailState.loading());
    try {
      await _emailService.sendEmail(
        title: title,
        name: name,
        email: email,
        message: message,
      );
      emit(const MailState.success());
    } catch (e) {
      emit(const MailState.error('Failed to send email. Please try again later.'));
    }
  }

  void reset() {
    emit(const MailState.initial());
  }
}
