import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nacchofer31_portfolio/feature/mail/domain/service/email_service.dart';

class EmailJsServiceImpl implements EmailService {
  static const String _serviceId = String.fromEnvironment('EMAILJS_SERVICE_ID');
  static const String _templateId =
      String.fromEnvironment('EMAILJS_TEMPLATE_ID');
  static const String _publicKey = String.fromEnvironment('EMAILJS_PUBLIC_KEY');

  @override
  Future<void> sendEmail({
    required String title,
    required String name,
    required String email,
    required String message,
  }) async {
    try {
      final payload = {
        'service_id': _serviceId,
        'template_id': _templateId,
        'user_id': _publicKey,
        'template_params': {
          'title': title,
          'name': name,
          'email': email,
          'message': message,
        },
      };

      final response = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(payload),
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to send email: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
