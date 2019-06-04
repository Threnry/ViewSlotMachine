//
//  CircleView.swift
//  ViewSlotmachine
//
//  Created by user145418 on 11/12/18.
//  Copyright © 2018 user145418. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable class CircleView: UIView {
    var path: UIBezierPath?
    private var drawableRect: CGRect{
        let drawableWidth = frame.size.width * 0.80
        let drawableHeight = frame.size.height * 0.50
        return CGRect(x: frame.size.width * 0.1,
                      y: frame.size.height * 0.05,
                      width: drawableWidth,
                      height: drawableHeight)
        
    }
    
    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(rect: bounds)
        roundedRect.addClip()
        
        #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).setFill()
        roundedRect.fill()
        path = UIBezierPath(ovalIn: drawableRect)
        path!.lineCapStyle = .round
        switch(shade){
        case .filled:
            colorForPath2.setFill()
            path!.fill()
        
        case .striped:
            
            path!.lineWidth = 0.01 * frame.size.width
            
            colorForPath2.setStroke()
            path!.stroke()
            path!.addClip()
            var currentX:  CGFloat = 0
            let stripedPath = UIBezierPath()
            stripedPath.lineWidth = 0.005 * frame.size.width
            
            while currentX < frame.size.width{
                stripedPath.move(to: CGPoint(x: currentX, y:0))
                stripedPath.addLine(to: CGPoint(x: currentX, y: frame.size.height))
                currentX += 0.03 * frame.size.width
            }
            colorForPath2.setStroke()
            stripedPath.stroke()
            
        case .outlined:
            colorForPath2.setStroke()
            path!.lineWidth = 1
            path!.stroke()
        }
        
        
        
    }
    
     var color: Circle.Colors = Circle.Colors.blue{
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
            
        }
    }
     var shade: Circle.Shades = Circle.Shades.filled{
        didSet{
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    private func shadeForPath(_ path: UIBezierPath)-> UIBezierPath{
       
        let shades = UIBezierPath()
        shades.append(path)
        switch(shade){
        case .filled:
        colorForPath.setFill()
        case .striped:
            UIColor.clear.setFill()
            shades.addClip()
            var start = CGPoint(x: 0.0, y: 0.0)
            var end = CGPoint(x: self.bounds.size.width, y: 0.0)
            let dy: CGFloat = self.bounds.height / 10.0
            while start.y <= self.bounds.height {
                shades.move(to: start)
                shades.addLine(to: end)
                start.y += dy
                end.y += dy
            }
        case .outlined:
            UIColor.clear.setFill()
        }
        
        return shades
            
            
        }
    private func shadeForPath2(_ path: UIBezierPath)-> UIBezierPath{
        let number = arc4random_uniform(4)
        let shades = UIBezierPath()
        shades.append(path)
        switch(number){
        case 0:
            
           colorForPath.setFill()
        case 1:
            UIColor.clear.setFill()
            shades.addClip()
            var start = CGPoint(x: 0.0, y: 0.0)
            var end = CGPoint(x: self.bounds.size.width, y: 0.0)
            let dy: CGFloat = self.bounds.height / 10.0
            while start.y <= self.bounds.height {
                shades.move(to: start)
                shades.addLine(to: end)
                start.y += dy
                end.y += dy
            }
        case 2:
            UIColor.clear.setFill()
        default:
            UIColor.clear.setFill()
        }
        
        return shades
        
        
    }
    private var colorForPath2: UIColor {
        switch color {
        case .green:
            return UIColor.green
        case .red:
            return UIColor.red
        case .purple:
            return UIColor.purple
        case .blue:
            return UIColor.blue
        }
    }
    }
    private var colorForPath: UIColor {
        let number = arc4random_uniform(4)
        switch number {
        case 0:
            return UIColor.green
        case 1:
            return UIColor.red
        case 3:
            return UIColor.blue
        default:
            return UIColor.purple
        }
        
        
        }
    



