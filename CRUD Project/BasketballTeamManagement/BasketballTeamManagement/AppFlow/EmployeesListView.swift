//
//  EmployeesListView.swift
//  BasketballTeamManagement
//
//  Created by Paul Adam on 31.10.2022.
//

import SwiftUI
import NavigationStack

struct EmployeesListView: View {
    @ObservedObject var viewModel: EmployeesViewModel
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    @State private var offsets: [CGSize]
    
    init(viewModel: EmployeesViewModel) {
        self.viewModel = viewModel
        self.offsets = [CGSize](repeating: .zero, count: viewModel.employees.count)
    }
    
    var body: some View {
        VStack {
            headerView
            
            Text("Employees")
                .font(.title)
                .padding(.bottom, 24)
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.employees.indices, id: \.self) {index in
                        EmployeeView(employee: viewModel.employees[index], offset: $offsets[index]) {
                            self.navigationStack.push(AddEditEmployeeView(screenState: .edit(viewModel.employees[index]), employeesViewModel: viewModel))
                        } onDelete: {
                            viewModel.deleteEmployee(employeeId: viewModel.employees[index].id)
                            self.offsets.remove(at: index)
                        }

                    }
                }
            }
        }
    }
    
    var headerView: some View {
        PushView(destination: AddEditEmployeeView(screenState: .add, employeesViewModel: viewModel)) {
            Image(systemName: "plus")
                .foregroundColor(.accentColor)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing, 24)
        .padding(.bottom, 30)
    }
}

struct EmployeesListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesListView(viewModel: .init())
    }
}
