import 'package:flutter_test/flutter_test.dart';
import 'package:sperrgut_stgallen/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('InfoAlertDialogModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
