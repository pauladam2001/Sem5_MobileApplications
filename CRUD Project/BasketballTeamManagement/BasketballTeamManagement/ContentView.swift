//
//  ContentView.swift
//  BasketballTeamManagement
//
//  Created by Paul Adam on 31.10.2022.
//

import SwiftUI
import NavigationStack

struct ContentView: View {
    @StateObject var viewModel = EmployeesViewModel()
    
    var body: some View {
        NavigationStackView {
            EmployeesListView(viewModel: viewModel)
        }
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
