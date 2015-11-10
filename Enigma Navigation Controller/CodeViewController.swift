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
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return letters[row % 26]
    }
    
    // MARK: History visibilty.
    
    @IBOutlet weak var history: UILabel!
    @IBAction func historyVisibility(sender: UISwitch) {
        history.hidden = !sender.on
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
    
    @IBOutlet weak var qBulb: UILabel!
    @IBOutlet weak var wBulb: UILabel!
    @IBOutlet weak var eBulb: UILabel!
    @IBOutlet weak var rBulb: UILabel!
    @IBOutlet weak var tBulb: UILabel!
    @IBOutlet weak var zBulb: UILabel!
    @IBOutlet weak var uBulb: UILabel!
    @IBOutlet weak var iBulb: UILabel!
    @IBOutlet weak var oBulb: UILabel!
    
    @IBOutlet weak var aBulb: UILabel!
    @IBOutlet weak var sBulb: UILabel!
    @IBOutlet weak var dBulb: UILabel!
    @IBOutlet weak var fBulb: UILabel!
    @IBOutlet weak var gBulb: UILabel!
    @IBOutlet weak var hBulb: UILabel!
    @IBOutlet weak var jBulb: UILabel!
    @IBOutlet weak var kBulb: UILabel!
    
    @IBOutlet weak var pBulb: UILabel!
    @IBOutlet weak var yBulb: UILabel!
    @IBOutlet weak var xBulb: UILabel!
    @IBOutlet weak var cBulb: UILabel!
    @IBOutlet weak var vBulb: UILabel!
    @IBOutlet weak var bBulb: UILabel!
    @IBOutlet weak var nBulb: UILabel!
    @IBOutlet weak var mBulb: UILabel!
    @IBOutlet weak var lBulb: UILabel!
    
    // MARK: Function.
    
    @IBAction func button(sender: UIButton) {
        
        let coded = enigma.code((sender.titleLabel?.text)!)
        
        rotorWindows.selectRow(enigma.windowLeft, inComponent: 0, animated: true)
        rotorWindows.selectRow(enigma.windowCentre, inComponent: 1, animated: true)
        rotorWindows.selectRow(enigma.windowRight, inComponent: 2, animated: true)
        
        switch coded {
        case "Q": qBulb.textColor = UIColor.yellowColor() ; history.text! += "Q"
        case "W": wBulb.textColor = UIColor.yellowColor() ; history.text! += "W"
        case "E": eBulb.textColor = UIColor.yellowColor() ; history.text! += "E"
        case "R": rBulb.textColor = UIColor.yellowColor() ; history.text! += "R"
        case "T": tBulb.textColor = UIColor.yellowColor() ; history.text! += "T"
        case "Z": zBulb.textColor = UIColor.yellowColor() ; history.text! += "Z"
        case "U": uBulb.textColor = UIColor.yellowColor() ; history.text! += "U"
        case "I": iBulb.textColor = UIColor.yellowColor() ; history.text! += "I"
        case "O": oBulb.textColor = UIColor.yellowColor() ; history.text! += "O"
            
        case "A": aBulb.textColor = UIColor.yellowColor() ; history.text! += "A"
        case "S": sBulb.textColor = UIColor.yellowColor() ; history.text! += "S"
        case "D": dBulb.textColor = UIColor.yellowColor() ; history.text! += "D"
        case "F": fBulb.textColor = UIColor.yellowColor() ; history.text! += "F"
        case "G": gBulb.textColor = UIColor.yellowColor() ; history.text! += "G"
        case "H": hBulb.textColor = UIColor.yellowColor() ; history.text! += "H"
        case "J": jBulb.textColor = UIColor.yellowColor() ; history.text! += "J"
        case "K": kBulb.textColor = UIColor.yellowColor() ; history.text! += "K"
            
        case "P": pBulb.textColor = UIColor.yellowColor() ; history.text! += "P"
        case "Y": yBulb.textColor = UIColor.yellowColor() ; history.text! += "Y"
        case "X": xBulb.textColor = UIColor.yellowColor() ; history.text! += "X"
        case "C": cBulb.textColor = UIColor.yellowColor() ; history.text! += "C"
        case "V": vBulb.textColor = UIColor.yellowColor() ; history.text! += "V"
        case "B": bBulb.textColor = UIColor.yellowColor() ; history.text! += "B"
        case "N": nBulb.textColor = UIColor.yellowColor() ; history.text! += "N"
        case "M": mBulb.textColor = UIColor.yellowColor() ; history.text! += "M"
        case "L": lBulb.textColor = UIColor.yellowColor() ; history.text! += "L"
        default: break
        }
        
        if (history.text!.characters.count + 1) % 6 == 0 {
            history.text! += " "
        }
        
    }
    
    @IBAction func buttonRelease(sender: UIButton) { // Return all bulb to "off" (darkGrayColor).
        qBulb.textColor = UIColor.darkGrayColor()
        wBulb.textColor = UIColor.darkGrayColor()
        eBulb.textColor = UIColor.darkGrayColor()
        rBulb.textColor = UIColor.darkGrayColor()
        tBulb.textColor = UIColor.darkGrayColor()
        zBulb.textColor = UIColor.darkGrayColor()
        uBulb.textColor = UIColor.darkGrayColor()
        iBulb.textColor = UIColor.darkGrayColor()
        oBulb.textColor = UIColor.darkGrayColor()
        
        aBulb.textColor = UIColor.darkGrayColor()
        sBulb.textColor = UIColor.darkGrayColor()
        dBulb.textColor = UIColor.darkGrayColor()
        fBulb.textColor = UIColor.darkGrayColor()
        gBulb.textColor = UIColor.darkGrayColor()
        hBulb.textColor = UIColor.darkGrayColor()
        jBulb.textColor = UIColor.darkGrayColor()
        kBulb.textColor = UIColor.darkGrayColor()
        
        pBulb.textColor = UIColor.darkGrayColor()
        yBulb.textColor = UIColor.darkGrayColor()
        xBulb.textColor = UIColor.darkGrayColor()
        cBulb.textColor = UIColor.darkGrayColor()
        vBulb.textColor = UIColor.darkGrayColor()
        bBulb.textColor = UIColor.darkGrayColor()
        nBulb.textColor = UIColor.darkGrayColor()
        mBulb.textColor = UIColor.darkGrayColor()
        lBulb.textColor = UIColor.darkGrayColor()
    }
    
    // MARK: Update offset when rotors are adjusted inside code mode.
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        enigma.updateRotor(row, component: component)
    }

}
