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
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.setMarkdownText("__THE LIFE OF       PABLO__\n" +
            "__THE LIFE OF   PABLO__\n" +
            "__THE LIFE OF   PABLO__\n" +
            "_THE LIFE OF   PABLO_\n" +
            "WHICH / ONE\n" +
            "WHICH / ONE",
                              textStyle: PabloTextStyle())
        
        textField.setMarkdownText("__THE LIFE OF       PABLO__\n", textStyle: PabloTextStyle())
        
        textView.setMarkdownText("__THE LIFE OF       PABLO__\n" +
            "__THE LIFE OF   PABLO__\n" +
            "__THE LIFE OF   PABLO__\n" +
            "_THE LIFE OF   PABLO_\n" +
            "WHICH / ONE\n" +
            "WHICH / ONE",
                              textStyle: PabloTextStyle())
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

