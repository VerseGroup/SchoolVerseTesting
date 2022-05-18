//
//  ScheduleView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/15/22.
//

import SwiftUI

struct ScheduleView: View {
    @StateObject var vm: ScheduleViewModel = ScheduleViewModel()
    var body: some View {
        VStack {
            // if schedule valid
            if let schedule = vm.schedule {
                Text("Hello, working")
                Text("Selected Day: \(vm.selectedDayEvent?.day.description ?? "ERROR AAAAAA")")
                ScrollView {
                    
                }
            } else {
                Text("Connect your schedule!")
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
