//
//  Lightboard.swift
//  Enigma Navigation Controller
//
//  Created by James Coleman on 12/11/2015.
//  Copyright © 2015 iSOS. All rights reserved.
//

import UIKit

@IBDesignable class Lightboard: UILabel {
    
    var lit = false {
        didSet { setNeedsDisplay() }
    }
    
    let bulb = CAShapeLayer()
    
    let bulbText = UILabel()
    
    override func drawRect(rect: CGRect) {
        
        bulbText.frame = rect
        bulbText.attributedText = attributedText
        
        let bulbPath = UIBezierPath(ovalInRect: CGRect(x: frame.width/4, y: frame.height/4, width: bounds.width/2, height: bounds.width/2))
        
        bulb.path = bulbPath.CGPath
        
        if lit {
            
            bulb.fillColor = UIColor(red: 245/255, green: 199/255, blue: 35/255, alpha: 1).CGColor
            
            bulbText.textColor = UIColor(white: 74/255, alpha: 1)
            
        } else {
            
            bulb.fillColor = UIColor.clearColor().CGColor
            
        }
        
        layer.addSublayer(bulb)
        
        self.addSubview(bulbText)
        
    }

}