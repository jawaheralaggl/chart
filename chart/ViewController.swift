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
        
        shape()
        shape2()
        shape3()
        
        track()
    }
    
    
    
    func shape() {
        
        let center = view.center
        
        let shapeLayer = CAShapeLayer()
        let circlePath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 4, endAngle: 15 / CGFloat.pi, clockwise: true)
        
        shapeLayer.path = circlePath.cgPath
        
        shapeLayer.strokeColor = UIColor(named: "ColorA")?.cgColor
        shapeLayer.lineWidth = 15
        shapeLayer.strokeEnd = 0
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        view.layer.addSublayer(shapeLayer)
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        basicAnimation.duration = 0.5
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "animation")
        
    }
    
    func shape2() {
        
        let center = view.center
        
        let shapeLayer = CAShapeLayer()
        let circlePath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 4, endAngle: CGFloat.pi, clockwise: true)
        
        shapeLayer.path = circlePath.cgPath
        
        shapeLayer.strokeColor = UIColor(named: "ColorB")?.cgColor
        shapeLayer.lineWidth = 15
        shapeLayer.strokeEnd = 0
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        view.layer.addSublayer(shapeLayer)
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        basicAnimation.duration = 0.5
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "animation")
        
    }
    
    func shape3() {
        
        let center = view.center
        
        let shapeLayer = CAShapeLayer()
        let circlePath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 4, endAngle: 5 / CGFloat.pi, clockwise: true)
        
        shapeLayer.path = circlePath.cgPath
        
        shapeLayer.strokeColor = UIColor(named: "ColorC")?.cgColor
        shapeLayer.lineWidth = 15
        shapeLayer.strokeEnd = 0
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        view.layer.addSublayer(shapeLayer)
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        basicAnimation.duration = 0.5
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "animation")
        
    }
    
    
    func track() {
        let center = view.center
        
        let trackLayer = CAShapeLayer()
        let circlePath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        trackLayer.path = circlePath.cgPath
        
        trackLayer.strokeColor = UIColor.lightGray.withAlphaComponent(0.2).cgColor
        trackLayer.lineWidth = 15
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        
        view.layer.addSublayer(trackLayer)
    }
    
    
}

