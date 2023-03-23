import 'package:sperrgut_stgallen/app/app.locator.dart';
import 'package:sperrgut_stgallen/app/app.router.dart';
import 'package:sperrgut_stgallen/services/user_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OtherItemWeightSelectViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final UserDataService _userDataService = locator<UserDataService>();

  void selectSmaller30Item() {
    _userDataService.setItemWeight(0);
    _userDataService.tryAddingItemToCart();
    _navigationService.navigateToCartView();
  }

  void select30To60Item() {
    _userDataService.setItemWeight(1);
    _userDataService.tryAddingItemToCart();
    _navigationService.navigateToCartView();
  }

  void selectLarger60Item() {
    _userDataService.setItemWeight(2);
    _userDataService.tryAddingItemToCart();
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
