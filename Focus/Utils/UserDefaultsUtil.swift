//
//  UserDefaultsUtil.swift
//  Focus
//
//  Created by shyam-15059 on 09/03/25.
//


import Foundation
enum UserDefaultsKey: String, CaseIterable {
    case lastSession
}

final class UserDefaultsUtil {
    
    let userdefault: UserDefaults
    
    static let shared = UserDefaultsUtil()
    
    private init() {
        userdefault = UserDefaults.standard
    }
    
    func setLastSessionID(sessionId id: String?) {
        if let id {
            self.userdefault.set(id, forKey: UserDefaultsKey.lastSession.rawValue)
        } else {
            self.userdefault.removeObject(forKey: UserDefaultsKey.lastSession.rawValue)
        }
        self.userdefault.synchronize() 
    }
    
    func getLastSessionID() -> String? {
        if let id = self.userdefault.value(forKey: UserDefaultsKey.lastSession.rawValue) as? String {
            return id
        }
        print("No Pending Sessions")
        return nil
    }
}
