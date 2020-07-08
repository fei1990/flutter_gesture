//
//  ProxyGestureRecognizer.swift
//  my_ios
//
//  Created by wf on 2020/6/16.
//  Copyright © 2020 sohu. All rights reserved.
//

import UIKit
import Flutter

class ProxyGestureRecognizer: UIPanGestureRecognizer {

    var flutterChannel: FlutterMethodChannel!

    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        flutterChannel = FlutterMethodChannel(name: "infoNews/basic_info", binaryMessenger: flutterEngine.binaryMessenger)

        flutterChannel.setMethodCallHandler { [weak self] (call, result) in
            guard let `self` = self else { return }
            if call.method == "gestureStateChanged" {
                if let flag = call.arguments as? Bool {
//                    debugPrint(flag)

                    if flag && self.state == .possible {
                        self.state = .began
                        return
                    } else if !flag && self.state == .possible {
                        self.state = .failed
                        return
                    }

                }
            }
        }

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
    }

    override func reset() {
        super.reset()
        self.state = .possible
    }

}
