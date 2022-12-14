//
//  DetailViewModel.swift
//  AppStoreClone
//
//  Created by Hyoju Son on 2022/08/08.
//

import Combine
import Foundation

final class DetailViewModel: ViewModelProtocol {
    // MARK: - Nested Types
    struct Input {
        let leftBarButtonDidTap: AnyPublisher<Void, Never>
        let sharebuttonDidTap: AnyPublisher<Void, Never>
        let screenshotCellDidSelect: AnyPublisher<Int, Never>
        let unfoldButtonDidTap: AnyPublisher<Void, Never>
    }
    
    struct Output {
        let appItem: AnyPublisher<AppItem, Never>
        let appShareActivityItems: AnyPublisher<[String], Never>
        let isDescriptionLabelUnfolded: AnyPublisher<Bool, Never>
    }
    
    // MARK: - Properties
    private weak var coordinator: DetailCoordinator!
    private let appItem: AppItem!
    private var isCurrentDescriptionLabelUnfolded = false
    private var cancellableBag = Set<AnyCancellable>()
    
    // MARK: - Initializers
    init(coordinator: DetailCoordinator, appItem: AppItem) {
        self.coordinator = coordinator
        self.appItem = appItem
    }
    
    deinit {
        coordinator.finish()
    }
    
    // MARK: - Methods
    func transform(_ input: Input) -> Output {
        let appItem = configureBookItem()
        configureLeftBarButtonDidTapSubscriber(for: input.leftBarButtonDidTap)
        let appShareActivityItems = configureSharebuttonDidTapSubscriber(for: input.sharebuttonDidTap)
        configureScreenshotCellDidSelectSubscriber(for: input.screenshotCellDidSelect)
        let isDescriptionLabelUnfolded = configureUnfoldButtonDidTapSubscriber(for: input.unfoldButtonDidTap)
        
        let output = Output(
            appItem: appItem,
            appShareActivityItems: appShareActivityItems,
            isDescriptionLabelUnfolded: isDescriptionLabelUnfolded
        )
        
        return output
    }
                            
    private func configureBookItem() -> AnyPublisher<AppItem, Never> {
        return Just(self.appItem).eraseToAnyPublisher()
    }
    
    private func configureLeftBarButtonDidTapSubscriber(for inputPublisher: AnyPublisher<Void, Never>) {
        inputPublisher
            .sink(receiveValue: { [weak self] _ in
                self?.coordinator.popCurrentPage()
            })
            .store(in: &cancellableBag)
    }
    
    private func configureSharebuttonDidTapSubscriber(
        for inputPublisher: AnyPublisher<Void, Never>
    ) -> AnyPublisher<[String], Never> {
        inputPublisher
            .map { [weak self] _ -> [String] in
                guard let self = self else {
                    return [Text.emptyString]
                }
                
                let appIconURL = self.appItem.artworkURL100
                let trackName = self.appItem.trackName
                let genreName = self.appItem.primaryGenreName
                let trackViewURL = self.appItem.trackViewURL

                return [appIconURL, trackName, genreName, trackViewURL]
            }
            .eraseToAnyPublisher()
    }
    
    private func configureScreenshotCellDidSelectSubscriber(for inputPublisher: AnyPublisher<Int, Never>) {
        inputPublisher
            .sink(receiveValue: { [weak self] indexPath in
                guard let self = self else { return }
                DispatchQueue.main.async { 
                    self.coordinator.showScreenshotPage(with: self.appItem.screenshotURLs, selectedIndex: indexPath)
                }
            })
            .store(in: &cancellableBag)
    }
    
    private func configureUnfoldButtonDidTapSubscriber(
        for inputPublisher: AnyPublisher<Void, Never>
    ) -> AnyPublisher<Bool, Never> {
        inputPublisher
            .map { [weak self] _ -> Bool in
                guard let self = self else { return false }
                self.isCurrentDescriptionLabelUnfolded.toggle()
                return self.isCurrentDescriptionLabelUnfolded
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - NameSpaces
extension DetailViewModel {
    private enum Text {
        static let emptyString = ""
    }
}
