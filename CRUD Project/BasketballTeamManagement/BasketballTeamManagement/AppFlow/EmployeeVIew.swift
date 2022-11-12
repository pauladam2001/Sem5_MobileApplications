//
//  EmployeeVIew.swift
//  BasketballTeamManagement
//
//  Created by Paul Adam on 31.10.2022.
//

import SwiftUI

struct EmployeeView: View {
    let employee: Employee
    @Binding var offset: CGSize
    let onEdit: () -> Void
    let onDelete: () -> Void
    @State private var alertIsShowing = false
    
    var body: some View {
        ZStack {
            Color.red
            Button {
                onDelete()
            } label: {
                Text("Fire")
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 24)
            
            HStack(spacing: 30) {
                VStack {
                    Text(employee.name)
                    Text(employee.dateOfBirth, style: .date)
                }
                
                
                VStack {
                    Text(employee.occupation.rawValue)
                    Text("$\(employee.salary.formatted())")
                }
                
                Button {
                    onEdit()
                } label: {
                    Text("Edit")
                        .foregroundColor(.accentColor)
                }
                .padding(.leading, 23)
            }
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: .zero)
                .foregroundColor(.white))
            .swipeLeftGesture(offset: $offset) {
                alertIsShowing = true
            }
            .alert("Are you sure you want to fire this employee?", isPresented: $alertIsShowing) {
                Button(role: .cancel) {
                    offset = .zero
                    alertIsShowing = false
                } label: {
                    Text("Cancel")
                }
                Button(role: .destructive) {
                    onDelete()
                } label: {
                    Text("Yes, I have no heart!")
                }
            }
        }
        .padding(.horizontal, 24)
    }
}

struct EmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeView(employee: .mock(), offset: .constant(.zero), onEdit: {}, onDelete: {})
    }
}
