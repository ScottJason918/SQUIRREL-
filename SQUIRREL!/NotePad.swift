//
//  NotePad.swift
//  SQUIRREL!
//
//  Created by Jason Scott on 7/16/15.
//  Copyright (c) 2015 Jason Scott. All rights reserved.
//

import Foundation
import UIKit

public class NotePad: UIView, UITextFieldDelegate {
    
    
    ///Button Outlets
    @IBOutlet var taskField: UITextField!
    @IBOutlet var timeField : UITextField!
    @IBOutlet var descriptionField : UITextView!
    @IBOutlet var noteBtn: UIButton!
    @IBOutlet var saveBtn: UIButton!
    @IBOutlet var deleteBtn: UIButton!
    
    
    ///Variables

    var noteObject : NoteObject!
    var parentView : UIView!
    
    ///Creating Note Pad Views
    func createInView(aView : UIView) -> NotePad{
        var xibArray : NSArray = NSBundle.mainBundle().loadNibNamed("NotePad", owner: self, options: nil);
        let notePad : NotePad = xibArray[0] as! NotePad;
        aView.addSubview(notePad);
        notePad.parentView = aView;
        return notePad;
    };
    //////Actions for Touching Note Pads and Buttons
    
    ///Making keyboard go away
    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        timeField.endEditing(true);
        return false;
    }
    
    ///What happens when touching the note
    @IBAction func notePressed(){
        UIView.animateWithDuration(0.35, delay: 0.0, options: .CurveEaseIn, animations: { () -> Void in
            self.center = self.parentView.center;
            self.taskField.userInteractionEnabled = true;
            self.timeField.keyboardType = .NumberPad
            self.descriptionField.userInteractionEnabled = true;
            self.transform = CGAffineTransformMakeScale(1, 1);
            self.parentView.bringSubviewToFront(self)
        }) { (Bool) -> Void in
            self.noteBtn.enabled = false;
        };
    }
    ///Changing color to red to symbolize urgent
    @IBAction func urgentNote(){
        self.backgroundColor = UIColor.redColor();
        self.taskField.backgroundColor = UIColor.redColor();
        self.timeField.backgroundColor = UIColor.redColor();
        self.descriptionField.backgroundColor = UIColor.redColor();
    }
    
    ///What happens when touching save
    @IBAction func savePressed(){
        //First, update the noteObject to contain the appropriate data
        noteObject.taskString = taskField.text;
        noteObject.timeString = timeField.text;
        noteObject.descriptionString = descriptionField.text;
        
        //Now save the note via the helper
        NoteHelper().saveNote(noteObject);
        
        //Now modify the UI so your note goes into the UI properly
        noteBtn.enabled = true;
        taskField.userInteractionEnabled = false;
        timeField.userInteractionEnabled = false;
        descriptionField.userInteractionEnabled = false;
        UIView.animateWithDuration(0.35, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
            self.transform = CGAffineTransformMakeScale(0.2, 0.2);
        }) { (Bool) -> Void in
            
        };
    }

    ///What happens when touching delete
    @IBAction func deletePressed(){
        self.removeFromSuperview();
    }
};