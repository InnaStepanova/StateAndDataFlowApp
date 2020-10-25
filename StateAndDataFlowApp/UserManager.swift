//
//  UserManager.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 22.10.2020.
//

import Combine

class UserManager: ObservableObject {
    @Published var isRegister = false
    var name = ""
    
    init() {}
    
    init(name: String) {
        self.name = name
    }
}
