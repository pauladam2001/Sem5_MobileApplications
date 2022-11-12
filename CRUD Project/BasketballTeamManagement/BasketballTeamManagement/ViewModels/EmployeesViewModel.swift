//
//  EmployeesViewModel.swift
//  BasketballTeamManagement
//
//  Created by Paul Adam on 31.10.2022.
//

import Foundation

class EmployeesViewModel: ObservableObject {
    @Published var employees: [Employee]
    
    init() {
        employees = Employee.dummyData()
    }
    
    func addEmployee(name: String, dateOfBirth: Date, occupation: Occupation, salary: Double, experience: Int) {
        employees.append(.init(name: name, dateOfBirth: dateOfBirth, occupation: occupation, salary: salary, experience: experience))
        objectWillChange.send()
    }
    
    func updateEmployee(employeeId: UUID, name: String, dateOfBirth: Date, occupation: Occupation, salary: Double, experience: Int) {
        if let index = employees.firstIndex(where: { $0.id == employeeId}) {
            employees[index].name = name
            employees[index].dateOfBirth = dateOfBirth
            employees[index].occupation = occupation
            employees[index].salary = salary
            employees[index].experience = experience
            objectWillChange.send()
        }
    }
    
    func deleteEmployee(employeeId: UUID) {
        employees.removeAll { employee in
            employee.id == employeeId
        }
        objectWillChange.send()
    }
}
