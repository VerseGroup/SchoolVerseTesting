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
            header
            VStack {
                // if schedule valid
                //            if let schedule = vm.schedule {
                
                HStack {
                    // go to previous day
                    Button {
                        vm.updateSelectedDayEvent(date: Calendar.current.date(byAdding: .day, value: -1, to: vm.selectedDate) ?? Date())
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    
                    Spacer()
                    
                    Text("\(vm.selectedDayEvent?.day.description ?? "No School!")")
                        .bold()
                    
                    Spacer()
                    
                    // go to next day
                    Button {
                        vm.updateSelectedDayEvent(date: Calendar.current.date(byAdding: .day, value: 1, to: vm.selectedDate) ?? Date())
                    } label: {
                        Image(systemName: "chevron.right")
                    }
                }
                .font(.title2)
                .padding(.vertical, 2)
                
                // main view
                ScrollView {
                    VStack(alignment: .leading) {
                        if let day = vm.selectedDayEvent?.day.description {
                            Text(day)
                        }
                        Text("\(Date.weekDateString(vm.selectedDate)())")
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.purple)
                    .cornerRadius(5)
                    
                    // day schedule portion
                    if let daySchedule = vm.schedule?.days.first(where: { daySchedule in
                        vm.selectedDayEvent?.day == daySchedule.day
                    }) {
                        ForEach(daySchedule.periods) { period in
                            PeriodView(
                        }
                    }
                }
                //            } else {
                //                Text("Connect your schedule!")
                //            }
            }
        }
        .padding()
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}

extension ScheduleView {
    private var header: some View {
        HStack {
            Text("Your Schedule")
                .bold()
            Spacer()
            Image(systemName: "calendar")
        }
        .font(.title)
    }
}
