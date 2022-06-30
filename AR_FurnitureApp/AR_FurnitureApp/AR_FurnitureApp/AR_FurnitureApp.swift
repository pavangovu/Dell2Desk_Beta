

import SwiftUI
import Firebase

@main
struct AR_FurnitureApp: App {
    @StateObject var sessionSettings = SessionSettings()
    @StateObject var placementSettings = PlacementSettings()
    @StateObject var sceneManager = SceneManager()
    @StateObject var modelsViewModel = ModelsViewModel()
    @StateObject var modelDeletionManager = ModelDeletionManager()
    
    init() {
        FirebaseApp.configure()
        
        // Anonymous authentication with Firebase
        Auth.auth().signInAnonymously { authResult, error in
            guard let user = authResult?.user else {
                print("FAILED: Anonymous Authentication with Firebase.")
                return
            }
            let uid = user.uid
            print("Firebase: Anonymous user authenticated with uid: \(uid).")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sessionSettings)
                .environmentObject(placementSettings)
                .environmentObject(sceneManager)
                .environmentObject(modelsViewModel)
                .environmentObject(modelDeletionManager)
        }
    }
}
