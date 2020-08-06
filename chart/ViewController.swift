//
//  ViewController.swift
//  chart
//
//  Created by Jawaher Alagel on 8/5/20.
//  Copyright © 2020 Jawaher Alaggl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "ColorBackground")
        
        // Set Percentage
        shape(totalPercentage: 100, array: [(UIColor(named: "ColorA"), 10), (UIColor(named: "ColorB"), 20), (UIColor(named: "ColorC"), 50), (UIColor.clear, 20)])
        
        
        track()
    }
    
    
    
    func shape(totalPercentage: Double, array: [(color: UIColor?, subpercentage: Double)]) {
        
        var sum = 0.0
        
        for (_, subpercentage) in array {
            sum += subpercentage
        }
        
        if sum != 100 {
            fatalError("PERCENTAGES DON'T ADD UP TO 100%")
        }
        
        
        let startAngle = -CGFloat.pi / 4
        let totalLength = CGFloat.pi * 2 * CGFloat(totalPercentage) * 0.01
        var minusLength: CGFloat = 0.0
        
        for (color, subpercentage) in array.reversed() {
            let endAngle = startAngle + totalLength - minusLength
            minusLength += (totalLength * CGFloat(subpercentage) * 0.01)
            draw(startAngle: startAngle, endAngle: endAngle, color: color ?? .black)
        }
    }
    
    
    func draw(startAngle: CGFloat, endAngle: CGFloat, color: UIColor) {
        
        let shapeLayer = CAShapeLayer()
        let center = view.center
        
        let circlePath = UIBezierPath(arcCenter: center, radius: 100, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        shapeLayer.path = circlePath.cgPath
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 15
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        view.layer.addSublayer(shapeLayer)
        
        /* set animation
         let animation = CABasicAnimation(keyPath: "strokeEnd")
         shapeLayer.strokeEnd = 0
         
         animation.toValue = 1
         animation.duration = 1.0
         animation.fillMode = .forwards
         animation.isRemovedOnCompletion = false
         
         shapeLayer.add(animation, forKey: "animation")
         */
        
    }
    
    
    func track() {
        
        let trackLayer = CAShapeLayer()
        
        let circlePath = UIBezierPath(arcCenter: view.center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        trackLayer.path = circlePath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.withAlphaComponent(0.2).cgColor
        trackLayer.lineWidth = 15
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        
        view.layer.addSublayer(trackLayer)
    }
}


