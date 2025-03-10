//
//  StoryListView.swift
//  IGStory
//
//  Created by hamza el aidi on 10/03/2025.
//

import SwiftUI

struct StoryListView: View {
    @ObservedObject var viewModel = StoryListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(viewModel.users) { user in
                            NavigationLink(destination: StoryView(user: user, viewModel: viewModel)) {
                                UserStoryView(user: user, stories: viewModel.stories.filter { $0.userId == user.id })
                            }
                        }
                    }
                    .padding()
                }
                .background(Color(.systemGray6))
                Spacer()
            }
            .navigationTitle("Stories")
        }
    }
}

#Preview {
    StoryListView()
}
