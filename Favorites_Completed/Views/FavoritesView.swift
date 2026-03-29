//
// FavoritesView.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    private var favoriteCities: [CityModel] {
        favorites.cities.filter { $0.isFavorite }
    }
    
    private var favoriteHobbies: [HobbyModel] {
        favorites.hobbies.filter { $0.isFavorite }
    }
    
    private var favoriteBooks: [BookModel] {
        favorites.books.filter { $0.isFavorite }
    }
    
    private var hasFavorites: Bool {
        !favoriteCities.isEmpty || !favoriteHobbies.isEmpty || !favoriteBooks.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            List {
                if !favoriteCities.isEmpty {
                    Section("Cities") {
                        ForEach(favoriteCities) { city in
                            HStack {
                                Text(city.cityName)
                                Spacer()
                                Button(action: {
                                    favorites.toggleFavoriteCity(city: city)
                                }) {
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(.red)
                                }
                            }
                        }
                    }
                }
                
                if !favoriteHobbies.isEmpty {
                    Section("Hobbies") {
                        ForEach(favoriteHobbies) { hobby in
                            HStack {
                                Text("\(hobby.hobbyIcon) \(hobby.hobbyName)")
                                Spacer()
                                Button(action: {
                                    favorites.toggleFavoriteHobby(hobby: hobby)
                                }) {
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(.red)
                                }
                            }
                        }
                    }
                }
                
                if !favoriteBooks.isEmpty {
                    Section("Books") {
                        ForEach(favoriteBooks) { book in
                            HStack {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(book.bookTitle)
                                    Text(book.bookAuthor)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    favorites.toggleFavoriteBook(book: book)
                                }) {
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(.red)
                                }
                            }
                        }
                    }
                }
                
                if !hasFavorites {
                    ContentUnavailableView(
                        "No Favorites Yet",
                        systemImage: "star",
                        description: Text("Add some favorite cities, hobbies, or books from the Home tab.")
                    )
                }
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}
