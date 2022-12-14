//
//  TableViewCell.swift
//  AppStoreClone
//
//  Created by Hyoju Son on 2022/08/09.
//

import UIKit

final class InfoCell: UITableViewCell {
    // MARK: - Properties
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .systemGray
        label.numberOfLines = 1
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    private let contentLabel: UILabel = {  
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .label
        label.numberOfLines = 1
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    // MARK: - Initializers
    convenience init() {
        self.init(style: .default, reuseIdentifier: Text.cellReuseIdentifier)
        configureUI()
    }
    
    // MARK: - Lifecycle Methods
    override func prepareForReuse() {
        super.prepareForReuse()
        categoryLabel.text = nil
        contentLabel.text = nil
    }
    
    // MARK: - Methods
    func apply(category: String, content: String) {
        categoryLabel.text = category
        contentLabel.text = content
    }
    
    private func configureUI() {
        addSubview(categoryLabel)
        addSubview(contentLabel)

        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            contentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            contentLabel.leadingAnchor.constraint(equalTo: categoryLabel.trailingAnchor, constant: 5),
            contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
}

// MARK: - Namespaces
extension InfoCell {
    private enum Text {
        static let cellReuseIdentifier: String = "InfoCell"
    }
}
