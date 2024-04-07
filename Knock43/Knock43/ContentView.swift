//
//  ContentView.swift
//  Knock43
//
//  Created by 白数叡司 on 2024/04/07.
//

import SwiftUI

struct ContentView: View {
    @State var repositories: [Repository] = []
    @State var page: Int = 1
    @State var showingErrorAlert = false
    @State var isFetching: Bool = false
    
    let gitHubAPIClient = GitHubAPIClient()
    
    var body: some View {
        NavigationStack {
            List(repositories) { repository in
                if isFetching {
                    ProgressView()
                } else {
                    VStack(alignment: .leading) {
                        Text(repository.fullName)
                            .font(Font.system(size: 24).bold())
                        Text(repository.description ?? "")
                        Text("Star: \(repository.stargazersCount)")
                    }
                    .onAppear {
                        if repositories.last == repository {
                            fetchGitHubRepos()
                        }
                    }
                }
            }
            .navigationTitle("Repositories")
        }
        .onAppear {
            fetchGitHubRepos()
        }
        .alert("Error", isPresented: $showingErrorAlert) {
            Button("Close", action: {})
        } message: {
            Text("Failed to Fetch repositories.")
        }
        
    }
    
    @MainActor
    func fetchGitHubRepos() {
        if isFetching {
            return
        }
        isFetching = true
        
        Task {
            do {
                repositories = try await gitHubAPIClient.fetchRepositories(page: page, perPage: 20)
                page += 1
                isFetching = false
            } catch {
                isFetching = false
                showingErrorAlert = true
            }
        }
    }
}

#Preview {
    ContentView()
}
