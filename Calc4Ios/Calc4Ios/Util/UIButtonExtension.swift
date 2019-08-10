//
//  UIButtonExtension.swift
//  Calc4Ios
//
//  Created by Miguel Angel Fonseca Perez on 8/5/19.
//  Copyright © 2019 Miguel Angel Fonseca Perez. All rights reserved.
//

import UIKit

extension UIButton {
    //MARK:- Shine button
    func round() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    //MARK:- Bright button
    func shine() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
        }
    }
    func jump() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(translationX: 0, y: -10)
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = .identity
            })
        }
    }
    func bounce() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = .identity
            })
        }
    }
    
    
}
