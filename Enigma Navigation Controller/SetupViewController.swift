//
//  SetupViewController.swift
//  Enigma Navigation Controller
//
//  Created by James Coleman on 22/09/2015.
//  Copyright © 2015 iSOS. All rights reserved.
//

import UIKit

//extension ViewController: UIPickerViewDataSource {
//    func valueForRow(row:Int) -> String {
//        // the rows repeat every pickerViewData.count items
//        return pins[row % 26]
//    }
//    func rowForValue(value: Int) -> Int? {
//        if let valueIndex = find(pins, value) {
//            return pickerViewMiddle + value
//        }
//        return nil
//    }
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
//        return "\(valueForRow(row))"
//    }
//}

class SetupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let enigma = EnigmaModel()
    
    // Default plugboard.
    
    var setupPlugboard = ["A":"A", "B":"B", "C":"C", "D":"D", "E":"E", "F":"F", "G":"G", "H":"H", "I":"I", "J":"J", "K":"K", "L":"L", "M":"M", "N":"N", "O":"O", "P":"P", "Q":"Q", "R":"R", "S":"S", "T":"T", "U":"U", "V":"V", "W":"W", "X":"X", "Y":"Y", "Z":"Z"]
    
    // MARK: Setup plugboard.
    
    var qLastValue = ""
    @IBOutlet weak var outletQ: UITextField!
    @IBAction func textFieldQ(sender: UITextField) {
        setPlug("Q", to: sender.text!)
        if sender.text! != "" {
            qLastValue = sender.text!
        } else {
            removePlug("Q", lastValue: qLastValue)
        }
    }
    
    var wLastValue = ""
    @IBOutlet weak var outletW: UITextField!
    @IBAction func textFieldW(sender: UITextField) {
        setPlug("W", to: sender.text!)
        if sender.text! != "" {
            wLastValue = sender.text!
        } else {
            removePlug("W", lastValue: wLastValue)
        }
    }
    
    var eLastValue = ""
    @IBOutlet weak var outletE: UITextField!
    @IBAction func textFieldE(sender: UITextField) {
        setPlug("E", to: sender.text!)
        if sender.text! != "" {
            eLastValue = sender.text!
        } else {
            removePlug("E", lastValue: eLastValue)
        }
    }
    
    var rLastValue = ""
    @IBOutlet weak var outletR: UITextField!
    @IBAction func textFieldR(sender: UITextField) {
        setPlug("R", to: sender.text!)
        if sender.text! != "" {
            rLastValue = sender.text!
        } else {
            removePlug("R", lastValue: rLastValue)
        }
    }
    
    var tLastValue = ""
    @IBOutlet weak var outletT: UITextField!
    @IBAction func textFieldT(sender: UITextField) {
        setPlug("T", to: sender.text!)
        if sender.text! != "" {
            tLastValue = sender.text!
        } else {
            removePlug("T", lastValue: tLastValue)
        }
    }
    
    var zLastValue = ""
    @IBOutlet weak var outletZ: UITextField!
    @IBAction func textFieldZ(sender: UITextField) {
        setPlug("Z", to: sender.text!)
        if sender.text! != "" {
            zLastValue = sender.text!
        } else {
            removePlug("Z", lastValue: zLastValue)
        }
    }
    
    var uLastValue = ""
    @IBOutlet weak var outletU: UITextField!
    @IBAction func textFieldU(sender: UITextField) {
        setPlug("U", to: sender.text!)
        if sender.text! != "" {
            uLastValue = sender.text!
        } else {
            removePlug("U", lastValue: uLastValue)
        }
    }
    
    var iLastValue = ""
    @IBOutlet weak var outletI: UITextField!
    @IBAction func textFieldI(sender: UITextField) {
        setPlug("I", to: sender.text!)
        if sender.text! != "" {
            iLastValue = sender.text!
        } else {
            removePlug("I", lastValue: iLastValue)
        }
    }
    
    var oLastValue = ""
    @IBOutlet weak var outletO: UITextField!
    @IBAction func textFieldO(sender: UITextField) {
        setPlug("O", to: sender.text!)
        if sender.text! != "" {
            oLastValue = sender.text!
        } else {
            removePlug("O", lastValue: oLastValue)
        }
    }
    
    var aLastValue = ""
    @IBOutlet weak var outletA: UITextField!
    @IBAction func textFieldA(sender: UITextField) {
        setPlug("A", to: sender.text!)
        if sender.text! != "" {
            aLastValue = sender.text!
        } else {
            removePlug("A", lastValue: aLastValue)
        }
    }
    
    var sLastValue = ""
    @IBOutlet weak var outletS: UITextField!
    @IBAction func textFieldS(sender: UITextField) {
        setPlug("S", to: sender.text!)
        if sender.text! != "" {
            sLastValue = sender.text!
        } else {
            removePlug("S", lastValue: sLastValue)
        }
    }
    
    var dLastValue = ""
    @IBOutlet weak var outletD: UITextField!
    @IBAction func textFieldD(sender: UITextField) {
        setPlug("D", to: sender.text!)
        if sender.text! != "" {
            dLastValue = sender.text!
        } else {
            removePlug("D", lastValue: dLastValue)
        }
    }
    
    var fLastValue = ""
    @IBOutlet weak var outletF: UITextField!
    @IBAction func textFieldF(sender: UITextField) {
        setPlug("F", to: sender.text!)
        if sender.text! != "" {
            fLastValue = sender.text!
        } else {
            removePlug("F", lastValue: fLastValue)
        }
    }
    
    var gLastValue = ""
    @IBOutlet weak var outletG: UITextField!
    @IBAction func textFieldG(sender: UITextField) {
        setPlug("G", to: sender.text!)
        if sender.text! != "" {
            gLastValue = sender.text!
        } else {
            removePlug("G", lastValue: gLastValue)
        }
    }
    
    var hLastValue = ""
    @IBOutlet weak var outletH: UITextField!
    @IBAction func textFieldH(sender: UITextField) {
        setPlug("H", to: sender.text!)
        if sender.text! != "" {
            hLastValue = sender.text!
        } else {
            removePlug("H", lastValue: hLastValue)
        }
    }
    
    var jLastValue = ""
    @IBOutlet weak var outletJ: UITextField!
    @IBAction func textFieldJ(sender: UITextField) {
        setPlug("J", to: sender.text!)
        if sender.text! != "" {
            jLastValue = sender.text!
        } else {
            removePlug("J", lastValue: jLastValue)
        }
    }
    
    var kLastValue = ""
    @IBOutlet weak var outletK: UITextField!
    @IBAction func textFieldK(sender: UITextField) {
        setPlug("K", to: sender.text!)
        if sender.text! != "" {
            kLastValue = sender.text!
        } else {
            removePlug("K", lastValue: kLastValue)
        }
    }
    
    var pLastValue = ""
    @IBOutlet weak var outletP: UITextField!
    @IBAction func textFieldP(sender: UITextField) {
        setPlug("P", to: sender.text!)
        if sender.text! != "" {
            pLastValue = sender.text!
        } else {
            removePlug("P", lastValue: pLastValue)
        }
    }
    
    var yLastValue = ""
    @IBOutlet weak var outletY: UITextField!
    @IBAction func textFieldY(sender: UITextField) {
        setPlug("Y", to: sender.text!)
        if sender.text! != "" {
            yLastValue = sender.text!
        } else {
            removePlug("Y", lastValue: yLastValue)
        }
    }
    
    var xLastValue = ""
    @IBOutlet weak var outletX: UITextField!
    @IBAction func textFieldX(sender: UITextField) {
        setPlug("X", to: sender.text!)
        if sender.text! != "" {
            xLastValue = sender.text!
        } else {
            removePlug("X", lastValue: xLastValue)
        }
    }
    
    var cLastValue = ""
    @IBOutlet weak var outletC: UITextField!
    @IBAction func textFieldC(sender: UITextField) {
        setPlug("C", to: sender.text!)
        if sender.text! != "" {
            cLastValue = sender.text!
        } else {
            removePlug("C", lastValue: cLastValue)
        }
    }
    
    var vLastValue = ""
    @IBOutlet weak var outletV: UITextField!
    @IBAction func textFieldV(sender: UITextField) {
        setPlug("V", to: sender.text!)
        if sender.text! != "" {
            vLastValue = sender.text!
        } else {
            removePlug("V", lastValue: vLastValue)
        }
    }
    
    var bLastValue = ""
    @IBOutlet weak var outletB: UITextField!
    @IBAction func textFieldB(sender: UITextField) {
        setPlug("B", to: sender.text!)
        if sender.text! != "" {
            bLastValue = sender.text!
        } else {
            removePlug("B", lastValue: bLastValue)
        }
    }
    
    var nLastValue = ""
    @IBOutlet weak var outletN: UITextField!
    @IBAction func textFieldN(sender: UITextField) {
        setPlug("N", to: sender.text!)
        if sender.text! != "" {
            nLastValue = sender.text!
        } else {
            removePlug("N", lastValue: nLastValue)
        }
    }
    
    var mLastValue = ""
    @IBOutlet weak var outletM: UITextField!
    @IBAction func textFieldM(sender: UITextField) {
        setPlug("M", to: sender.text!)
        if sender.text! != "" {
            mLastValue = sender.text!
        } else {
            removePlug("M", lastValue: mLastValue)
        }
    }
    
    var lLastValue = ""
    @IBOutlet weak var outletL: UITextField!
    @IBAction func textFieldL(sender: UITextField) {
        setPlug("L", to: sender.text!)
        if sender.text! != "" {
            lLastValue = sender.text!
        } else {
            removePlug("L", lastValue: lLastValue)
        }
    }
    
    func setPlug(from:String, to:String) {
        switch to {
        case "Q": outletQ.text = from
        case "W": outletW.text = from
        case "E": outletE.text = from
        case "R": outletR.text = from
        case "T": outletT.text = from
        case "Z": outletZ.text = from
        case "U": outletU.text = from
        case "I": outletI.text = from
        case "O": outletO.text = from
            
        case "A": outletA.text = from
        case "S": outletS.text = from
        case "D": outletD.text = from
        case "F": outletF.text = from
        case "G": outletG.text = from
        case "H": outletH.text = from
        case "J": outletJ.text = from
        case "K": outletK.text = from
            
        case "P": outletP.text = from
        case "Y": outletY.text = from
        case "X": outletX.text = from
        case "C": outletC.text = from
        case "V": outletV.text = from
        case "B": outletB.text = from
        case "N": outletN.text = from
        case "M": outletM.text = from
        case "L": outletL.text = from
        default: break
        }
        
        setupPlugboard[from] = to
        
        for (key, _) in setupPlugboard {
            if key == to {
                setupPlugboard[key] = from
                break
            }
        }
    }
    
    func removePlug(plug: String, lastValue: String) {
        switch lastValue {
        case "Q": outletQ.text = ""
        case "W": outletW.text = ""
        case "E": outletE.text = ""
        case "R": outletR.text = ""
        case "T": outletT.text = ""
        case "Z": outletZ.text = ""
        case "U": outletU.text = ""
        case "I": outletI.text = ""
        case "O": outletO.text = ""
            
        case "A": outletA.text = ""
        case "S": outletS.text = ""
        case "D": outletD.text = ""
        case "F": outletF.text = ""
        case "G": outletG.text = ""
        case "H": outletH.text = ""
        case "J": outletJ.text = ""
        case "K": outletK.text = ""
            
        case "P": outletP.text = ""
        case "Y": outletY.text = ""
        case "X": outletX.text = ""
        case "C": outletC.text = ""
        case "V": outletV.text = ""
        case "B": outletB.text = ""
        case "N": outletN.text = ""
        case "M": outletM.text = ""
        case "L": outletL.text = ""
        default: break
        }
        
        setupPlugboard[plug] = plug
        setupPlugboard[lastValue] = lastValue
    }
    
    // Finish setting up plugboard.
    
    // MARK: Setup rotor selection and setup.
    
    //pickerView outlets.

    @IBOutlet weak var rotorSelection: UIPickerView!
    @IBOutlet weak var ringSettings: UIPickerView!
    @IBOutlet weak var rotorWindows: UIPickerView!
    
    // Number of components in pickerView.
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        switch pickerView {
        case rotorSelection: return 4
        default: return 3
        }
    }
    
    // Data for the pickerViews.
    
    let rotorOptions = [["A", "B", "C"],["I", "II", "III", "IV", "V"]]
    
    let pins = ["Z/26", "Y/25", "X/24", "W/23", "V/22", "U/21", "T/20", "S/19", "R/18", "Q/17", "P/16", "O/15", "N/14", "M/13", "L/12", "K/11", "J/10", "I/09", "H/08", "G/07", "F/06", "E/05", "D/04", "C/03", "B/02", "A/01"]
    
    let letters = ["Z", "Y", "X", "W", "V", "U", "T", "S", "R", "Q", "P", "O", "N", "M", "L", "K", "J", "I", "H", "G", "F", "E", "D", "C", "B", "A"]
    
    // Number of rows in component.
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case rotorSelection:
            switch component {
            case 0: return rotorOptions[0].count
            default: return rotorOptions[1].count
            }
        case ringSettings: return pins.count * 100
        case rotorWindows: return letters.count * 100
        default: return 0
        }
    }
    
    // View for row.
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        let attributes = [NSForegroundColorAttributeName : UIColor(white: 74/255, alpha: 1), NSFontAttributeName : UIFont(name: "Montserrat", size: 20)!]
        var attributedString = NSAttributedString()
        
        switch pickerView {
        case rotorSelection:
            switch component {
            case 0: attributedString = NSAttributedString(string: rotorOptions[0][row], attributes: attributes)
            default: attributedString = NSAttributedString(string: rotorOptions[1][row], attributes: attributes)
            }
        case ringSettings: attributedString = NSAttributedString(string: pins[row % 26], attributes: attributes)
        case rotorWindows: attributedString = NSAttributedString(string: letters[row % 26], attributes: attributes)
        default: break
        }
        
        pickerLabel.attributedText = attributedString
        pickerLabel.textAlignment = .Center
        
        return pickerLabel
    }
    
    // Finish setting up rotors.
    
    @IBOutlet weak var bottomConstraint : NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Display the default rotors.
        
        rotorSelection.selectRow(1, inComponent: 0, animated: false)
        rotorSelection.selectRow(0, inComponent: 1, animated: false)
        rotorSelection.selectRow(1, inComponent: 2, animated: false)
        rotorSelection.selectRow(2, inComponent: 3, animated: false)
            
        ringSettings.selectRow(1299, inComponent: 0, animated: false)
        ringSettings.selectRow(1299, inComponent: 1, animated: false)
        ringSettings.selectRow(1299, inComponent: 2, animated: false)
        
        rotorWindows.selectRow(1299, inComponent: 0, animated: false)
        rotorWindows.selectRow(1299, inComponent: 1, animated: false)
        rotorWindows.selectRow(1299, inComponent: 2, animated: false)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardChanged:", name: UIKeyboardWillChangeFrameNotification, object: nil) // Call the function keyboardChanged() if the keyboard appears or disappears.
        
    }
    
    // MARK: Change the bottom constraint to account for the open keyboard.
    
    func keyboardChanged(notification: NSNotification) {
        let info = notification.userInfo
        let duration = info?[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        let keyboardRect = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let distanceFromTop = self.view.window?.convertRect(keyboardRect, toView: self.view).origin.y
        if let distanceFromTop = distanceFromTop {
            let distanceFromBottom = self.view.bounds.height - distanceFromTop
            UIView.animateWithDuration(duration, animations: { () -> Void in
                self.bottomConstraint.constant = distanceFromBottom
                self.view.layoutIfNeeded()
            })
        }
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    let letterReverser = [25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0] // To account for rotor behavior vs pickerView behavior.
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
        
        if segue.destinationViewController is CodeViewController {
            
            let codeViewController = segue.destinationViewController as! CodeViewController
            
            // Making pickerView rotor windows match.
            codeViewController.enigma.windowLeft = rotorWindows.selectedRowInComponent(0)
            codeViewController.enigma.windowCentre = rotorWindows.selectedRowInComponent(1)
            codeViewController.enigma.windowRight = rotorWindows.selectedRowInComponent(2)
            
            // Setting rotors.
            
            switch rotorSelection.selectedRowInComponent(0) {
            case 0: codeViewController.enigma.reflector = enigma.reflectorA
            case 1: codeViewController.enigma.reflector = enigma.reflectorB
            case 2: codeViewController.enigma.reflector = enigma.reflectorC
            default: break
            }
            
            switch rotorSelection.selectedRowInComponent(1) {
            case 0: codeViewController.enigma.left = enigma.rotorI
            case 1: codeViewController.enigma.left = enigma.rotorII
            case 2: codeViewController.enigma.left = enigma.rotorIII
            case 3: codeViewController.enigma.left = enigma.rotorIV
            case 4: codeViewController.enigma.left = enigma.rotorV
            default: break
            }
            
            switch rotorSelection.selectedRowInComponent(2) {
            case 0: codeViewController.enigma.centre = enigma.rotorI
            case 1: codeViewController.enigma.centre = enigma.rotorII
            case 2: codeViewController.enigma.centre = enigma.rotorIII
            case 3: codeViewController.enigma.centre = enigma.rotorIV
            case 4: codeViewController.enigma.centre = enigma.rotorV
            default: break
            }
            
            switch rotorSelection.selectedRowInComponent(3) {
            case 0: codeViewController.enigma.right = enigma.rotorI
            case 1: codeViewController.enigma.right = enigma.rotorII
            case 2: codeViewController.enigma.right = enigma.rotorIII
            case 3: codeViewController.enigma.right = enigma.rotorIV
            case 4: codeViewController.enigma.right = enigma.rotorV
            default: break
            }
            
            // Setting rotor pins.
            
            codeViewController.enigma.ringLeft = letterReverser[ringSettings.selectedRowInComponent(0) % 26]
            codeViewController.enigma.ringCentre = letterReverser[ringSettings.selectedRowInComponent(1) % 26]
            codeViewController.enigma.ringRight = letterReverser[ringSettings.selectedRowInComponent(2) % 26]
            
            // Setting rotor offset.
            
            codeViewController.enigma.rotorOffsetLeft = letterReverser[rotorWindows.selectedRowInComponent(0) % 26]
            codeViewController.enigma.rotorOffsetCentre = letterReverser[rotorWindows.selectedRowInComponent(1) % 26]
            codeViewController.enigma.rotorOffsetRight = letterReverser[rotorWindows.selectedRowInComponent(2) % 26]
            
            // Setting plugboard.
            
            codeViewController.enigma.plugboard = setupPlugboard
            
        } else if segue.destinationViewController is CheatViewController {
            
            let cheatViewController = segue.destinationViewController as! CheatViewController
            
            // Making pickerView rotor windows match.
            cheatViewController.enigma.windowLeft = rotorWindows.selectedRowInComponent(0)
            cheatViewController.enigma.windowCentre = rotorWindows.selectedRowInComponent(1)
            cheatViewController.enigma.windowRight = rotorWindows.selectedRowInComponent(2)
            
            // Setting rotors.
            
            switch rotorSelection.selectedRowInComponent(0) {
            case 0: cheatViewController.enigma.reflector = enigma.reflectorA
            case 1: cheatViewController.enigma.reflector = enigma.reflectorB
            case 2: cheatViewController.enigma.reflector = enigma.reflectorC
            default: break
            }
            
            switch rotorSelection.selectedRowInComponent(1) {
            case 0: cheatViewController.enigma.left = enigma.rotorI
            case 1: cheatViewController.enigma.left = enigma.rotorII
            case 2: cheatViewController.enigma.left = enigma.rotorIII
            case 3: cheatViewController.enigma.left = enigma.rotorIV
            case 4: cheatViewController.enigma.left = enigma.rotorV
            default: break
            }
            
            switch rotorSelection.selectedRowInComponent(2) {
            case 0: cheatViewController.enigma.centre = enigma.rotorI
            case 1: cheatViewController.enigma.centre = enigma.rotorII
            case 2: cheatViewController.enigma.centre = enigma.rotorIII
            case 3: cheatViewController.enigma.centre = enigma.rotorIV
            case 4: cheatViewController.enigma.centre = enigma.rotorV
            default: break
            }
            
            switch rotorSelection.selectedRowInComponent(3) {
            case 0: cheatViewController.enigma.right = enigma.rotorI
            case 1: cheatViewController.enigma.right = enigma.rotorII
            case 2: cheatViewController.enigma.right = enigma.rotorIII
            case 3: cheatViewController.enigma.right = enigma.rotorIV
            case 4: cheatViewController.enigma.right = enigma.rotorV
            default: break
            }
            
            // Setting rotor pins.
            
            cheatViewController.enigma.ringLeft = letterReverser[ringSettings.selectedRowInComponent(0) % 26]
            cheatViewController.enigma.ringCentre = letterReverser[ringSettings.selectedRowInComponent(1) % 26]
            cheatViewController.enigma.ringRight = letterReverser[ringSettings.selectedRowInComponent(2) % 26]
            
            // Setting rotor offset.
            
            cheatViewController.enigma.rotorOffsetLeft = letterReverser[rotorWindows.selectedRowInComponent(0) % 26]
            cheatViewController.enigma.rotorOffsetCentre = letterReverser[rotorWindows.selectedRowInComponent(1) % 26]
            cheatViewController.enigma.rotorOffsetRight = letterReverser[rotorWindows.selectedRowInComponent(2) % 26]
            
            // Setting plugboard.
            
            cheatViewController.enigma.plugboard = setupPlugboard
        }
    }
}

