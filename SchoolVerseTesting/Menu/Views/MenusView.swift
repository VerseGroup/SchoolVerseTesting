//
//  MenuListView.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 4/20/22.
//

import SwiftUI

// TODO: HIGHLIGHT MENU IF TODAY IS THE DAY

struct MenusView: View {
    @StateObject var menuListVM = MenuListViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(menuListVM.menus) { menu in
                    MenuCellView(menu: menu)
                        .listRowBackground(EmptyView())
                        .listRowSeparator(.hidden)
                }
            }
        }
        .navigationTitle("Menus 🍽")
    }
}

struct MenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenusView()
    }
}
