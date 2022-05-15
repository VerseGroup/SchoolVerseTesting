//
//  ScheduleTestingView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/15/22.
//

import SwiftUI

struct ScheduleTestingView: View {
    @StateObject var vm = ScheduleRepository()
    
    var body: some View {
        VStack {
            Text(vm.schedule?.days.first?.periods.first?.className ?? "UH OH")
            
            Spacer()
            
            Text(vm.errorMessage ?? "No error message")
        }
    }
}

struct ScheduleTestingView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleTestingView()
    }
}
