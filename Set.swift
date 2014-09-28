//
//  Set.swift
//  CookieCrunch
//
//  Created by liaojinxing on 14-9-28.
//  Copyright (c) 2014年 jinxing. All rights reserved.
//

struct Set<T: Hashable>: SequenceType, Printable {
    private var dictionary = Dictionary<T, Bool>()
    
    mutating func addElement(newElement: T) {
        dictionary[newElement] = true
    }
    
    mutating func removeElement(element: T) {
        dictionary[element] = nil
    }
    
    mutating func removeAllObjects() {
        for obj in dictionary.keys {
            dictionary[obj] = nil
        }
    }
    
    func containsElement(element: T) -> Bool {
        return dictionary[element] != nil
    }
    
    func allElements() -> [T] {
        return Array(dictionary.keys)
    }
    
    var count: Int {
        return dictionary.count
    }
    
    func generate() -> IndexingGenerator<Array<T>> {
        return allElements().generate()
    }
    
    var description: String {
        return dictionary.description
    }
}

// set computation
extension Set {
    func unionSet(otherSet: Set<T>) -> Set<T> {
        var combined = Set<T>()
        
        for obj in dictionary.keys {
            combined.dictionary[obj] = true
        }
        
        for obj in otherSet.dictionary.keys {
            combined.dictionary[obj] = true
        }
        
        return combined
    }
    
    func intersectsSet(otherSet: Set<T>) -> Set<T> {
        var interset = Set<T>()
        
        for obj in dictionary.keys {
            if otherSet.containsElement(obj) {
                interset.dictionary[obj] = true;
            }
        }
        return interset;
    }
    
    func minusSet(otherSet: Set<T>) -> Set<T> {
        var minus = Set<T>()
        
        for obj in dictionary.keys {
            if !otherSet.containsElement(obj) {
                minus.dictionary[obj] = true;
            }
        }
        return minus;
    }
    
    func isSubSetOfSet(otherSet: Set<T>) -> Bool {
        for obj in dictionary.keys {
            if (!otherSet.containsElement(obj)) {
                return false;
            }
        }
        return true;
    }
    
    func isEqualToSet(otherSet: Set<T>) -> Bool {
        return isSubSetOfSet(otherSet) && otherSet.isSubSetOfSet(self);
    }
}

