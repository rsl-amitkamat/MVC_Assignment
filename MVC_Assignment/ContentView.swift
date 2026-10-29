import SwiftUI
import UIKit

struct ContentView: UIViewControllerRepresentable {

    func makeUIViewController(
        context: Context
    ) -> UINavigationController {

        let person = Person(
            firstName: "Amit",
            lastName: "Kamat",
            age: 23,
            city: "Pune",
            height: 178.0,
            profileImages: [
                UIImage(systemName: "person.fill")!,
                UIImage(systemName: "person.crop.circle.fill")!,
                UIImage(systemName: "person.crop.square.fill")!,
                UIImage(systemName: "person.circle")!,
                UIImage(systemName: "person.crop.rectangle")!,
                UIImage(systemName: "person.crop.circle")!,
                UIImage(systemName: "person.fill.viewfinder")!
            ]
        )

        let controller = PersonViewController(person: person)

        return UINavigationController(
            rootViewController: controller
        )
    }

    func updateUIViewController(
        _ uiViewController: UINavigationController,
        context: Context
    ) {
    }
}
