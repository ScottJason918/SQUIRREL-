//
//  Helper.swift
//  SQUIRREL!
//
//  Created by Jason Scott on 7/20/15.
//  Copyright (c) 2015 Jason Scott. All rights reserved.
//

import Foundation
import UIKit

class NoteHelper {
    
    var allNotes: Array<NoteObject> = [];
    
    func loadNotes() -> NSArray {
        if(NSUserDefaults.standardUserDefaults().objectForKey("SavedNotes") != nil) {
            var loadedData: NSData = NSUserDefaults.standardUserDefaults().objectForKey("SavedNotes") as! NSData;
            var loadedNotes: AnyObject? = NSKeyedUnarchiver.unarchiveObjectWithData(loadedData);
            //println(loadedNotes)
            self.allNotes = loadedNotes as? [NoteObject] ?? [];
        }
        
        return allNotes;
    }
    
    func saveAllNotes() {
        let saveData = NSKeyedArchiver.archivedDataWithRootObject(allNotes);
        NSUserDefaults.standardUserDefaults().setObject(saveData, forKey: "SavedNotes");
        NSUserDefaults.standardUserDefaults().synchronize();
    }
    
    func saveNote(aNote: NoteObject) {
        if contains(allNotes, aNote){
            var index = find(allNotes, aNote);
            if(index != nil){
                allNotes[index as Int!] = aNote;
            }
        } else {
            allNotes.append(aNote);
        }
        
        saveAllNotes();
        println(allNotes);
    }
    
    func deleteNote(aNote: NoteObject) {
        
    }
}
