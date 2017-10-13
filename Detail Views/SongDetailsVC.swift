//
//  SongDetailsVC.swift
//  FHE
//
//  Created by Rylan Evans on 10/13/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

class SongDetailsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var songThemePicker: UIPickerView!
    @IBOutlet weak var songThemeTextField: UITextField!
    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var songSourceTextField: UITextField!
    @IBOutlet weak var songNumberTextField: UITextField!
    @IBOutlet weak var songURLTextField: UITextField!
    @IBAction func songActiveSwitch(_ sender: UISwitch) {
    }
    
    var songThemes = [Theme]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        songThemePicker.delegate = self
        songThemePicker.dataSource = self
        
        let songTheme1 = Theme(context: context)
        songTheme1.theme = "Charity"
        let songTheme2 = Theme(context: context)
        songTheme2.theme = "Atonement"
        let songTheme3 = Theme(context: context)
        songTheme3.theme = "Articles of Faith"
        let songTheme4 = Theme(context: context)
        songTheme4.theme = "Commandments"
        let songTheme5 = Theme(context: context)
        songTheme5.theme = "Heavenly Father"
        let songTheme6 = Theme(context: context)
        songTheme6.theme = "Jesus Christ"
        
//        ad.saveContext()
        getThemes()
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let songTheme = songThemes[row]
        return songTheme.theme
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return songThemes.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // update when selected
    }
    
    func getThemes() {
        let fetchRequest: NSFetchRequest<Theme> = Theme.fetchRequest()
        
        do {
            self.songThemes = try context.fetch(fetchRequest)
            self.songThemePicker.reloadAllComponents()
        } catch {
            // handle the error
        }
    }
}
