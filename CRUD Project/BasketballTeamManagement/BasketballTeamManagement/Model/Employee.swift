//
//  Employee.swift
//  BasketballTeamManagement
//
//  Created by Paul Adam on 31.10.2022.
//

import Foundation

enum Occupation: String, CaseIterable, Identifiable {
    var id: Self { self }
    
    case coach = "Coach"
    case player = "Player"
    case fitness_trainer = "Fitness trainer"
}

struct Employee: Hashable {
    let id = UUID()
    var name: String
    var dateOfBirth: Date
    var occupation: Occupation
    var salary: Double
    var experience: Int
    
    static func mock() -> Employee {
        return .init(name: "Paul Adam", dateOfBirth: Calendar.current.date(from: .init(year: 2001, month: 09, day: 24)) ?? .now, occupation: .player, salary: 1200.50, experience: 10)
    }
    
    static func dummyData() -> [Employee] {
        return [.init(name: "Paul", dateOfBirth: .now, occupation: .coach, salary: 123, experience: 5),
                .init(name: "Dan", dateOfBirth: .now, occupation: .player, salary: 30, experience: 7),
                .init(name: "Alex", dateOfBirth: .now, occupation: .fitness_trainer, salary: 35, experience: 4)
        ]
    }
}
