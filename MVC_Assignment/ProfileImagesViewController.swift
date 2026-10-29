//
//  ProfileImagesViewController.swift
//  MVC_Assignment
//
//  Created by Amit Kamat on 29/10/26.
//

import UIKit

class ProfileImagesViewController: UIViewController {

    let person: Person

    init(person: Person) {
        self.person = person
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile Images"
        view.backgroundColor = .systemBackground

        let images = Array(person.profileImages.prefix(4))

        let grid = UIStackView()
        grid.axis = .vertical
        grid.spacing = 12
        grid.distribution = .fillEqually

        for start in stride(from: 0, to: images.count, by: 2) {
            let row = UIStackView()
            row.axis = .horizontal
            row.spacing = 12
            row.distribution = .fillEqually

            for index in start..<min(start + 2, images.count) {
                let imageView = UIImageView(image: images[index])
                imageView.contentMode = .scaleAspectFill
                imageView.clipsToBounds = true
                imageView.layer.cornerRadius = 12
                imageView.heightAnchor.constraint(
                    equalToConstant: 150
                ).isActive = true

                row.addArrangedSubview(imageView)
            }

            if row.arrangedSubviews.count == 1 {
                let spacer = UIView()
                row.addArrangedSubview(spacer)
            }

            grid.addArrangedSubview(row)
        }

        let remainingCount = max(0, person.profileImages.count - 4)

        let moreLabel = UILabel()
        moreLabel.textAlignment = .center
        moreLabel.font = .systemFont(ofSize: 17, weight: .medium)
        moreLabel.text = remainingCount > 0
            ? "\(remainingCount) more profile images"
            : "No more profile images"

        let stack = UIStackView(arrangedSubviews: [grid, moreLabel])
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
}
