import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:qimah_admin/core/helper/functions/my_snack_bar.dart';

class LaunchUrl {
  LaunchUrl._();

  static void launchAnyUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      mySnackBar(ToastificationType.error, "خطأ", 'لا يمكن فتح  $url');
    }
  }

  static void openWhatsApp(String phoneNumber, String message) async {
    String url =
        "https://wa.me/+963$phoneNumber/?text=${Uri.encodeFull(message)}";

    launchAnyUrl(url);
  }
}
