import 'package:get/get.dart';
import 'package:shoppet/route/app_route.dart';
import 'package:shoppet/view/dashboard/dashboard_bidding.dart';
import 'package:shoppet/view/dashboard/dashboard_screen.dart';

class AppPage {
  static var list = [
    GetPage(name: AppRoute.dashboard, page: () => const DashboardScreen(),
      binding: DashboardBidding()
    )
  ];
}
