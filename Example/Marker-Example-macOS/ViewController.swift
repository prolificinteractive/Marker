//
//  ViewController.swift
//  Marker-Example-macOS
//
//  Created by Michael Campbell on 5/24/17.
//
//

import Cocoa
import Marker

internal final class ViewController: NSViewController {

    // MARK: - Instance properties

    var theme: AppTheme?

    @IBOutlet private weak var multiLineTextField: NSTextField!
    @IBOutlet private weak var textField: NSTextField! {
        didSet {
            textField.isEditable = false
            textField.isSelectable = false
        }
    }
    @IBOutlet private var textView: NSTextView! {
        didSet {
            textView.isSelectable = false
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

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @objc private func updateViews() {
        guard let fontTheme = theme?.fontTheme else {
            return
        }

        multiLineTextField.setMarkdownText(labelText, using: fontTheme.headlineTextStyle)
        textField.setMarkdownText(textFieldText, using: fontTheme.titleTextStyle)

        var fadedTextStyleOne = fontTheme.bodyTextStyle
        fadedTextStyleOne.textColor = Color.black.withAlphaComponent(0.5)
        var fadedTextStyleTwo = fontTheme.bodyTextStyle
        fadedTextStyleTwo.textColor = Color.black.withAlphaComponent(0.2)
        textView.setText(textViewText,
                         using: fontTheme.bodyTextStyle,
                         customMarkup: [
                            "#": fadedTextStyleOne,
                            "^": fadedTextStyleTwo
            ]
        )
    }

}

