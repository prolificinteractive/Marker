//
//  ThemeSettingsViewController.swift
//  Marker
//
//  Created by Htin Linn on 6/9/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

internal final class ThemeSettingsViewController: UIViewController {
    
    private struct Constants {
        static let CellIdentifier = "ThemeSettingsTableViewCell"
    }
    
    // MARK: - Properties
    
    weak var theme: AppTheme!
    
    // MARK: - Private properties

    private let fontNames = ["Helvetica Neue", "Avenir Next"]

    // MARK: - Instance functions
    
    @IBAction private func didTapCloseButton(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}

extension ThemeSettingsViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if let reusableCell = tableView.dequeueReusableCellWithIdentifier(Constants.CellIdentifier) {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .Default, reuseIdentifier: Constants.CellIdentifier)
        }
        
        cell.textLabel?.text = fontNames[indexPath.row]

        if cell.textLabel?.text == "Helvetica Neue" {
            cell.textLabel?.font = HelveticaNeueFont().regularFont(17)
        } else if cell.textLabel?.text == "Avenir Next" {
            cell.textLabel?.font = AvenirNextFont().regularFont(17)
        }
        
        if cell.textLabel?.text == theme.font.familyName {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Font"
    }
    
}

extension ThemeSettingsViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if cell?.textLabel?.text == "Helvetica Neue" {
            theme.font = HelveticaNeueFont()
        } else if cell?.textLabel?.text == "Avenir Next" {
            theme.font = AvenirNextFont()
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
