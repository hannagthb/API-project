//
//  BooksView.swift
//  HarryPotterChecker
//
//  Created by Hanna Che on 18/09/2024.
//

import SwiftUI

struct BooksView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.books) {book in
                    NavigationLink{
                        ScrollView(showsIndicators: false) {
                            VStack {
                                Text(book.title)
                                    .font(.largeTitle)
                                    .padding(.bottom)
                                
                                AsyncImage(url: URL(string: book.cover)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .padding(.horizontal)
                                        .padding(.bottom)
                                    }placeholder: {
                                        Text("🔎")
                                    }
                                
                                HStack {
                                    Text("Release date: \(book.releaseDate)")
                                    Text("The book number: \(book.number)")
                                        
                                }
                                .font(.footnote)
                                .padding(.bottom)
                                
                                Text(book.description)
                                    .padding(.horizontal)
                                    .font(.title3)
                            }
                        }
                    }label: {
                        HStack {
                            AsyncImage(url: URL(string: book.cover)) { image in
                                image.resizable()
                                    .clipShape(Circle())
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                            }placeholder: {
                                Text("🔎")
                            }
                            Text(book.title)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchBooks()
            }
            .navigationTitle("Books")
        }
    }
}

#Preview {
    BooksView(viewModel: ViewModel())
}
