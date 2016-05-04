//
//  ViewController.swift
//  Marker
//
//  Created by Htin Linn on 05/04/2016.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit
import Marker

internal final class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.font = UIFont.systemFontOfSize(23)
        label.setMarkdownText("__THE LIFE OF     PABLO__\n__THE LIFE OF PABLO__\n__THE LIFE OF PABLO__\n_THE LIFE OF PABLO_\nWHICH / ONE",
                              textStyle: PabloTextStyle())
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

