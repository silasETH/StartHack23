import 'package:sperrgut_stgallen/app/app.locator.dart';
import 'package:sperrgut_stgallen/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TypeSelectViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void selectSofa() {}

  void selectMattress() {}

  void selectTrashBag() {}

  void selectOther() {}

  void pop() {
    _navigationService.back();
  }

  void home() {
    _navigationService
        .popUntil((route) => route.settings.name == Routes.homeView);
  }
}
