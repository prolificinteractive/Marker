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
    
    // MARK: - Override properties
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Instance properties
    
    var theme: AppTheme!
    
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
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        registerForNotifications()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let navigationController = segue.destination as? UINavigationController,
            let themeSettingsViewController = navigationController.viewControllers.first as? ThemeSettingsViewController,
            segue.identifier == "ThemeSettingsSegue" {
                themeSettingsViewController.theme = theme
        }
    }
    
    // MARK: - Private functions
    
    private func registerForNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.updateViews),
                                               name: NSNotification.Name.UIContentSizeCategoryDidChange,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.updateViews),
                                               name: NSNotification.Name(rawValue: AppTheme.Constants.fontThemeDidChangeNotification),
                                               object: nil)
    }
    
    @objc private func updateViews() {
        let fontTheme = theme.fontTheme
        
        label.setMarkdownText(labelText, using: fontTheme.headlineTextStyle)
        textField.setText(textFieldText, using: fontTheme.titleTextStyle)
        textView.setText(textViewText, using: fontTheme.bodyTextStyle)
    }
    
}
