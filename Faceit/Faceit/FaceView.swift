//
//  FaceView.swift
//  Faceit
//
//  Created by Sai Nishanth Dilly on 9/27/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit

class FaceView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let skullRadius = min(bounds.width,bounds.height)/2
        let skullCenter = CGPoint(x:bounds.midX, y:bounds.midY)
        let path = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        path.lineWidth = 5.0
        UIColor.blue.set()
        path.stroke()
        
        
    }
    

}
