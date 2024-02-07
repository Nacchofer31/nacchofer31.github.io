import 'package:nacchofer31_portfolio/base/interface_controller.dart';

class ThemeController extends InterfaceController<ThemeController> {
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
