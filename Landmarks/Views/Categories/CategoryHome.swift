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
    
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: featuredImageHeight)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                    .padding(.bottom)
                    .listRowSeparator(.hidden)
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.plain)
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
