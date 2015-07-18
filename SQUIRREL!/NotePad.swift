//
//  NotePad.swift
//  SQUIRREL!
//
//  Created by Jason Scott on 7/16/15.
//  Copyright (c) 2015 Jason Scott. All rights reserved.
//

import Foundation
import UIKit

public class NotePad: UIView {
    
    @IBOutlet var noteBtn: UIButton!
    @IBOutlet var saveBtn: UIButton!
    @IBOutlet var deleteBtn: UIButton!
    var parentView : UIView!
    
    public func createInView(aView : UIView) -> NotePad{
        var xibArray : NSArray = NSBundle.mainBundle().loadNibNamed("NotePad", owner: self, options: nil);
        let notePad : NotePad = xibArray[0] as! NotePad;
        aView.addSubview(notePad);
        notePad.parentView = aView;
        return notePad;
    };
    
    @IBAction func notePressed(){
        UIView.animateWithDuration(0.35, delay: 0.0, options: .CurveEaseIn, animations: { () -> Void in
            self.center = self.parentView.center;
            self.transform = CGAffineTransformMakeScale(1, 1);
        }) { (Bool) -> Void in
            self.noteBtn.enabled = false;
        };
    }
    
    @IBAction func savePressed(){
        
        noteBtn.enabled = true;
        UIView.animateWithDuration(0.35, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
            self.transform = CGAffineTransformMakeScale(0.2, 0.2);
        }) { (Bool) -> Void in
            
        };
    }

    @IBAction func deletePressed(){
        self.removeFromSuperview();
    }
};