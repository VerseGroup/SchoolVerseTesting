//
//  DaysTestingView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/15/22.
//

import SwiftUI

struct DaysTestingView: View {
    @StateObject var vm = ScheduleRepository()
    
    var body: some View {
        VStack {
            Text(vm.dayEvents.first?.day.description ?? "Error")
            
            Spacer()
            
            Text(vm.errorMessage ?? "No error message")
        }
    }
}

struct DaysTestingView_Previews: PreviewProvider {
    static var previews: some View {
        DaysTestingView()
    }
}
