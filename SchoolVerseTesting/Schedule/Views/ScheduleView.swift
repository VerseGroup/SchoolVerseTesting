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
            // if user has a schedule
            if let _ = vm.schedule {
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
                    HStack {
                        VStack(alignment: .leading) {
                            if let day = vm.selectedDayEvent?.day.description {
                                Text(day)
                                    .font(.title2)
                                    .bold()
                            }
                            Text("\(vm.selectedDate.weekDateString())")
                        }
                        Spacer()
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.purple)
                    .cornerRadius(5)
                    
                    // day schedule portion
                    if let daySchedule = vm.schedule?.days.first(where: { daySchedule in
                        vm.selectedDayEvent?.day == daySchedule.day
                    }) {
                        // ensures ForEach works since PeriodInfo is not unique, but ForEach requires unique
                        ForEach(
                            // converting PeriodInfo to UniquePeriodInfo
                            daySchedule.periods.compactMap({ period in
                                UniquePeriodInfo(period: period)
                            })
                        ) { uniquePeriod in
                            PeriodView(period: uniquePeriod.period)
                        }
                    }
                }
            } else {
                Text("Connect your schedule!")
            }
        }
        .padding()
        .navigationTitle("Schedule")
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
