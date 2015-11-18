//
//  CodeViewController.swift
//  Enigma Navigation Controller
//
//  Created by James Coleman on 22/09/2015.
//  Copyright © 2015 iSOS. All rights reserved.
//

import UIKit

class CodeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var enigma = EnigmaModel()
    
    // MARK: - Setup rotor windows pickerView.
    
    @IBOutlet weak var rotorWindows: UIPickerView!
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    let letters = ["Z", "Y", "X", "W", "V", "U", "T", "S", "R", "Q", "P", "O", "N", "M", "L", "K", "J", "I", "H", "G", "F", "E", "D", "C", "B", "A"]
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return letters.count * 100
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let attributedString = NSAttributedString(string: letters[row % 26], attributes: [NSForegroundColorAttributeName : UIColor(white: 74/255, alpha: 1), NSFontAttributeName : UIFont(name: "Montserrat", size: 20)!])
        pickerLabel.attributedText = attributedString
        pickerLabel.textAlignment = .Center
        return pickerLabel
    }
    
    // MARK: History visibilty.
    
    @IBOutlet weak var history: UILabel!
    @IBOutlet weak var historyBackground: UIView!
    
    @IBAction func historyVisible(sender: SevenSwitch) {
        history.hidden = !sender.on
        historyBackground.hidden = !sender.on
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // MARK: Set the default rotorWindow positions.
        
        rotorWindows.selectRow(enigma.windowLeft, inComponent: 0, animated: false)
        rotorWindows.selectRow(enigma.windowCentre, inComponent: 1, animated: false)
        rotorWindows.selectRow(enigma.windowRight, inComponent: 2, animated: false)
        
        enigma.initialiseOffset()
        
        // Note: Don't need to 'clear' the history due to the view unloading.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Buttons.
    
    // MARK: Bulb outlets.
    
    @IBOutlet weak var qBulb: Lightboard!
    @IBOutlet weak var wBulb: Lightboard!
    @IBOutlet weak var eBulb: Lightboard!
    @IBOutlet weak var rBulb: Lightboard!
    @IBOutlet weak var tBulb: Lightboard!
    @IBOutlet weak var zBulb: Lightboard!
    @IBOutlet weak var uBulb: Lightboard!
    @IBOutlet weak var iBulb: Lightboard!
    @IBOutlet weak var oBulb: Lightboard!
    
    @IBOutlet weak var aBulb: Lightboard!
    @IBOutlet weak var sBulb: Lightboard!
    @IBOutlet weak var dBulb: Lightboard!
    @IBOutlet weak var fBulb: Lightboard!
    @IBOutlet weak var gBulb: Lightboard!
    @IBOutlet weak var hBulb: Lightboard!
    @IBOutlet weak var jBulb: Lightboard!
    @IBOutlet weak var kBulb: Lightboard!
    
    @IBOutlet weak var pBulb: Lightboard!
    @IBOutlet weak var yBulb: Lightboard!
    @IBOutlet weak var xBulb: Lightboard!
    @IBOutlet weak var cBulb: Lightboard!
    @IBOutlet weak var vBulb: Lightboard!
    @IBOutlet weak var bBulb: Lightboard!
    @IBOutlet weak var nBulb: Lightboard!
    @IBOutlet weak var mBulb: Lightboard!
    @IBOutlet weak var lBulb: Lightboard!
    
    // MARK: Function.
    
    @IBAction func button(sender: KeyButton) {
        
        sender.pressed = true
        
        let coded = enigma.code((sender.titleLabel?.text)!)
        
        rotorWindows.selectRow(enigma.windowLeft, inComponent: 0, animated: true)
        rotorWindows.selectRow(enigma.windowCentre, inComponent: 1, animated: true)
        rotorWindows.selectRow(enigma.windowRight, inComponent: 2, animated: true)
        
        switch coded {
        case "Q": qBulb.lit = true ; history.text! += "Q"
        case "W": wBulb.lit = true ; history.text! += "W"
        case "E": eBulb.lit = true ; history.text! += "E"
        case "R": rBulb.lit = true ; history.text! += "R"
        case "T": tBulb.lit = true ; history.text! += "T"
        case "Z": zBulb.lit = true ; history.text! += "Z"
        case "U": uBulb.lit = true ; history.text! += "U"
        case "I": iBulb.lit = true ; history.text! += "I"
        case "O": oBulb.lit = true ; history.text! += "O"
            
        case "A": aBulb.lit = true ; history.text! += "A"
        case "S": sBulb.lit = true ; history.text! += "S"
        case "D": dBulb.lit = true ; history.text! += "D"
        case "F": fBulb.lit = true ; history.text! += "F"
        case "G": gBulb.lit = true ; history.text! += "G"
        case "H": hBulb.lit = true ; history.text! += "H"
        case "J": jBulb.lit = true ; history.text! += "J"
        case "K": kBulb.lit = true ; history.text! += "K"
            
        case "P": pBulb.lit = true ; history.text! += "P"
        case "Y": yBulb.lit = true ; history.text! += "Y"
        case "X": xBulb.lit = true ; history.text! += "X"
        case "C": cBulb.lit = true ; history.text! += "C"
        case "V": vBulb.lit = true ; history.text! += "V"
        case "B": bBulb.lit = true ; history.text! += "B"
        case "N": nBulb.lit = true ; history.text! += "N"
        case "M": mBulb.lit = true ; history.text! += "M"
        case "L": lBulb.lit = true ; history.text! += "L"
        default: break
        }
        
        if (history.text!.characters.count + 1) % 6 == 0 {
            history.text! += " "
        }
        
    }
    
    @IBOutlet var lightboard: [Lightboard]!
    
    @IBAction func buttonRelease(sender: KeyButton) { // Return all bulb to "off".
        
        sender.pressed = false
        
        for bulb in lightboard {
            bulb.lit = false
        }
    }
    
    // MARK: Update offset when rotors are adjusted inside code mode.
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        enigma.updateRotor(row, component: component)
    }

}
