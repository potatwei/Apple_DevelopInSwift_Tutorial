/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    // You’ll observe this value and save
    // user data when it becomes inactive.
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    // You’ll provide the saveAction closure
    // when instantiating ScrumsView.
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
        }
        // You can use onChange(of:perform:)
        // to trigger actions when a specified value changes.
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
    }
}
