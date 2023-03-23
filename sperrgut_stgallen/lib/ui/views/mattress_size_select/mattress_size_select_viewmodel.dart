import 'package:sperrgut_stgallen/app/app.locator.dart';
import 'package:sperrgut_stgallen/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MattressSizeSelectViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void selectSmallItem() {
    _navigationService.navigateToCartView();
  }

  void selectBigItem() {
    _navigationService.navigateToCartView();
  }

  void back() {
    _navigationService.back();
  }

  void home() {
    _navigationService
        .popUntil((route) => route.settings.name == Routes.homeView);
  }
}
