//
//  SetTimer.swift
//  SQUIRREL!
//
//  Created by Jason Scott on 7/27/15.
//  Copyright (c) 2015 Jason Scott. All rights reserved.
//

import Foundation
import UIKit

public class SetTimer: UIView {
    
    var parentVC : ViewController!
    var parentView : UIView!
    var timer = NSTimer();
    
    ///Outlets
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var timeStepper : UIStepper!
    @IBOutlet var startButton: UIButton!
    var counterHour = 0;
    var counterMinute = 0;
    
    func createInView(aView : UIView) -> SetTimer{
        var xibArray : NSArray = NSBundle.mainBundle().loadNibNamed("SetTimer", owner: self, options: nil);
        let setTimer : SetTimer = xibArray[0] as! SetTimer;
        aView.addSubview(setTimer);
        setTimer.parentView = aView;
        return setTimer;
    };

    
    
    ///Actions
    //Updating Counter for Timer
    func updateCounter(){
        if(counterHour > 0 && counterMinute == 0){
            counterHour--;
            counterMinute = 59;
        }else{
            counterMinute--;
        }
        println(counterHour);
        println(counterMinute);
    }
    
    ///Changing Timer Value
    @IBAction func stepperValueHasChanged(sender: UIStepper){
        var hour = Int(0);
        var minute = Int(sender.value);
        
        while (minute > 59){
            minute -= 60;
            hour += 1;
        }
        counterHour = hour;
        counterHour = minute;
        timerLabel.text = (String(format: "%i:%02d", hour, minute));
        
    }
    ///Start button
    @IBAction func startButtonPressed() {
        parentVC.clockLabel.text = timerLabel.text;
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: ("updateCounter"), userInfo: nil, repeats: true);
        self.removeFromSuperview();
    }
}