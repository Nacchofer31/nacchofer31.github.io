import 'package:nacchofer31_portfolio/portfolio.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<MailCubit>(
      create: (context) => GetIt.instance.get<MailCubit>(),
      child: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ContactMeForm(),
            FooterView(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
