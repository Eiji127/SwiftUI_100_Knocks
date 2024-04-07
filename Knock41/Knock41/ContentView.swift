//
//  ContentView.swift
//  Knock41
//
//  Created by 白数叡司 on 2024/04/07.
//

import SwiftUI

struct ContentView: View {
    @State var repositories: [Repository] = []
    
    var body: some View {
        NavigationStack {
            List($repositories, id: \.self) { repository in
//                Text("\(repository.fullName)")
            }
            .navigationTitle("Repositories")
        }
        .onAppear {
            Task {
                repositories = try await GitHubAPIClient().fetchRepositories("concurrency")
            }
        }
    }
}

#Preview {
    ContentView()
}
