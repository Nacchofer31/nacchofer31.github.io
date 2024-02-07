import 'package:nacchofer31_portfolio/base/controller.dart';

class ThemeController extends Controller<ThemeController> {
  bool isDarkMode = true;

  @override
  void setState({bool? isDarkMode}) {
    this.isDarkMode = isDarkMode ?? this.isDarkMode;
    updateStream(this);
  }

  void toogle() {
    setState(isDarkMode: !isDarkMode);
  }
}
