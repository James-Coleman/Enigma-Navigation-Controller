//
//  KeyButton.swift
//  Enigma Navigation Controller
//
//  Created by James Coleman on 13/11/2015.
//  Copyright © 2015 iSOS. All rights reserved.
//

import UIKit

@IBDesignable class KeyButton: UIButton {

    var pressed = false {
        didSet { setNeedsDisplay() }
    }
    
    let backgroundCircleLayer = CAShapeLayer()
    
    let buttonText = UILabel()
    
    override func drawRect(rect: CGRect) {
        
        buttonText.frame = rect
        buttonText.attributedText = titleLabel?.attributedText
        buttonText.textAlignment = .Center
        
        titleLabel?.text = nil
        
        let backgroundCirclePath = UIBezierPath(ovalInRect: CGRect(x: frame.width/4, y: frame.height/4, width: frame.width/2, height: frame.width/2))
        
        backgroundCircleLayer.path = backgroundCirclePath.CGPath
        
        if pressed {
            
            backgroundCircleLayer.fillColor = UIColor(white: 74/255, alpha: 1).CGColor
            
            buttonText.textColor = UIColor.whiteColor()
            
        } else {
            
            backgroundCircleLayer.fillColor = UIColor.clearColor().CGColor
            
        }
        
        layer.addSublayer(backgroundCircleLayer)
        
        self.addSubview(buttonText)
    }

}
