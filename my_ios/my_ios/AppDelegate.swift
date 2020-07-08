//
//  AppDelegate.swift
//  my_ios
//
//  Created by wf on 2020/5/8.
//  Copyright © 2020 sohu. All rights reserved.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {

    lazy var flutterEngine: FlutterEngine = FlutterEngine(name: "my flutter engine");

    private var flutterChannel: FlutterMethodChannel!

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        flutterEngine.run()
//        flutterEngine.run(withEntrypoint: "scroll_main", libraryURI: "main_CustomScrollView.dart")

        flutterChannel = FlutterMethodChannel(name: "com.infoNews.native_info", binaryMessenger: flutterEngine.binaryMessenger)
        
        flutterChannel.setMethodCallHandler { (call, results) in
            if call.method == "getDid" {
                results("056b538d458a87c2e64e15c690134632")
            } else if call.method == "getUID" {
                results("5b9af0065607620001f9cba0")
            } else if call.method == "getToken" {
                results("eyJleHAiOjE2MDA0MTM1MTcxNTgsImlhdCI6MTU5MjYzNzUxNzE1OCwicHAiOiIxMDQ5NjAwMjQ0NzEyNjAzNjQ4QHNvaHUuY29tIiwidGsiOiI1bzdBM1ljd1BzVDc0YzI3b3NCVjBVcEJ5UEhjUWsydiIsInYiOjB9.vZmE5-UJInHqxJ1SYYJ-wk7ODyIt7KxTYTteS18HZ9Y")
            } else if call.method == "getAppVersion" {
                results("4.0.5")
            } else if call.method == "getCapturePackageFlag" {
                results(true);
            } else if call.method == "getProxyAddress" {
//                results("10.2.129.203")
                results("10.2.138.36")
//                results("")
            } else if call.method == "getProxyPort" {
                results("8888")
//                results("")
            } else {
                results(FlutterMethodNotImplemented)
            }
        }

//        flutterEngine.run(withEntrypoint: "myOtherEntrypoint", libraryURI: "dart01.dart")

        GeneratedPluginRegistrant.register(with: flutterEngine)

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    override func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    override func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

