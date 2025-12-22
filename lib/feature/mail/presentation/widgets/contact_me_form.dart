import 'package:nacchofer31_portfolio/portfolio.dart';

class ContactMeForm extends StatefulWidget {
  const ContactMeForm({super.key});

  @override
  State<ContactMeForm> createState() => _ContactMeFormFormState();
}

class _ContactMeFormFormState extends State<ContactMeForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<MailCubit>().sendEmail(
            title: _titleController.text,
            name: _nameController.text,
            email: _emailController.text,
            message: _messageController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: cardBorderColor(context),
          width: 1,
        ),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: double.infinity,
        padding: EdgeInsets.all(Responsive.maxMainSpacing(context) * 1.333),
        child: BlocConsumer<MailCubit, MailState>(
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Email sent successfully!',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
                _titleController.clear();
                _nameController.clear();
                _emailController.clear();
                _messageController.clear();
                context.read<MailCubit>().reset();
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Email sent successfully!',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Contact me',
                    style: Responsive.mainHeadline(context),
                  ),
                  SizedBox(height: Responsive.maxSmallSpacing(context)),
                  const AccentWidget(),
                  SizedBox(height: Responsive.maxSmallSpacing(context)),
                  const ContactBulletSection(),
                  const SizedBox(height: 24),
                  ContactMeTextField(
                    controller: _nameController,
                    label: 'Name',
                    hint: 'Your name',
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter your name'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  ContactMeTextField(
                    controller: _emailController,
                    label: 'Email',
                    hint: 'Your email address',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  ContactMeTextField(
                    controller: _titleController,
                    label: 'Subject',
                    hint: 'The subject of your message',
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter a subject'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  ContactMeTextField(
                    controller: _messageController,
                    label: 'Message',
                    hint: 'How can I help you?',
                    maxLines: 5,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter a message'
                        : null,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor,
                        foregroundColor: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              'Send Message',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
