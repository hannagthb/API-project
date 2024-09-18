//
//  ContentView.swift
//  HarryPotterChecker
//
//  Created by Hanna Che on 17/09/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("🪄 Harry Potter wiki")
                    .font(.title)
                    .padding(.top, 50)
                    .padding(.bottom, 200)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 5) {
                ForEach(0..<4) { index in
                    NavigationLink {
                        if index == 0 {
                            BooksView(viewModel: viewModel)
                        }else if index == 1 {
                            CharactersView(viewModel: viewModel)
                        }else if index == 2{
                            HousesView(viewModel: viewModel)
                        }else if index == 3 {
                            SpellsView(viewModel: viewModel)
                        }
                    }label: {
                        HStack {
                            Text("\(viewModel.icons[index]) \(viewModel.names[index])")
                                .font(.title2)
                                .foregroundStyle(.black)
                            Spacer()
                            }
                            .frame(width: 150)
                            .padding()
                        }
                    }
                }
                 Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
