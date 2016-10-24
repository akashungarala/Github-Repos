//
//  SettingsTableViewController.swift
//  GithubDemo
//
//  Created by Akash Ungarala on 10/23/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

protocol SettingsTableViewControllerDelegate: class {
    func updateSettings(sender: SettingsTableViewController, settings: GithubRepoSearchSettings)
}

class SettingsTableViewController: UITableViewController {
    
    @IBOutlet weak var filterSwitch: UISwitch!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var starsSlider: UISlider!
    
    weak var delegate: SettingsTableViewControllerDelegate?
    
    var settings = GithubRepoSearchSettings()
    var originalSettings = GithubRepoSearchSettings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        let filterOriginal = settings.isFilterByLanguage
        filterSwitch.isOn = filterOriginal
        var count = 1
        settings.isFilterByLanguage = true
        for language in Language.languageValues {
            let indexPath = IndexPath.init(row: count, section: 1)
            let cell = tableView.cellForRow(at: indexPath)
            cell?.textLabel?.text = language.rawValue
            if (settings.languages?.contains(language))! {
                print("2: \(language.rawValue)")
                cell?.accessoryType = .checkmark
            }
            count += 1
        }
        starsSlider.value = Float(settings.minStars)
        starsLabel.text = "\(settings.minStars)"
        settings.isFilterByLanguage = filterOriginal
        originalSettings = settings
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 && settings.isFilterByLanguage {
            return Language.languageValues.count + 1
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateFilter(indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        updateFilter(indexPath: indexPath)
    }
    
    @IBAction func starsSliderValueChanged(_ sender: UISlider) {
        let stars = Int(starsSlider.value)
        starsLabel.text = "\(stars)"
        settings.minStars = stars
    }
    
    @IBAction func filterSwitchValueChanged(_ sender: UISwitch) {
        settings.isFilterByLanguage = sender.isOn
        if (!settings.isFilterByLanguage) {
            settings.languages = []
        }
        tableView.reloadData()
    }
    
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        delegate?.updateSettings(sender: self, settings: settings)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIBarButtonItem) {
        settings = originalSettings
        dismiss(animated: true, completion: nil)
    }
    
    func updateFilter(indexPath: IndexPath)  {
        if let cell = tableView.cellForRow(at: indexPath) {
            let cellLanguage = cell.textLabel?.text
            if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                if let language = Language(rawValue: cellLanguage!) {
                     if let languages = settings.languages {
                        if let index = languages.index(of: language) {
                            settings.languages?.remove(at: index)
                        }
                    }
                }
            } else {
                cell.accessoryType = .checkmark
                let language = Language(rawValue: cellLanguage!)
                settings.languages?.append(language!)
            }
        }
    }
    
}
