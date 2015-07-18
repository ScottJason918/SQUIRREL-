//
//  ViewController.swift
//  SQUIRREL!
//
//  Created by Jason Scott on 7/15/15.
//  Copyright (c) 2015 Jason Scott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var addBtn : UIButton!
    var heldNotePad : NotePad!

    //MARK: - View Lifecycle -
    
    override func viewDidLoad() {
        setupGestureRecognizers();
        
        super.viewDidLoad()
    }

    //MARK: - Interface Interaction Methods -
    
    @IBAction func createNotePad(){
        let notePad : NotePad = NotePad().createInView(self.view);
        notePad.transform = CGAffineTransformMakeScale(0, 0);
        notePad.center = addBtn.center;
        notePad.saveBtn.alpha = 1;
        notePad.deleteBtn.alpha = 1;
        notePad.noteBtn.enabled = false;
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            notePad.center = self.view.center;
            notePad.transform = CGAffineTransformMakeScale(1, 1);
            }) { (Bool) -> Void in
                
        };
        
        
    }
    
    //MARK: - Gesture Recognition Methods -
    
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
            println("began")
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
}