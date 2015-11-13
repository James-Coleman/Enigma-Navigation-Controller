//
//  Plugboard.swift
//  Enigma Navigation Controller
//
//  Created by James Coleman on 12/11/2015.
//  Copyright © 2015 iSOS. All rights reserved.
//

import UIKit

@IBDesignable class Plugboard: UITextField {
    
    let backgroundCircleLayer = CAShapeLayer()
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let backgroundCirclePath = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: min(bounds.width, bounds.height), height: min(bounds.width, bounds.height)))
        
        backgroundCircleLayer.path = backgroundCirclePath.CGPath
        backgroundCircleLayer.fillColor = UIColor.whiteColor().CGColor
        
        layer.addSublayer(backgroundCircleLayer)
    }


}
