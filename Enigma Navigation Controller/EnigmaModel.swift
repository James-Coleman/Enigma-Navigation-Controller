//
//  EnigmaModel.swift
//  Enigma Navigation Controller
//
//  Created by James Coleman on 24/09/2015.
//  Copyright © 2015 iSOS. All rights reserved.
//

import UIKit

class EnigmaModel: NSObject {
    
    // MARK: Setup alphabet letter numerical equivalents.
    
    let alphabet = ["A":0, "B":1, "C":2, "D":3, "E":4, "F":5, "G":6, "H":7, "I":8, "J":9, "K":10, "L":11, "M":12, "N":13, "O":14, "P":15, "Q":16, "R":17, "S":18, "T":19, "U":20, "V":21, "W":22, "X":23, "Y":24, "Z":25]
    
    // MARK: Setup rotors and reflector.
    
    // MARK: Setup rotors and reflector.
    
    let rotorI = (rotor:["A":"E", "B":"K", "C":"M", "D":"F", "E":"L", "F":"G", "G":"D", "H":"Q", "I":"V", "J":"Z", "K":"N", "L":"T", "M":"O", "N":"W", "O":"Y", "P":"H", "Q":"X", "R":"U", "S":"S", "T":"P", "U":"A", "V":"I", "W":"B", "X":"R", "Y":"C", "Z":"J"], step:8) // Step is index of pickerView "R".
    let rotorII = (rotor:["A":"A", "B":"J", "C":"D", "D":"K", "E":"S", "F":"I", "G":"R", "H":"U", "I":"X", "J":"B", "K":"L", "L":"H", "M":"W", "N":"T", "O":"M", "P":"C", "Q":"Q", "R":"G", "S":"Z", "T":"N", "U":"P", "V":"Y", "W":"F", "X":"V", "Y":"O", "Z":"E"], step:20) // Step is index of pickerView "F".
    let rotorIII = (rotor:["A":"B", "B":"D", "C":"F", "D":"H", "E":"J", "F":"L", "G":"C", "H":"P", "I":"R", "J":"T", "K":"X", "L":"V", "M":"Z", "N":"N", "O":"Y", "P":"E", "Q":"I", "R":"W", "S":"G", "T":"A", "U":"K", "V":"M", "W":"U", "X":"S", "Y":"Q", "Z":"O"], step:3) // Step is index of pickerView "W".
    let rotorIV = (rotor:["A":"E", "B":"S", "C":"O", "D":"V", "E":"P", "F":"Z", "G":"J", "H":"A", "I":"Y", "J":"Q", "K":"U", "L":"I", "M":"R", "N":"H", "O":"X", "P":"L", "Q":"N", "R":"F", "S":"T", "T":"G", "U":"K", "V":"D", "W":"C", "X":"M", "Y":"W", "Z":"B"], step:15) // Step is index of pickerView "K".
    let rotorV = (rotor:["A":"V", "B":"Z", "C":"B", "D":"R", "E":"G", "F":"I", "G":"T", "H":"Y", "I":"U", "J":"P", "K":"S", "L":"D", "M":"N", "N":"H", "O":"L", "P":"X", "Q":"A", "R":"W", "S":"M", "T":"J", "U":"Q", "V":"O", "W":"F", "X":"E", "Y":"C", "Z":"K"], step:25) // Step is index of pickerView "A".
    
    let reflectorA = ["A":"E", "B":"J", "C":"M", "D":"Z", "E":"A", "F":"L", "G":"Y", "H":"X", "I":"V", "J":"B", "K":"W", "L":"F", "M":"C", "N":"R", "O":"Q", "P":"U", "Q":"O", "R":"N", "S":"T", "T":"S", "U":"P", "V":"I", "W":"K", "X":"H", "Y":"G", "Z":"D"]
    let reflectorB = ["A":"Y", "B":"R", "C":"U", "D":"H", "E":"Q", "F":"S", "G":"L", "H":"D", "I":"P", "J":"X", "K":"N", "L":"G", "M":"O", "N":"K", "O":"M", "P":"I", "Q":"E", "R":"B", "S":"F", "T":"Z", "U":"C", "V":"W", "W":"V", "X":"J", "Y":"A", "Z":"T"]
    let reflectorC = ["A":"F", "B":"V", "C":"P", "D":"J", "E":"I", "F":"A", "G":"O", "H":"Y", "I":"E", "J":"D", "K":"R", "L":"Z", "M":"X", "N":"W", "O":"G", "P":"C", "Q":"T", "R":"K", "S":"U", "T":"Q", "U":"S", "V":"B", "W":"N", "X":"M", "Y":"H", "Z":"L"]
    
