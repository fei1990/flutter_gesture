//
//  CustomNavigationController.swift
//  my_ios
//
//  Created by wf on 2020/7/7.
//  Copyright © 2020 sohu. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    var proxyGesture: ProxyGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()

        proxyGesture = ProxyGestureRecognizer(target: self, action: #selector(customPanGesture(_:)))
        self.view.addGestureRecognizer(self.proxyGesture)
        proxyGesture.cancelsTouchesInView = false
        self.fd_fullscreenPopGestureRecognizer.require(toFail: proxyGesture)

    }
    

    @objc func customPanGesture(_ gesture: ProxyGestureRecognizer) {
//        debugPrint(gesture.location(in: gesture.view))
    }

}

extension CustomNavigationController: UIGestureRecognizerDelegate {

//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        if gestureRecognizer == proxyGesture && otherGestureRecognizer == self.fd_fullscreenPopGestureRecognizer {
//            return true
//        }
//        return false
//    }

}
