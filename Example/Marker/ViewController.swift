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
    
    // MARK: - Properties
    
    var fontTheme: FontTheme!
    
    // MARK: - Private properties
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var textView: UITextView!

    // MARK: - Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.setMarkdownText("__THE LIFE OF       PABLO__\n" +
            "__THE LIFE OF   PABLO__\n" +
            "__THE LIFE OF   PABLO__\n" +
            "_THE LIFE OF   PABLO_\n" +
            "WHICH / ONE\n" +
            "WHICH / ONE",
                              textStyle: fontTheme.labelTextStyle)
        
        textField.setMarkdownText("__THE LIFE OF PABLO__\n",
                                  textStyle: fontTheme.textFieldTextStyle)
        
        textView.setMarkdownText("**THE LIFE OF       PABLO**\n" +
            "**THE LIFE OF   PABLO**\n" +
            "**THE LIFE OF   PABLO**\n" +
            "*THE LIFE OF   PABLO*\n" +
            "WHICH / ONE\n" +
            "WHICH / ONE",
                              textStyle: fontTheme.textViewTextStyle)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

