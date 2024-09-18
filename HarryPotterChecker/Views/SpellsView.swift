//
//  SpellsView.swift
//  HarryPotterChecker
//
//  Created by Hanna Che on 18/09/2024.
//

import SwiftUI

struct SpellsView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.spells) {spell in
                    NavigationLink{
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text(spell.spell)
                                    .font(.largeTitle)
                                    .padding(.bottom)
                                
                                Text(spell.use)
                                    .padding(.horizontal)
                                    .font(.title3)
                            }
                        }
                    }label: {
                        HStack {
                            Text(spell.spell)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchSpells()
            }
            .navigationTitle("Spells")
        }
    }
}

#Preview {
    SpellsView(viewModel: ViewModel())
}
