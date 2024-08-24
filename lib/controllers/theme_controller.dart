import 'package:nacchofer31_portfolio/portfolio.dart';

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
