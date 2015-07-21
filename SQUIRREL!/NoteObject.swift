//
//  NoteObject.swift
//  SQUIRREL!
//
//  Created by Jason Scott on 7/20/15.
//  Copyright (c) 2015 Jason Scott. All rights reserved.
//

import Foundation
import UIKit

let theTaskString = "taskString";
let theTimeString = "timeString";
let theDescriptionString = "descriptionString";
let theCreatedDate = "createdDate";
let theEditDate = "editDate";
let theUniqueID = "uniqueID";
let theSavedCenter = "savedCenter";

class NoteObject : NSObject, NSCoding {
    
    var taskString : String = "";
    var timeString : String = "";
    var descriptionString : String = "";
    var createdDate : NSDate = NSDate();
    var editDate : NSDate = NSDate();
    var uniqueID : NSInteger = -1;
    var savedCenter : CGPoint = CGPointMake(0.0, 0.0)
    
    override init(){
        super.init();
    }
    
    convenience init(aTask : String, aTime : String, aDescription : String, aCenter : CGPoint){
        self.init()
        self.taskString = aTask;
        self.timeString = aTime;
        self.descriptionString = aDescription;
        self.savedCenter = aCenter;
        self.createdDate = NSDate();
        self.editDate = NSDate();
            //TODO: - Define UNIQUE ID Creation -
        
    }
    
    required init(coder aDecoder: NSCoder){
        self.taskString = aDecoder.decodeObjectForKey(theTaskString) as! String;
        self.timeString = aDecoder.decodeObjectForKey(theTimeString) as! String;
        self.descriptionString = aDecoder.decodeObjectForKey(theDescriptionString) as! String;
        self.createdDate = aDecoder.decodeObjectForKey(theCreatedDate) as! NSDate;
        self.editDate = aDecoder.decodeObjectForKey(theCreatedDate) as! NSDate;
        self.uniqueID = aDecoder.decodeIntegerForKey(theUniqueID);
        self.savedCenter = aDecoder.decodeCGPointForKey(theSavedCenter);
        super.init();
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.taskString, forKey: theTaskString);
        aCoder.encodeObject(timeString, forKey: theTimeString);
        aCoder.encodeObject(description, forKey: theDescriptionString);
        aCoder.encodeObject(createdDate, forKey: theCreatedDate);
        aCoder.encodeObject(editDate, forKey: theEditDate);
        aCoder.encodeInteger(uniqueID, forKey: theUniqueID);
        aCoder.encodeCGPoint(savedCenter, forKey: theSavedCenter);
    }
    
}
