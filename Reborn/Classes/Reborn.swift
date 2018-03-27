//
//  Reborn.swift
//  Reborn
//
//  Created by volkan biçer on 26/03/2018.
//

import Foundation


public protocol RebornDelegate: class{
    func rebornDidComplete()
}

public class Reborn{
    let version: String
    var currentVersion: String
    public var isTest: Bool = false
    public weak var delegate: RebornDelegate?
    
    public required init (at version: String){
        self.version = version
        self.currentVersion = "\(Bundle.main.infoDictionary!["CFBundleShortVersionString"] ?? "")"
    }
    
    public func check(){
        if isTest{
            invalidateReborn()
        }
        checkIfReborn()
    }
    
    func checkIfReborn(){
        if version == currentVersion && !isRebornDidTriggerBefore(){
            setRebornDidTrigger()
            delegate?.rebornDidComplete()
        }
    }
    
    func setRebornDidTrigger(_ value: Bool = true){
        UserDefaults.standard.set(value, forKey: storageKey)
    }
    
    func isRebornDidTriggerBefore() -> Bool{
        return UserDefaults.standard.bool(forKey: storageKey)
    }
    
    public func invalidateReborn(){
        setRebornDidTrigger(false)
    }
    
    func clearStorage(){
        let keys = UserDefaults.standard.dictionaryRepresentation().keys
        for key in keys where key.hasPrefix("Reborn"){
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
    
    var storageKey: String{
        return "Reborn_\(version)_DidTrigger"
    }
}
