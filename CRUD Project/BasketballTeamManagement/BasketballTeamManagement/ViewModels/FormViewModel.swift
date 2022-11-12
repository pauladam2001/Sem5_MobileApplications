//
//  FormViewModel.swift
//  BasketballTeamManagement
//
//  Created by Paul Adam on 31.10.2022.
//

import Foundation

class FormViewModel: ObservableObject {
    @Published var employee: Employee
    
    init(employee: Employee?) {
        self.employee = employee ?? .init(name: "", dateOfBirth: Calendar.current.date(from: .init(year: 1970, month: 1, day: 1)) ?? .now, occupation: .player, salary: 0, experience: 0)
    }
}
