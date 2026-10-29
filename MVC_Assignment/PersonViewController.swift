//
//  PersonViewController.swift
//  MVC_Assignment
//
//  Created by Amit Kamat on 29/10/26.
//

import UIKit

class PersonViewController: UIViewController {

    let person: Person

    init(person: Person) {
        self.person = person
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Refresh the Profile Viewed label here.
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Person Details"
        view.backgroundColor = .systemBackground

        let imageView = UIImageView()
        imageView.image = person.profileImages.first
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.heightAnchor.constraint(equalToConstant: 220).isActive = true

        let detailsLabel = UILabel()
        detailsLabel.numberOfLines = 0
        detailsLabel.font = .systemFont(ofSize: 18)
        detailsLabel.text = """
        First Name: \(person.firstName)
        Last Name: \(person.lastName)
        Age: \(person.age)
        City: \(person.city)
        Height: \(person.height) cm
        Profile Viewed: \(person.profileViewed ? "Yes" : "No")
        """

        let button = UIButton(type: .system)
        button.setTitle("View All Profile Images", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(
            self,
            action: #selector(showImages),
            for: .touchUpInside
        )

        let stack = UIStackView(arrangedSubviews: [
            imageView,
            detailsLabel,
            button
        ])
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 24
            ),
            stack.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 24
            ),
            stack.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -24
            )
        ])
    }

    @objc private func showImages() {
        person.profileViewed = true

        navigationController?.pushViewController(
            ProfileImagesViewController(person: person),
            animated: true
        )
    }
}
