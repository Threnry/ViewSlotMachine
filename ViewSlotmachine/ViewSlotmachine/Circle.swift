//
//  Circle.swift
//  ViewSlotmachine
//
//  Created by user145418 on 11/12/18.
//  Copyright © 2018 user145418. All rights reserved.
//

import Foundation
import UIKit

class Circle : Equatable {
   static func == (lhs: Circle , rhs: Circle) -> Bool{
        return (lhs.shade == rhs.shade) && (lhs.color == rhs.color)
    }
    
    
    var color: Colors
    var shade: Shades
    
    enum Colors {
        case red
        case blue
        case green
        case purple
        
        static var all = [Colors.red,.blue, .green,.purple]
    }
    enum Shades {
        case outlined
        case striped
        case filled
        
        static var all = [Shades.outlined,.striped, .filled]
   
}
    init(color:Colors, shade:Shades){
        self.color = color
        self.shade = shade
        
    }
    private func randomizeColor() -> Colors{
        let number = arc4random_uniform(4)
        
        switch(number){
        case 0:
            return .red
        case 1:
            return .blue
        case 2:
            return .green
        case 3:
            return .purple
        default:
            return .purple
            
            
            
        }
        
    }
    private func randomizeShade() -> Shades{
        let count = arc4random_uniform(3)
        switch(count){
        case 0:
            return .outlined
        case 1:
            return .filled
        case 2:
            return .striped
            
        default:
            return .outlined
        }
    }
    func randomizeColorAndShade(){
        self.color = randomizeColor()//Colors.all[Int(arc4random_uniform(UInt32(Colors.all.count - 1)))]
        self.shade = randomizeShade() //Shades.all[Int(arc4random_uniform(UInt32(Shades.all.count - 1)))]
            
            }
    func getColor() -> Colors{
        return self.color
    }
    func setColor(color: Colors)  {
        self.color = color
    }
    func getShade() -> Shades{
        return self.shade
    }
    func setShade(shade: Shades){
        self.shade = shade
    }
    
    
    
}

  


