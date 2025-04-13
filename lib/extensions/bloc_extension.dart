import 'package:nacchofer31_portfolio/portfolio.dart';

extension SopraBlocBaseExtension<State> on Cubit {
  void emitIfNotClosed(State state) {
    if (isClosed) return;
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    emit(state);
  }
}
