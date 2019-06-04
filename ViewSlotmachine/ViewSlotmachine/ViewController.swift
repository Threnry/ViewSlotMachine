//
//  ViewController.swift
//  ViewSlotmachine
//
//  Created by user145418 on 11/12/18.
//  Copyright © 2018 user145418. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //@IBOutlet var slotViews: [CircleView]!
    
    lazy var game = SlotGame()

    @IBOutlet weak var spinButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var slotViews: [CircleView]!
    
    //@IBOutlet var slotViews: [CircleView]!
    
    @IBAction func spinButton(_ sender: UIButton) {
        
        if (game.getScore() < 10){
        spinButton.isEnabled = false
        }else{
            game.spinButton()
            updateViewFromModel()
        }
        
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        game.reset()
        updateViewFromModel()
    }
    
    private func createSetCardViews() {
        //slotViews.forEach({
           // $0.removeFromSuperview()
       //})
        
        
        //slotViews = [CircleView]()
        for index in game.slots.indices{
            
            slotViews[index].shade = game.slots[index].shade
            slotViews[index].color = game.slots[index].color
        }
        
            //let slotView = CircleView()
        
            
            
                //slotViews.append(slotView)
            
                //slotViews.append(slotView)
            
            
            
        }
    
    
    private func updateViewFromModel() {
        createSetCardViews()
        
        scoreLabel.text = "Score:\(game.score)"
        
        if game.getScore() < 10 {
            spinButton.isEnabled = false
            spinButton.isHidden = true
        } else {
            spinButton.isEnabled = true
            spinButton.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello", slotViews.count)
        print("Hi", game.slots.count)
        
        
        updateViewFromModel()
    }
    
}



