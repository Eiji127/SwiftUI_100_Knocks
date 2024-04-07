//
//  ContentView.swift
//  Knock42
//
//  Created by 白数叡司 on 2024/04/07.
//

import SwiftUI

struct ContentView: View {
    @State var repositories: [Repository] = []
    @State var showingErrorAlert = false
    
    let gitHubAPIClient = GitHubAPIClient()
    
    var body: some View {
        NavigationStack {
            List(repositories) { repository in
                VStack(alignment: .leading) {
                    Text(repository.fullName)
                        .font(Font.system(size: 24).bold())
                    Text(repository.description ?? "")
                    Text("Star: \(repository.stargazersCount)")
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
        Task {
            do {
                repositories = try await gitHubAPIClient.fetchRepositories("Swift")
            } catch {
                showingErrorAlert = true
            }
        }
    }
}

#Preview {
    ContentView()
}
