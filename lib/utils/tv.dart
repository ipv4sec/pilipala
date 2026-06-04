import 'package:device_info_plus/device_info_plus.dart';

/// 是否为 Android TV 设备
late bool isTV;

/// 初始化 TV 检测，需要在 main() 中调用
Future<void> initTVDetect() async {
  final deviceInfo = DeviceInfoPlugin();
  final androidInfo = await deviceInfo.androidInfo;
  isTV = androidInfo.systemFeatures.contains('android.software.leanback') ||
      androidInfo.systemFeatures.contains('android.hardware.type.television') ||
      androidInfo.systemFeatures.contains('android.hardware.hdmi.cec');
}
