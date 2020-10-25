//
//  RegisteredView.swift
//  StateAndDataFlowApp
//
//  Created by Alexey Efimov on 21.10.2020.
//

import SwiftUI

struct RegisteredView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
   
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Text("\(name.count)")
                    .padding()
                    .foregroundColor(colorName())
                    
                    
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
                .disabled(disableButton())
            }
        }
    }
}

extension RegisteredView {
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            if name.count >= 3 {
            user.isRegister = true
            }
        }
    }
    private func colorName() -> Color {
        var color = Color.red
        if name.count >= 3 {
            color = Color.green
        }
        return color
    }
    
    private func disableButton() -> Bool {
        var disable = true
        if name.count >= 3 {
            disable = false
        }
        return disable
    }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        RegisteredView()
            .environmentObject(UserManager())
    }
}

