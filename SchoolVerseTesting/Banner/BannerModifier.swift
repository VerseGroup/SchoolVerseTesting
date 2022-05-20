//
//  BannerModifier.swift
//  SchoolVerseTesting
//
//  Created by Steven Yu on 5/19/22.
//

import SwiftUI

// source: https://trailingclosure.com/notification-banner-using-swiftui/

struct BannerModifier: ViewModifier {
    
    var title: String
    var detail: String?
    
    @Binding var show: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(title)
                                .bold()
                            if let detail = detail {
                                Text(detail)
                                    .font(Font.system(size: 15, weight: Font.Weight.light, design: Font.Design.default))
                            }
                        }
                        Spacer()
                    }
                    .foregroundColor(Color.white)
                    .padding(12)
                    .background(Color.purple)
                    .cornerRadius(8)
                    Spacer()
                }
                .padding()
                .animation(.easeInOut, value: show)
                .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                .onTapGesture {
                    withAnimation {
                        self.show = false
                    }
                }.onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            self.show = false
                        }
                    }
                })
            }
        }
    }
}

extension View {
    func banner(title: String, detail: String?, show: Binding<Bool>) -> some View {
        self.modifier(BannerModifier(title: title, detail: detail, show: show))
    }
}
