//
//  TipViewUISlider.swift
//  Tip Calculator
//
//  Created by Kevin Fan on 2/17/17.
//  Copyright © 2017 Matthew Allen Lin Software. All rights reserved.
//

import UIKit

class TipViewUISlider: UISlider {
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        //keeps original origin and width, changes height
        let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 6.0))
        super.trackRect(forBounds: customBounds)
        return customBounds
    }
    
    //change the image for the slider thumb
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.setThumbImage(UIImage(named: "slider-thumb"), for: .normal)
    }
}