    var left : (rotor:[String:String], step:Int)
    var centre : (rotor:[String:String], step:Int)
    var right : (rotor:[String:String], step:Int)
    
    var reflector : [String:String]
    
    // MARK: Default ring offset.
    
    var ringLeft : Int
    var ringCentre : Int
    var ringRight : Int
    
    // MARK: Default rotor offset.
    
    var rotorOffsetLeft : Int
    var rotorOffsetCentre : Int
    var rotorOffsetRight : Int
    
    override init () {
        left = rotorI
        centre = rotorII
        right = rotorIII
        
        reflector = reflectorB
        
        ringLeft = 0
        ringCentre = 0
        ringRight = 0
        
        rotorOffsetLeft = 0
        rotorOffsetCentre = 0
        rotorOffsetRight = 0
    }
    
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
    
    func reverseWindow(inout window: Int) {
        if window < 25 {
            window++
        } else {
            window = 0
        }
    }
    
    // MARK: Initialise.
    
    func initialiseOffset() {
        
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
        
        // MARK: Account for rotor offset.
        
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
        
    }
    
    // MARK: Update rotors.
    
    func updateRotor(row: Int, component: Int) {
        var difference = 0
        
        switch component {
        case 0: difference = windowLeft - row
        case 1: difference = windowCentre - row
        case 2: difference = windowRight - row
        default: break
        }
        
        if difference > 0 {
            switch component {
            case 0:
                for _ in 1...difference {
                    advanceRotor(&left)
                }
            case 1:
                for _ in 1...difference {
                    advanceRotor(&centre)
                }
            case 2:
                for _ in 1...difference {
                    advanceRotor(&right)
                }
            default: break
            }
        } else if difference < 0 {
            let absoluteDifference = abs(difference)
            switch component {
            case 0:
                for _ in 1...absoluteDifference {
                    stepRotor(&left)
                }
            case 1:
                for _ in 1...absoluteDifference {
                    stepRotor(&centre)
                }
            case 2:
                for _ in 1...absoluteDifference {
                    stepRotor(&right)
                }
            default: break
            }
        }
        
        switch component {
        case 0:
            windowLeft = row
        case 1:
            windowCentre = row
        case 2:
            windowRight = row
        default: break
        }
        
        print(row, component, difference)
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
        if doubleStep || hasSteppedBack {
            advanceRotor(&centre)
            advanceWindow(&windowCentre)
            advanceRotor(&left)
            advanceWindow(&windowLeft)
            doubleStep = false
            hasSteppedBack = false
        }
        if windowRight % 26 == right.step {
            advanceRotor(&centre)
            advanceWindow(&windowCentre)
        }
        if windowCentre % 26 == centre.step + 1 {
            doubleStep = true
        }
        print(windowLeft, windowCentre, windowRight)
        return plugboard(reversedRightRotor(reversedCentreRotor(reversedLeftRotor(reflector(leftRotor(centreRotor(rightRotor(plugboard("\(letter)")))))))))
    }
    
    var textFieldCountBefore = 0
    
    var lastLetterEntered : Character = "A"
    
    var hasSteppedBack = false
    
    func deleteButton(sender: UITextField, output: UILabel) {
        if let newCount = sender.text?.characters.count {
            if newCount < textFieldCountBefore {
                output.text? = (output.text?.substringToIndex((output.text?.endIndex.predecessor())!))! // Force unwrap all the things.
                if lastLetterEntered != " " {
                    if windowCentre == centre.step && windowRight == right.step - 1 {
                        stepRotor(&centre)
                        reverseWindow(&windowCentre)
                        stepRotor(&left)
                        reverseWindow(&windowLeft)
                        hasSteppedBack = true
                    } else {
                        hasSteppedBack = false
                    }
                    if windowRight == right.step {
                        stepRotor(&centre)
                        reverseWindow(&windowCentre)
                    }
                    stepRotor(&right)
                    reverseWindow(&windowRight)
                }
                if let lastLetter = sender.text?.characters.last {
                    lastLetterEntered = lastLetter
                }
            } else {
                if let lastLetter = sender.text?.characters.last {
                    if lastLetter == " " {
                        output.text! += " "
                    } else {
                        output.text! += code("\(lastLetter)")
                    }
                    lastLetterEntered = lastLetter
                }
            }
            textFieldCountBefore = (sender.text?.characters.count)!
        }
    }

}
