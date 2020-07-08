//
//  ViewController.swift
//  my_ios
//
//  Created by wf on 2020/5/8.
//  Copyright © 2020 sohu. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.isHidden = true
        self.fd_prefersNavigationBarHidden = true
        let button = UIButton(type:UIButton.ButtonType.custom)
        button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
        button.setTitle("Show Flutter!", for: UIControl.State.normal)
        button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
//        (UIApplication.shared.delegate as! AppDelegate).flutterEngine.run(withEntrypoint: "runFunc", libraryURI: "dart01.dart")
    }

    @objc func showFlutter() {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(flutterViewController, animated: true)
    }

}

