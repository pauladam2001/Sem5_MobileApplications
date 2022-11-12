//
//  AddEditEmployeeView.swift
//  BasketballTeamManagement
//
//  Created by Paul Adam on 31.10.2022.
//

import SwiftUI
import NavigationStack

enum AddOrEditScreenState: Equatable {
    case add
    case edit(Employee)
}

struct AddEditEmployeeView: View {
    let screenState: AddOrEditScreenState
    @ObservedObject var employeesViewModel: EmployeesViewModel
    @StateObject var formViewModel: FormViewModel
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    @State private var alertIsPresented = false
    
    init(screenState: AddOrEditScreenState, employeesViewModel: EmployeesViewModel) {
        self.screenState = screenState
        self.employeesViewModel = employeesViewModel
        switch screenState {
        case .add:
            self._formViewModel = StateObject(wrappedValue: FormViewModel(employee: nil))
        case .edit(let employee):
            self._formViewModel = StateObject(wrappedValue: FormViewModel(employee: employee))
        }
        
    }
    
    var body: some View {
        VStack {
            PopView {
                Image(systemName: "chevron.left")
                    .foregroundColor(.accentColor)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 24)
            .padding(.bottom)
            
            Text(screenState == .add ? "Add " : "Edit" + " employee")
                .font(.title)
                .padding(.bottom, 24)
            
            Form {
                TextField(text: $formViewModel.employee.name) {
                    Text("Name")
                }
                
                DatePicker("Date of Birth", selection: $formViewModel.employee.dateOfBirth, in: (Calendar.current.date(from: .init(year: 1920, month: 1, day: 1)) ?? .now)..., displayedComponents: .date)
                
                Picker("Occupation", selection: $formViewModel.employee.occupation) {
                    ForEach(Occupation.allCases) { occupation in
                        Text(occupation.rawValue)
                    }
                }
                
                HStack {
                    Text("Salary ($)")
                    
                    TextField("Salary", value: $formViewModel.employee.salary, format: .number)
                        .keyboardType(.numberPad)
                        .padding(.leading, 190)
                }
                
                
                Picker("Experience", selection: $formViewModel.employee.experience) {
                    ForEach(0...40, id: \.self) { number in
                        Text("\(number)")
                    }
                }
            }
            
            Button {
                if formViewModel.employee.name.isEmpty || formViewModel.employee.salary.isZero {
                    alertIsPresented = true
                    return
                }
                
                switch screenState {
                case .add:
                    employeesViewModel.addEmployee(name: formViewModel.employee.name, dateOfBirth: formViewModel.employee.dateOfBirth, occupation: formViewModel.employee.occupation, salary: formViewModel.employee.salary, experience: formViewModel.employee.experience)
                case .edit(_):
                    let updatedEmployee = formViewModel.employee
                    employeesViewModel.updateEmployee(employeeId: updatedEmployee.id, name: updatedEmployee.name, dateOfBirth: updatedEmployee.dateOfBirth, occupation: updatedEmployee.occupation, salary: updatedEmployee.salary, experience: updatedEmployee.experience)
                }
                
                self.navigationStack.pop(to: .previous)
            } label: {
                Text("Submit")
            }
        }
        .alert("Invalid fields!", isPresented: $alertIsPresented) {
            Button("Ok", role: .cancel) {}
        }
    }
}

struct AddEditEmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        AddEditEmployeeView(screenState: .add, employeesViewModel: .init())
    }
}
