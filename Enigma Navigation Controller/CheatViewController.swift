//
//  CheatViewController.swift
//  Enigma Navigation Controller
//
//  Created by James Coleman on 23/09/2015.
//  Copyright © 2015 iSOS. All rights reserved.
//

import UIKit

class CheatViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let enigma = EnigmaModel()
    
    // MARK: - Setup rotor windows pickerView.
    
    @IBOutlet weak var rotorWindows: UIPickerView!
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    let letters = ["Z", "Y", "X", "W", "V", "U", "T", "S", "R", "Q", "P", "O", "N", "M", "L", "K", "J", "I", "H", "G", "F", "E", "D", "C", "B", "A"]
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return letters.count * 100
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return letters[row % 26]
    }

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // MARK: Set the default rotorWindow positions.
        
        rotorWindows.selectRow(enigma.windowLeft, inComponent: 0, animated: false)
        rotorWindows.selectRow(enigma.windowCentre, inComponent: 1, animated: false)
        rotorWindows.selectRow(enigma.windowRight, inComponent: 2, animated: false)
        
        enigma.initialiseOffset()
        
        textField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Working
    
    @IBOutlet weak var output: UILabel!
    
    @IBAction func enterText(sender: UITextField) {
        enigma.deleteButton(sender, output: output)
        rotorWindows.selectRow(enigma.windowLeft, inComponent: 0, animated: true)
        rotorWindows.selectRow(enigma.windowCentre, inComponent: 1, animated: true)
        rotorWindows.selectRow(enigma.windowRight, inComponent: 2, animated: true)
    }
    
    // MARK: Update offset when rotors are adjusted inside code mode.
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        enigma.updateRotor(row, component: component)
    }

}
