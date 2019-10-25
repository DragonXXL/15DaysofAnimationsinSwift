//
//  SwiftExtenstions.swift
//  SecretTextAnimation
//
//  Created by Larry Natalicio on 4/27/16.
//  Copyright © 2016 Larry Natalicio. All rights reserved.
//

import UIKit

extension CATextLayer {
    convenience init(frame: CGRect, string: NSAttributedString) {
        self.init()
        
        self.contentsScale = UIScreen.main.scale
        self.frame = frame
        self.string = string
    }
}
