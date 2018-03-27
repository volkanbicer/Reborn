//
//  ViewController.swift
//  Reborn
//
//  Created by vbicer on 03/26/2018.
//  Copyright (c) 2018 vbicer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(rebornDidTrigger(notification:)),
                                               name: .rebornDidTrigger,
                                               object: nil)
    }

    @objc func rebornDidTrigger(notification: Notification){
        let alert = UIAlertController(title: "Alert", message: "You can only see me once for this version!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension Notification.Name{
    static let rebornDidTrigger = Notification.Name("RebornDidTrigger")
}

