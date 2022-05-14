//
//  MenuCellView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/20/22.
//

import SwiftUI

struct MenuCellView: View {
    let menu: Menu
    @State var showMenuDetailView: Bool = false
    
    var body: some View {
        HStack {
            Text(menu.date.weekDateString())
                .font(.title3)
                .bold()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.accentColor)
        .cornerRadius(10)
        .sheet(isPresented: $showMenuDetailView) {
            MenuDetailView(menu: menu)
        }
        .onTapGesture {
            showMenuDetailView.toggle()
        }
    }
}

struct MenuCellView_Previews: PreviewProvider {
    static var previews: some View {
        MenuCellView(menu: Menu(id: nil, date: Date.now, breakfast: [], lunch: [], dinner: []))
    }
}
