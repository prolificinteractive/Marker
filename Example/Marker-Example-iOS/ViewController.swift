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
    @IBOutlet private weak var textView: UITextView! {
        didSet {
            textView.isEditable = false
        }
    }
    
    private let labelText = "__the life of       pablo__\n" +
        "__the life of   pablo__\n" +
        "**the life of   pablo**\n" +
        "**the life of   pablo**\n\n" +
        "_the life of   pablo_\n" +
        "which / one\n" +
        "which / one\n" +
        "~~which / one~~"
    private let textFieldText = "track list"
    private let textViewText = "waves\n" +
        "wolves\n" +
        "facts\n" +
        "fade\n" +
        ".\n" +
        "#.#\n" +
        "^.^\n"

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
                                               name: UIContentSizeCategory.didChangeNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.updateViews),
                                               name: Notification.Name(rawValue: AppTheme.Constants.fontThemeDidChangeNotification),
                                               object: nil)
    }
    
    @objc private func updateViews() {
        let fontTheme = theme.fontTheme
        
        label.setMarkdownText(labelText, using: fontTheme.headlineTextStyle)
        textField.setText(textFieldText, using: fontTheme.titleTextStyle)
        
        var fadedTextStyleOne = fontTheme.bodyTextStyle
        fadedTextStyleOne.textColor = UIColor.black.withAlphaComponent(0.5)
        var fadedTextStyleTwo = fontTheme.bodyTextStyle
        fadedTextStyleTwo.textColor = UIColor.black.withAlphaComponent(0.2)
        textView.setText(textViewText,
                         using: fontTheme.bodyTextStyle,
                         customMarkup: [
                            "#": fadedTextStyleOne,
                            "^": fadedTextStyleTwo
            ]
        )
    }
    
}
