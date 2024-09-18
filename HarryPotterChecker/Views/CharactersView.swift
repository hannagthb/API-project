//
//  CharactersView.swift
//  HarryPotterChecker
//
//  Created by Hanna Che on 18/09/2024.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.characters) {character in
                    NavigationLink{
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text(character.fullName)
                                    .font(.largeTitle)
                                    .padding(.bottom)
                                
                                Text(character.nickname)
                                    .font(.title2)
                                    .padding(.bottom)
                                
                                AsyncImage(url: URL(string: character.image)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .padding(.horizontal)
                                        .padding(.bottom)
                                    }placeholder: {
                                        Text("🔎")
                                    }
                                
                                HStack {
                                    Text("The birthdate: \(character.birthdate)")
                                }
                                .font(.footnote)
                                .padding(.bottom)
                                
                                Text("The name of the actor/actress the character was interpreted by in the movies:  \(character.interpretedBy)")
                                    .padding(.horizontal)
                                    .font(.title3)
                            }
                        }
                    }label: {
                        HStack {
                            AsyncImage(url: URL(string: character.image)) { image in
                                image.resizable()
                                    .clipShape(Circle())
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                            }placeholder: {
                                Text("🔎")
                            }
                            Text(character.fullName)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchCharacters()
            }
            .navigationTitle("Characters")
        }
    }
}

#Preview {
    CharactersView(viewModel: ViewModel())
}
