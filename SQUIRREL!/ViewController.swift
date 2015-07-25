//
//  ViewController.swift
//  SQUIRREL!
//
//  Created by Jason Scott on 7/15/15.
//  Copyright (c) 2015 Jason Scott. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet var clockButton: UIButton!
    @IBOutlet var clockLabel : UILabel!
    @IBOutlet var addBtn : UIButton!
    var heldNotePad : NotePad!
    
    
    //MARK: - View Lifecycle -
    
    override func viewDidLoad() {
        setupGestureRecognizers();
        
        
        
        super.viewDidLoad();
        NoteHelper().loadNotes();
        println(NoteHelper().allNotes);
        
        updateClock();
        NSTimer(timeInterval: 0.5, target: self, selector: Selector(updateClock()), userInfo: nil, repeats: true);
    }

    //MARK: - Interface Interaction Methods -
    ///Creating Note Pads
    @IBAction func createNotePad(){
        let notePad : NotePad = NotePad().createInView(self.view);
        notePad.noteObject = NoteObject(aTask: "", aTime: "", aDescription: "", aCenter: self.view.center);
        notePad.transform = CGAffineTransformMakeScale(0, 0);
        notePad.center = addBtn.center;
        notePad.saveBtn.alpha = 1;
        notePad.deleteBtn.alpha = 1;
        notePad.noteBtn.enabled = false;
        func textFieldShouldReturn(textField : UITextField) -> Bool{
            notePad.timeField.endEditing(true);
            return false;
        }
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            notePad.center = self.view.center;
            notePad.transform = CGAffineTransformMakeScale(1, 1);
            }) { (Bool) -> Void in
                
        };
    }
    
    //MARK: - Gesture Recognition Methods -
    
    
    //Making the notepads draggable
    func setupGestureRecognizers() {
        let moveNotePanGR : UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: "panRecognized:");
        self.view.addGestureRecognizer(moveNotePanGR);
    }
    
    func panRecognized(recognizer: UIPanGestureRecognizer) {
        var touchPoint = recognizer.locationInView(self.view);
        switch(recognizer.state){
        case .Began:
            for subview in self.view.subviews {
                if(subview.isKindOfClass(NotePad)){
                    if(CGRectContainsPoint(subview.frame, touchPoint)){
                        heldNotePad = subview as! NotePad;
                    }
                }
            }
                break;
            
        case .Changed:
            if(heldNotePad != nil) {
                heldNotePad.center = touchPoint;
            }
            break;
            
        case .Ended, .Failed, .Cancelled:
            heldNotePad = nil;
                break;
        default:
            println("default");
            break;
        }
    }
    
    //MARK: - Clock Methods -
    
    ///Setting Alarm Clock
    @IBAction func setAlarmClock(){
        
    }
    
    func updateClock() {
        var dateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "h:mm";
        var theTime = dateFormatter.stringFromDate(NSDate());
        clockLabel.text = theTime;
    }
}