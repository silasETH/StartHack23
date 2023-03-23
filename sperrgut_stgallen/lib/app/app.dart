import 'package:sperrgut_stgallen/services/user_data_service.dart';
import 'package:sperrgut_stgallen/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:sperrgut_stgallen/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:sperrgut_stgallen/ui/views/home/home_view.dart';
import 'package:sperrgut_stgallen/ui/views/info/info_view.dart';
import 'package:sperrgut_stgallen/ui/views/map/map_view.dart';
import 'package:sperrgut_stgallen/ui/views/mattress_size_select/mattress_size_select_view.dart';
import 'package:sperrgut_stgallen/ui/views/other_item_size_select/other_item_size_select_view.dart';
import 'package:sperrgut_stgallen/ui/views/sofa_size_select/sofa_size_select_view.dart';
import 'package:sperrgut_stgallen/ui/views/startup/startup_view.dart';
import 'package:sperrgut_stgallen/ui/views/type_select/type_select_view.dart';
import 'package:sperrgut_stgallen/ui/views/weight_select/weight_select_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:sperrgut_stgallen/ui/views/pdf_downloader/pdf_downloader_view.dart';
import 'package:sperrgut_stgallen/ui/views/cart/cart_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: TypeSelectView),
    MaterialRoute(page: SofaSizeSelectView),
    MaterialRoute(page: MattressSizeSelectView),
    MaterialRoute(page: WeightSelectView),
    MaterialRoute(page: OtherItemSizeSelectView),
    MaterialRoute(page: MapView),
    MaterialRoute(page: InfoView),
    MaterialRoute(page: PdfDownloaderView),
    MaterialRoute(page: CartView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UserDataService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
