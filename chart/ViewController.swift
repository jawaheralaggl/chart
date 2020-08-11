//
//  ViewController.swift
//  chart
//
//  Created by Jawaher Alagel on 8/5/20.
//  Copyright © 2020 Jawaher Alaggl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let arrayNumber: [Double] = [1000, 900, 800]
    let arrayColour = [UIColor(hex: "#F4B277"), UIColor(hex: "#6787BB"), UIColor(hex: "#6CA777")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(hex: "#1F2633")
        
        // total amount (sum)
        let sum = Double(3000)
        let percantage = arrayNumber.map{($0/sum) * 100}
        var data = Array(zip(arrayColour, percantage))
        let validPercentage = percantage.reduce(0,+)
        
        if validPercentage < 100 {
            let emptyPercentage = 100 - validPercentage
            data.append((UIColor.clear, emptyPercentage))
        }
        
        shape(totalPercentage: 100, array: data)
        
        track()
    }
    
    func shape(totalPercentage: Double, array: [(color: UIColor?, subpercentage: Double)]) {
        
        let startAngle = -CGFloat.pi / 4
        let totalLength = CGFloat.pi * 2 * CGFloat(totalPercentage) * 0.01
        var minusLength: CGFloat = 0.0
        var counter = 0
        
        for (color, subpercentage) in array.reversed() {
            let endAngle = startAngle + totalLength - minusLength
            minusLength += (totalLength * CGFloat(subpercentage) * 0.01)
            draw(startAngle: startAngle, endAngle: endAngle, color: color ?? .black)
            
            // to get square edge
            if counter != 1 {
                draw2(startAngle: (startAngle + endAngle)/2, endAngle: endAngle, color: color ?? .black)
            }
            counter += 1
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
        
    }
    
    func draw2(startAngle: CGFloat, endAngle: CGFloat, color: UIColor) {
        
        let shapeLayer = CAShapeLayer()
        let center = view.center
        
        let circlePath = UIBezierPath(arcCenter: center, radius: 100, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        shapeLayer.path = circlePath.cgPath
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 15
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.square
        
        view.layer.addSublayer(shapeLayer)
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
