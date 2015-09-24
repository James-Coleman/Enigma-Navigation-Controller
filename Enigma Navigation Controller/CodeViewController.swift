//
//  CodeViewController.swift
//  Enigma Navigation Controller
//
//  Created by James Coleman on 22/09/2015.
//  Copyright © 2015 iSOS. All rights reserved.
//

import UIKit

class CodeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Enigma
    
    // MARK: Setup alphabet letter numerical equivalents.
    
    let alphabet = ["A":0, "B":1, "C":2, "D":3, "E":4, "F":5, "G":6, "H":7, "I":8, "J":9, "K":10, "L":11, "M":12, "N":13, "O":14, "P":15, "Q":16, "R":17, "S":18, "T":19, "U":20, "V":21, "W":22, "X":23, "Y":24, "Z":25]
    
    // MARK: Setup rotors and reflector.
    
    // Slightly cheating by making left / centre / right = rotorI / rotorII / rotorIII in a very literal way. (And making them variable).
    // Storing other data in SetupViewController.
    
    var left = (rotor:["A":"E", "B":"K", "C":"M", "D":"F", "E":"L", "F":"G", "G":"D", "H":"Q", "I":"V", "J":"Z", "K":"N", "L":"T", "M":"O", "N":"W", "O":"Y", "P":"H", "Q":"X", "R":"U", "S":"S", "T":"P", "U":"A", "V":"I", "W":"B", "X":"R", "Y":"C", "Z":"J"], step:8)
    var centre = (rotor:["A":"A", "B":"J", "C":"D", "D":"K", "E":"S", "F":"I", "G":"R", "H":"U", "I":"X", "J":"B", "K":"L", "L":"H", "M":"W", "N":"T", "O":"M", "P":"C", "Q":"Q", "R":"G", "S":"Z", "T":"N", "U":"P", "V":"Y", "W":"F", "X":"V", "Y":"O", "Z":"E"], step:20)
    var right = (rotor:["A":"B", "B":"D", "C":"F", "D":"H", "E":"J", "F":"L", "G":"C", "H":"P", "I":"R", "J":"T", "K":"X", "L":"V", "M":"Z", "N":"N", "O":"Y", "P":"E", "Q":"I", "R":"W", "S":"G", "T":"A", "U":"K", "V":"M", "W":"U", "X":"S", "Y":"Q", "Z":"O"], step:3)

    var reflector = ["A":"Y", "B":"R", "C":"U", "D":"H", "E":"Q", "F":"S", "G":"L", "H":"D", "I":"P", "J":"X", "K":"N", "L":"G", "M":"O", "N":"K", "O":"M", "P":"I", "Q":"E", "R":"B", "S":"F", "T":"Z", "U":"C", "V":"W", "W":"V", "X":"J", "Y":"A", "Z":"T"]
    
    var plugboard = ["A":"A", "B":"B", "C":"C", "D":"D", "E":"E", "F":"F", "G":"G", "H":"H", "I":"I", "J":"J", "K":"K", "L":"L", "M":"M", "N":"N", "O":"O", "P":"P", "Q":"Q", "R":"R", "S":"S", "T":"T", "U":"U", "V":"V", "W":"W", "X":"X", "Y":"Y", "Z":"Z"]

    // MARK: Create window letters.
    
    var windowLeft = 25
    var windowCentre = 25
    var windowRight = 25
    
    // MARK: Letter offset.
    
    let previousLetter = ["A":"Z", "B":"A", "C":"B", "D":"C", "E":"D", "F":"E", "G":"F", "H":"G", "I":"H", "J":"I", "K":"J", "L":"K", "M":"L", "N":"M", "O":"N", "P":"O", "Q":"P", "R":"Q", "S":"R", "T":"S", "U":"T", "V":"U", "W":"V", "X":"W", "Y":"X", "Z":"Y"]
    
    func letterOffset(inout rotor:[String:String]) {
        for (key, value) in rotor {
            rotor[key] = previousLetter[value]
        }
    }
    
    let nextLetter = ["A":"B", "B":"C", "C":"D", "D":"E", "E":"F", "F":"G", "G":"H", "H":"I", "I":"J", "J":"K", "K":"L", "L":"M", "M":"N", "N":"O", "O":"P", "P":"Q", "Q":"R", "R":"S", "S":"T", "T":"U", "U":"V", "V":"W", "W":"X", "X":"Y", "Y":"Z", "Z":"A"]
    
    func letterOffsetStep(inout rotor:[String:String]) {
        for (key, value) in rotor {
            rotor[key] = nextLetter[value]
        }
    }
    
    // MARK: Rotor 'rotation'.
    
    func advanceRotor(inout rotor:(rotor:[String:String], step:Int)) {
        (rotor.rotor["A"], rotor.rotor["B"], rotor.rotor["C"], rotor.rotor["D"], rotor.rotor["E"], rotor.rotor["F"], rotor.rotor["G"], rotor.rotor["H"], rotor.rotor["I"], rotor.rotor["J"], rotor.rotor["K"], rotor.rotor["L"], rotor.rotor["M"], rotor.rotor["N"], rotor.rotor["O"], rotor.rotor["P"], rotor.rotor["Q"], rotor.rotor["R"], rotor.rotor["S"], rotor.rotor["T"], rotor.rotor["U"], rotor.rotor["V"], rotor.rotor["W"], rotor.rotor["X"], rotor.rotor["Y"], rotor.rotor["Z"]) = (rotor.rotor["B"], rotor.rotor["C"], rotor.rotor["D"], rotor.rotor["E"], rotor.rotor["F"], rotor.rotor["G"], rotor.rotor["H"], rotor.rotor["I"], rotor.rotor["J"], rotor.rotor["K"], rotor.rotor["L"], rotor.rotor["M"], rotor.rotor["N"], rotor.rotor["O"], rotor.rotor["P"], rotor.rotor["Q"], rotor.rotor["R"], rotor.rotor["S"], rotor.rotor["T"], rotor.rotor["U"], rotor.rotor["V"], rotor.rotor["W"], rotor.rotor["X"], rotor.rotor["Y"], rotor.rotor["Z"], rotor.rotor["A"])
        letterOffset(&rotor.rotor)
    }
    
    func advanceWindow(inout window: Int) {
        if window > 0 {
            window--
        } else {
            window = 25
        }
    }
    
    func stepRotor(inout rotor:(rotor:[String:String], step:Int)) { // This should only need to be the same as advanceRotor, I have no idea why it has to go in the opposite direction, unless the online explanations are also backwards.
        (rotor.rotor["A"], rotor.rotor["B"], rotor.rotor["C"], rotor.rotor["D"], rotor.rotor["E"], rotor.rotor["F"], rotor.rotor["G"], rotor.rotor["H"], rotor.rotor["I"], rotor.rotor["J"], rotor.rotor["K"], rotor.rotor["L"], rotor.rotor["M"], rotor.rotor["N"], rotor.rotor["O"], rotor.rotor["P"], rotor.rotor["Q"], rotor.rotor["R"], rotor.rotor["S"], rotor.rotor["T"], rotor.rotor["U"], rotor.rotor["V"], rotor.rotor["W"], rotor.rotor["X"], rotor.rotor["Y"], rotor.rotor["Z"]) = (rotor.rotor["Z"], rotor.rotor["A"], rotor.rotor["B"], rotor.rotor["C"], rotor.rotor["D"], rotor.rotor["E"], rotor.rotor["F"], rotor.rotor["G"], rotor.rotor["H"], rotor.rotor["I"], rotor.rotor["J"], rotor.rotor["K"], rotor.rotor["L"], rotor.rotor["M"], rotor.rotor["N"], rotor.rotor["O"], rotor.rotor["P"], rotor.rotor["Q"], rotor.rotor["R"], rotor.rotor["S"], rotor.rotor["T"], rotor.rotor["U"], rotor.rotor["V"], rotor.rotor["W"], rotor.rotor["X"], rotor.rotor["Y"])
        letterOffsetStep(&rotor.rotor)
    }
    
    // MARK: Encoding.
    
    // Plugboard encoding.
    
    func plugboard(letter: String) -> String {
        return plugboard[letter]!
    }
    
    // First rotor encoding.
    
    func rightRotor(letter: String) -> String {
        return right.rotor[letter]!
    }
    
    // Second rotor encoding.
    
    func centreRotor(letter: String) -> String {
        return centre.rotor[letter]!
    }
    
    // Third rotor encoding.
    
    func leftRotor(letter: String) -> String {
        return left.rotor[letter]!
    }
    
    // Reflector.
    
    func reflector(letter: String) -> String {
        return reflector[letter]!
    }
    
    // Reversed third rotor.
    
    func reversedLeftRotor(letter: String) -> String {
        var i = ""
        for (key, value) in left.rotor {
            if letter == value {
                i = key
                break
            }
        }
        return i
    }
    
    // Reversed second rotor.
    
    func reversedCentreRotor(letter: String) -> String {
        var i = ""
        for (key, value) in centre.rotor {
            if letter == value {
                i = key
                break
            }
        }
        return i
    }
    
    // Reversed first rotor.
    
    func reversedRightRotor(letter: String) -> String {
        var i = ""
        for (key, value) in right.rotor {
            if letter == value {
                i = key
                break
            }
        }
        return i
    }
    
    var doubleStep = false
    
    func code(letter:String) -> String {
        advanceRotor(&right)
        advanceWindow(&windowRight)
        if doubleStep {
            advanceRotor(&centre)
            advanceWindow(&windowCentre)
            advanceRotor(&left)
            advanceWindow(&windowLeft)
            doubleStep = false
        }
        if windowRight == right.step {
            advanceRotor(&centre)
            advanceWindow(&windowCentre)
        }
        if windowCentre == centre.step + 1 {
            doubleStep = true
        }
        rotorWindows.selectRow(windowLeft, inComponent: 0, animated: true)
        rotorWindows.selectRow(windowCentre, inComponent: 1, animated: true)
        rotorWindows.selectRow(windowRight, inComponent: 2, animated: true)
        if (history.text!.characters.count + 1) % 6 == 0 {
            history.text! += " "
        }
        return plugboard(reversedRightRotor(reversedCentreRotor(reversedLeftRotor(reflector(leftRotor(centreRotor(rightRotor(plugboard("\(letter)")))))))))
    }
    
    // Finish Enigma
    
    // MARK: - Setup rotor windows pickerView.
    
    @IBOutlet weak var rotorWindows: UIPickerView!
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    let letters = ["Z", "Y", "X", "W", "V", "U", "T", "S", "R", "Q", "P", "O", "N", "M", "L", "K", "J", "I", "H", "G", "F", "E", "D", "C", "B", "A"]
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return letters.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return letters[row]
    }
    
    // MARK: History visibilty.
    
    @IBOutlet weak var history: UILabel!
    @IBAction func historyVisibility(sender: UISwitch) {
        history.hidden = !sender.on
    }
    
    // MARK: Default ring offset.
    
    var ringLeft = 0
    var ringCentre = 0
    var ringRight = 0
    
    // MARK: Default rotor offset.
    
    var rotorOffsetLeft = 0
    var rotorOffsetCentre = 0
    var rotorOffsetRight = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // MARK: Set the default rotorWindow positions.
        
        rotorWindows.selectRow(windowLeft, inComponent: 0, animated: false)
        rotorWindows.selectRow(windowCentre, inComponent: 1, animated: false)
        rotorWindows.selectRow(windowRight, inComponent: 2, animated: false)
        
        // MARK: Account for pin offset.
        
        if ringLeft != 0 {
            for _ in 1...ringLeft {
                stepRotor(&left)
            }
        }
        
        if ringCentre != 0 {
            for _ in 1...ringCentre {
                stepRotor(&centre)
            }
        }
        
        if ringRight != 0 {
            for _ in 1...ringRight {
                stepRotor(&right)
            }
        }
        
        // MARK: Offset the rotor dictionaries according to their start positions.
        
        if rotorOffsetLeft != 0 {
            for _ in 1...rotorOffsetLeft {
                advanceRotor(&left)
            }
        }
        
        if rotorOffsetCentre != 0 {
            for _ in 1...rotorOffsetCentre {
                advanceRotor(&centre)
            }
        }
        
        if rotorOffsetRight != 0 {
            for _ in 1...rotorOffsetRight {
                advanceRotor(&right)
            }
        }
        
        // Note: Don't need to 'clear' the history due to the view unloading.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
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
        
        // Note: Rotating the pickerView is done in the code() function.
        
        let coded = code((sender.titleLabel?.text)!)
        
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
        var difference = 0
        
        switch component {
        case 0: difference = windowLeft - row
        case 1: difference = windowCentre - row
        case 2: difference = windowRight - row
        default: break
        }
        
        if difference < 0 {
            difference += 26
        }
        
        switch component {
        case 0:
            if difference > 0 {
                for _ in 1...difference {
                    advanceRotor(&right)
                    advanceWindow(&windowLeft)
                }
            }
        case 1:
            if difference > 0 {
                for _ in 1...difference {
                    advanceRotor(&centre)
                    advanceWindow(&windowCentre)
                }
            }
        case 2:
            if difference > 0 {
                for _ in 1...difference {
                    advanceRotor(&right)
                    advanceWindow(&windowRight)
                }
            }
        default: break
        }
        
    }

}
