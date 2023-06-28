import UIKit
import Flutter
import AppCenter
import AppCenterDistribute

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    AppCenter.start(withAppSecret: "8129f156-9ece-4540-bf1d-bd97aa6a152a", services: [Distribute.self])
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
