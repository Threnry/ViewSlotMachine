//
//  slotGame.swift
//  ViewSlotmachine
//
//  Created by user145418 on 11/12/18.
//  Copyright © 2018 user145418. All rights reserved.
//

import Foundation

class SlotGame {
     var score:Int
    //private var numberofViews :Int
    var slots = [Circle]()
    
    init(){
        self.slots = [Circle]()
        
        //for color in Circle.Colors.all {
           // for shade in Circle.Shades.all {
                //for _ in 0..<3 {
                     //  self.slots += [Circle(color: color, shade: shade)]
                        
                    
                
            //}
        //}
  //}
        //self.score = 100
        //print("Much", slots.count)
        
        for _ in 0...2 {
            self.slots.append(Circle(color: Circle.Colors.all[Int(arc4random_uniform(UInt32(Circle.Colors.all.count-1)))], shade: Circle.Shades.all[Int(arc4random_uniform(UInt32(Circle.Shades.all.count-1)))]))
        }
        self.score = 100
    
    
}




    func spinButton() {
        
        score -= 10
        for slot in slots{
            slot.randomizeColorAndShade()
            
        }
        TheScore()
        
        
    
    }
    func updateScore() {
        self.score -= 10
        
        var allColors = Set<Circle.Colors>()
        var allShades = Set<Circle.Shades>()
        
        for slot in slots {
            allColors.insert(slot.getColor())
            allShades.insert(slot.getShade())
        }
        
        let sameColor = (allColors.count == 1)
        let sameShades = (allShades.count == 1)
        
        if (sameColor && sameShades) {
           
            score += 300
        } else if (sameColor && !sameShades) {
        
            score += 250
        } else if (sameColor) {
            score += 200
      
        }else if(!sameColor && sameShades){
            score += 150
            
        }else if(sameColor && sameShades){
            score += 100
        }else if(sameShades){
            score += 50
        }
    }
    func reset(){
        self.score = 100
        
    }
    func getScore() -> Int{
        
        return self.score
    
    }
    private func TheScore(){
        var shades = Set<Circle.Shades>()
        var colors = Set<Circle.Colors>()
        slots.forEach({shades.insert($0.shade)})
        slots.forEach({colors.insert($0.color)})
        if colors.count == 1{
            if shades.count == 1{
                score += 300
                
            }else if shades.count == 3{
                score += 250
            }else {
                score += 200
            }
        }else if colors.count == 3 && shades.count == 3{
            score += 100
        }else if shades.count == 1{
            if colors.count == 3{
                score += 150
            }else{
                score += 50
            }
        }
        
    }
    
    
    



}
