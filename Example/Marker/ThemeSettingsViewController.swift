//
//  ThemeSettingsViewController.swift
//  Marker
//
//  Created by Htin Linn on 6/9/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

internal final class ThemeSettingsViewController: UIViewController {
    
    // MARK: - Properties
    
    var theme: AppTheme!
    
    // MARK: - Private properties

    private let fontNames = ["Helvetica Neue", "Avenir Next"]

    // MARK: - Instance functions
    
    @IBAction private func didTapCloseButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}

extension ThemeSettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThemeSettingsTableViewCell") else {
            fatalError("Cannot dequeue reusable cell...")
        }
        
        cell.textLabel?.text = fontNames[indexPath.row]

        if cell.textLabel?.text == "Helvetica Neue" {
            cell.textLabel?.font = HelveticaNeueFont().regularFont(ofSize: 17)
        } else if cell.textLabel?.text == "Avenir Next" {
            cell.textLabel?.font = AvenirNextFont().regularFont(ofSize: 17)
        }
        
        cell.accessoryType = (cell.textLabel?.text == theme.font.familyName) ? .checkmark : .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Font"
    }
    
}

extension ThemeSettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.textLabel?.text == "Helvetica Neue" {
            theme.font = HelveticaNeueFont()
        } else if cell?.textLabel?.text == "Avenir Next" {
            theme.font = AvenirNextFont()
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}
