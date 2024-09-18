//
//  HousesView.swift
//  HarryPotterChecker
//
//  Created by Hanna Che on 18/09/2024.
//

import SwiftUI

struct HousesView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.houses) {house in
                    NavigationLink{
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text(house.house)
                                    .font(.largeTitle)
                                    .padding(.bottom)
                                
                                Text("An emoji representing the house: \(house.emoji)")
                                    .padding(.bottom)
                                
                                Text("Colors: \(house.colors)")
                                    .padding(.horizontal)
                                    .font(.title3)
                                    .padding(.bottom)
                                
                                Text("The name of the founder of the house: \(house.founder)")
                                    .padding(.horizontal)
                                    .font(.title3)
                            }
                        }
                    }label: {
                        HStack {
                            Text(house.emoji)
                            Text(house.house)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchHouses()
            }
            .navigationTitle("Houses")
        }
    }
}

#Preview {
    HousesView(viewModel: ViewModel())
}
