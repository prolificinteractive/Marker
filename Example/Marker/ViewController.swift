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
        "**THE LIFE OF   PABLO**\n" +
        "**THE LIFE OF   PABLO**\n\n" +
        "_THE LIFE OF   PABLO_\n" +
        "WHICH / ONE\n" +
        "WHICH / ONE\n" +
        "WHICH / ONE"
    private let textFieldText = "Track List"
    private let textViewText = "Waves\n" +
        "Wolves\n" +
        "Facts\n" +
        "Fade\n" +
        ".\n" +
        ".\n" +
        ".\n"

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
        guard
            let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate,
            let themeFactory = appDelegate.themeFactory else {
            fatalError("App Delegate is not of type AppDelegate")
        }
        
        label.setMarkdownText(labelText, textStyle:  themeFactory.fontTheme.coverTextStyle)
        textField.setText(textFieldText, textStyle: themeFactory.fontTheme.bodyTextStyle)
        textView.setText(textViewText, textStyle: themeFactory.fontTheme.captionTextStyle)
    }
    
}
