//
//  CustomTabBarView.swift
//  Yuvka
//
//  Created by Mustafa Bekirov on 24.11.2024.
//

import SwiftUI

enum SelectedTabs: String, CaseIterable{
    case Book = "book"
    case Search = "camera"
    case Add = "plus.circle"
    case Bookmark = "bookmark"
    case Settings = "gearshape"
}

struct CustomTabBarView: View {
    
    @Binding var selectedTab: SelectedTabs
    
    private var filledImaged: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(SelectedTabs.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? filledImaged : tab.rawValue)
                        .foregroundStyle(selectedTab == tab ?  Color(.accentColor) : Color(.white))
                        .imageScale(.large)
                        .font(.system(size: 20))
                        .onTapGesture {
                            withAnimation(.spring) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(height: 70)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            .padding(.leading)
            .padding(.trailing)
        }
    }
}

#Preview {
    CustomTabBarView(selectedTab: .constant(.Add))
}

