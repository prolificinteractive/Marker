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
    @IBOutlet private weak var textField: UITextField! {
        didSet {
            textField.adjustsFontSizeToFitWidth = false
        }
    }
    @IBOutlet private weak var textView: UITextView!
    
    private let labelText = "__THE LIFE OF       PABLO__\n" +
        "__THE LIFE OF   PABLO__\n" +
        "__THE LIFE OF   PABLO__\n" +
        "_THE LIFE OF   PABLO_\n" +
        "WHICH / ONE\n" +
        "WHICH / ONE"
    private let textFieldText = "__THE LIFE OF PABLO__\n"
    private let textViewText = "**THE LIFE OF       PABLO**\n" +
        "**THE LIFE OF   PABLO**\n" +
        "**THE LIFE OF   PABLO**\n" +
        "*THE LIFE OF   PABLO*\n" +
        "WHICH / ONE\n" +
        "WHICH / ONE"

    // MARK: - Init/Deinit
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // MARK: - Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(ViewController.updateViews),
                                                         name: UIContentSizeCategoryDidChangeNotification,
                                                         object: nil)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // MARK: - Private functions
    
    @objc private func updateViews() {
        label.setMarkdownText(labelText, textStyle: fontTheme.labelTextStyle)
        textField.setMarkdownText(textFieldText, textStyle: fontTheme.textFieldTextStyle)
        textView.setMarkdownText(textViewText, textStyle: fontTheme.textViewTextStyle)
    }
    
}
