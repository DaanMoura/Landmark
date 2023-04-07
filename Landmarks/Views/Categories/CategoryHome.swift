//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Daniel Moura on 05/04/23.
//

import SwiftUI

private let featuredImageHeight: CGFloat = 200

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    
    var body: some View {
        NavigationView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3/2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                
                let sortedKeys = modelData.categories.keys.sorted()
                ForEach(sortedKeys, id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                        .listRowSeparator(key == sortedKeys.last ? .hidden : .visible)
                        .padding(.vertical)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.plain)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
