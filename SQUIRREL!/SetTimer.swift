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
    
    var parentView : UIView!
    
    ///Outlets
    @IBOutlet var minuteLabel: UILabel!
    @IBOutlet var secondsLabel: UILabel!
    @IBOutlet var timeStepper : UIStepper!
    @IBOutlet var startButton: UIButton!
    
    func createInView(aView : UIView) -> SetTimer{
        var xibArray : NSArray = NSBundle.mainBundle().loadNibNamed("SetTimer", owner: self, options: nil);
        let setTimer : SetTimer = xibArray[0] as! SetTimer;
        aView.addSubview(setTimer);
        setTimer.parentView = aView;
        return setTimer;
    };

    
    
    ///Actions
    ///Changing Timer Value
    @IBAction func stepperValueHasChanged(sender: UIStepper){
        minuteLabel.text = (Int(timeStepper.value).description + ":");
        
    }
    ///Start button
    @IBAction func startButtonPressed() {
        
        self.removeFromSuperview();
    }
}