//
//  ViewController.swift
//  ConfigSettingsDemo
//
//  Created by Hiren Kadam on 08/07/20.
//  Copyright © 2020 Hiren Kadam. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showTutorial()
    }
    
    func showTutorial() {
        if let url = URL(string: baseURL) {
            let vc = SFSafariViewController(url: url)
            self.present(vc, animated: true, completion: nil)
        }
    }


}

