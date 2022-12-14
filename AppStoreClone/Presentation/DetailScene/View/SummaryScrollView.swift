//
//  SummaryScrollView.swift
//  AppStoreClone
//
//  Created by Hyoju Son on 2022/08/09.
//

import UIKit

final class SummaryScrollView: UIScrollView {
    // MARK: - Properties
    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 0
        return stackView
    }()
    private let ratingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: Design.innerStackViewVerticalInset,
            leading: Design.innerStackViewHorizontalInset,
            bottom: Design.innerStackViewVerticalInset,
            trailing: Design.innerStackViewHorizontalInset
        )
        stackView.spacing = Design.innerStackViewSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    private let ratingTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Design.titleLabelFont
        label.textColor = Design.titleLabelColor
        label.numberOfLines = 1
        return label
    }()
    private let ratingContentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Design.contentLabelFont
        label.textColor = Design.contentLabelColor
        label.numberOfLines = 1
        return label
    }()
    private var starRatingStackView = StarRatingStackView()
    private let advisoryRatingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: Design.innerStackViewVerticalInset,
            leading: Design.innerStackViewHorizontalInset,
            bottom: Design.innerStackViewVerticalInset,
            trailing: Design.innerStackViewHorizontalInset
        )
        stackView.spacing = Design.innerStackViewSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    private let advisoryRatingTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Design.titleLabelFont
        label.textColor = Design.titleLabelColor
        label.text = Text.advisoryRatingTitleLabelText
        return label
    }()
    private let advisoryRatingContentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Design.contentLabelFont
        label.textColor = Design.contentLabelColor
        label.numberOfLines = 1
        return label
    }()
    private let advisoryRatingSuffixLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Design.descriptionFont
        label.textColor = Design.descriptionColor
        label.text = Text.advisoryRatingSuffixLabelText
        return label
    }()
    private let categoryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally  // TODO: ????????? ????????? ????????? ????????? ?????????
        stackView.alignment = .center
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: Design.innerStackViewVerticalInset,
            leading: Design.innerStackViewHorizontalInset,
            bottom: Design.innerStackViewVerticalInset,
            trailing: Design.innerStackViewHorizontalInset
        )
        stackView.spacing = Design.innerStackViewSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    private let categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Design.titleLabelFont
        label.textColor = Design.titleLabelColor
        label.text = Text.categoryTitleLabelText
        return label
    }()
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = Design.contentLabelColor
        return imageView
    }()
    private let categoryDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Design.descriptionFont
        label.textColor = Design.descriptionColor
        label.numberOfLines = 1
        return label
    }()
    private let developerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: Design.innerStackViewVerticalInset,
            leading: Design.innerStackViewHorizontalInset,
            bottom: Design.innerStackViewVerticalInset,
            trailing: Design.innerStackViewHorizontalInset
        )
        stackView.spacing = Design.innerStackViewSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    private let developerTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Design.titleLabelFont
        label.textColor = Design.titleLabelColor
        label.text = Text.developerTitleLabelText
        return label
    }()
    private let developerImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: Text.developerImageSystemName))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = Design.contentLabelColor
        return imageView
    }()
    private let developerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Design.descriptionFont
        label.textColor = Design.descriptionColor
        label.numberOfLines = 1
        return label
    }()
    private let languageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: Design.innerStackViewVerticalInset,
            leading: Design.innerStackViewHorizontalInset,
            bottom: Design.innerStackViewVerticalInset,
            trailing: Design.innerStackViewHorizontalInset
        )
        stackView.spacing = Design.innerStackViewSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    private let languageTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Design.titleLabelFont
        label.textColor = Design.titleLabelColor
        label.text = Text.languageTitleLabelText
        return label
    }()
    private let languageSymbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Design.contentLabelFont
        label.textColor = Design.contentLabelColor
        label.numberOfLines = 1
        return label
    }()
    private let languageDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = Design.descriptionFont
        label.textColor = Design.descriptionColor
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - Initializers
    convenience init() {
        self.init(frame: .zero)
        configureUI()
        configureHierarchy()
    }
    
    // MARK: - Methods
    func apply(_ appItem: AppItem) {
        let languages = appItem.languageCodesISO2A
        guard let mainLanguage = appItem.languageCodesISO2A[safe: 0] else { return }
        ratingTitleLabel.text = "\(appItem.userRatingCount.byDigitWrapping)?????? ??????"
        
        let flooredRating = floor(appItem.averageUserRating * 10) / 10  // ?????? ????????? 4.75??? ?????? 4.7??? ?????????
        ratingContentLabel.text = String(format: "%.1f", flooredRating)
        starRatingStackView.apply(rating: appItem.averageUserRating)
        
        advisoryRatingContentLabel.text = "\(appItem.contentAdvisoryRating)"
        
        categoryImageView.image = UIImage(systemName: Text.shoppingCategoryImageSystemName) // TODO: ??????????????? ?????? ????????? ??????
        categoryDescriptionLabel.text = appItem.primaryGenreName  // TODO: Localization ??????
        
        developerNameLabel.text = appItem.artistName
        
        languageSymbolLabel.text = "\(mainLanguage)"
        if languages.count == 1 {
            languageDescriptionLabel.text = "\(mainLanguage)"  // TODO: Localization ??????
        } else {
            languageDescriptionLabel.text = "+ \(languages.count - 1)??? ??????"
        }
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    private func configureHierarchy() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(ratingStackView)
        containerStackView.addArrangedSubview(advisoryRatingStackView)
        containerStackView.addArrangedSubview(categoryStackView)
        containerStackView.addArrangedSubview(developerStackView)
        containerStackView.addArrangedSubview(languageStackView)
        
        ratingStackView.addArrangedSubview(ratingTitleLabel)
        ratingStackView.addArrangedSubview(ratingContentLabel)
        ratingStackView.addArrangedSubview(starRatingStackView)
        
        advisoryRatingStackView.addArrangedSubview(advisoryRatingTitleLabel)
        advisoryRatingStackView.addArrangedSubview(advisoryRatingContentLabel)
        advisoryRatingStackView.addArrangedSubview(advisoryRatingSuffixLabel)
        
        categoryStackView.addArrangedSubview(categoryTitleLabel)
        categoryStackView.addArrangedSubview(categoryImageView)
        categoryStackView.addArrangedSubview(categoryDescriptionLabel)
        
        developerStackView.addArrangedSubview(developerTitleLabel)
        developerStackView.addArrangedSubview(developerImageView)
        developerStackView.addArrangedSubview(developerNameLabel)
        
        languageStackView.addArrangedSubview(languageTitleLabel)
        languageStackView.addArrangedSubview(languageSymbolLabel)
        languageStackView.addArrangedSubview(languageDescriptionLabel)
        
        containerStackView.addVerticalSeparators()
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            starRatingStackView.heightAnchor.constraint(equalTo: advisoryRatingSuffixLabel.heightAnchor),
            ratingContentLabel.heightAnchor.constraint(equalTo: ratingContentLabel.heightAnchor),
            categoryImageView.heightAnchor.constraint(equalTo: ratingContentLabel.heightAnchor),
            developerImageView.heightAnchor.constraint(equalTo: ratingContentLabel.heightAnchor),
        ])
    }
}

// MARK: - NameSpace
extension SummaryScrollView {
    private enum Text {
        static let advisoryRatingTitleLabelText: String = "??????"
        static let advisoryRatingSuffixLabelText: String = "???"
        static let categoryTitleLabelText: String = "????????????"
        static let developerTitleLabelText: String = "?????????"
        static let languageTitleLabelText: String = "??????"
        static let developerImageSystemName: String = "person.crop.square"
        static let shoppingCategoryImageSystemName: String = "cart"
    }
    
    private enum Design {
        static let innerStackViewVerticalInset: CGFloat = 0
        static let innerStackViewHorizontalInset: CGFloat = 10
        static let innerStackViewSpacing: CGFloat = 8
        static let titleLabelFont: UIFont = .preferredFont(forTextStyle: .caption2)
        static let titleLabelColor: UIColor = .systemGray2
        static let contentLabelFont: UIFont = .preferredFont(forTextStyle: .title3)
        static let contentLabelColor: UIColor = .systemGray
        static let descriptionFont: UIFont = .preferredFont(forTextStyle: .footnote)
        static let descriptionColor: UIColor = .systemGray
    }
}
