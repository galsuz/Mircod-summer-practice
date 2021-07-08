//
//  fwsffsdfz.swift
//  Mircod Practice
//
//  Created by Кирилл Королёв on 08.07.2021.
//

import Foundation
import UIKit

extension CAGradientLayer {
    
    func makeGradientInBackgroundView(view: UIView) {
        self.frame = view.bounds
        let colorTop = #colorLiteral(red: 0.8666666667, green: 0.8941176471, blue: 0.9019607843, alpha: 1).cgColor
        let colorBottom = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        self.colors = [colorTop, colorBottom]
        self.locations = [0, 1]
        self.startPoint = CGPoint(x: 0.60, y: 0.5)
        self.endPoint = CGPoint(x: 0.75, y: 0.5)
        self.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0,
                                                                                     b: -1,
                                                                                     c: 1,
                                                                                     d: 0,
                                                                                     tx: 0.5,
                                                                                     ty: 1))
        // if change dx dy position on 0.5 from 0.8 etc - view will be okay
        self.bounds = view.bounds.insetBy(dx: -0.8 * view.bounds.size.width,
                                                   dy: -0.8 * view.bounds.size.height)
        self.position = view.center
        view.layer.sublayers?.insert(self, at: 0)
    }
}
