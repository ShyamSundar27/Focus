//
//  Focus.swift
//  Navigator
//
//  Created by shyam-15059 on 08/03/25.
//

import Foundation

final class Navigator: ObservableObject {
    
    @Published var routes = [Routes]()
    
    func push(to screen: Routes) {
        routes.append(screen)
    }
    
    func goBack() {
        _ = routes.popLast()
    }
    
    func reset() {
        routes = []
    }
    
}
