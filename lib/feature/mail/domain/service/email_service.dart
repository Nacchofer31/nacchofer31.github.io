abstract class EmailService {
  Future<void> sendEmail({
    required String title,
    required String name,
    required String email,
    required String message,
  });
}
