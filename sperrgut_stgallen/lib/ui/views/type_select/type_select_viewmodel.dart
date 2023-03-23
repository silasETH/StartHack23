import 'package:sperrgut_stgallen/app/app.locator.dart';
import 'package:sperrgut_stgallen/app/app.router.dart';
import 'package:sperrgut_stgallen/services/user_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TypeSelectViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userDataService = locator<UserDataService>();

  void selectSofa() {
    _userDataService.setItemType(CartItemType.sofa);
    _navigationService.navigateToSofaSizeSelectView();
  }

  void selectMattress() {
    _userDataService.setItemType(CartItemType.matres);
    _navigationService.navigateToMattressSizeSelectView();
  }

  void selectTrashBag() {
    _userDataService.setItemType(CartItemType.trashBin);
    _userDataService.tryAddingItemToCart();
    _navigationService.navigateToCartView();
  }

  void selectOther() {
    _userDataService.setItemType(CartItemType.other);
    _navigationService.navigateToOtherItemSizeSelectView();
  }

  void back() {
    _navigationService.back();
  }

  void home() {
    _navigationService
        .popUntil((route) => route.settings.name == Routes.homeView);
  }
}
