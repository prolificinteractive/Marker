//
//  ViewController.swift
//  Marker
//
//  Created by Htin Linn on 05/04/2016.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import Marker
import UIKit

internal final class ViewController: UIViewController {
    
    weak var theme: AppTheme!
    
    // MARK: - Private properties
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var textField: UITextField!
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
        registerForNotifications()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if
            let navigationController = segue.destinationViewController as? UINavigationController,
            let themeSettingsViewController = navigationController.viewControllers.first as? ThemeSettingsViewController
            where segue.identifier == "ThemeSettingsSegue" {
                themeSettingsViewController.theme = theme
        }
    }
    
    // MARK: - Private functions
    
    private func registerForNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(ViewController.updateViews),
                                                         name: UIContentSizeCategoryDidChangeNotification,
                                                         object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(ViewController.updateViews),
                                                         name: AppTheme.Constants.FontThemeDidChangeNotification,
                                                         object: nil)
    }
    
    @objc private func updateViews() {
        let fontTheme = theme.fontTheme
        
        label.setMarkdownText(labelText, textStyle:  fontTheme.headlineTextStyle)
        textField.setText(textFieldText, textStyle: fontTheme.titleTextStyle)
        textView.setText(textViewText, textStyle: fontTheme.bodyTextStyle)
    }
    
}
