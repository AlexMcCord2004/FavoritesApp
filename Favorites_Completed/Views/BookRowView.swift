//
//  BookRowView.swift
//  Favorites_Completed
//
//  Created by Alex McCord on 3/29/26.
//

import SwiftUI

struct BookRowView: View {
    
    let book: BookModel
    @EnvironmentObject private var favorites: FavoritesViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(book.bookTitle)
                    .font(.headline)
                
                Text(book.bookAuthor)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button(action: {
                favorites.toggleFavoriteBook(book: book)
            }) {
                Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(book.isFavorite ? .red : .gray)
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    BookRowView(book: BookModel(id: 1, bookTitle: "1984", bookAuthor: "George Orwell", isFavorite: true))
        .environmentObject(FavoritesViewModel())
}
