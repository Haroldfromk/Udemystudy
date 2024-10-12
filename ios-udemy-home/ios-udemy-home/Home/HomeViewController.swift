//
//  ViewController.swift
//  ios-udemy-home
//
//  Created by Dongik Song on 10/10/24.
//

import UIKit
import SnapKit
import Combine
import SafariServices

class HomeViewController: UIViewController {
    private let apiClient = APIClient()
    private let collectionView = HomeCollectionView()
    private var cancellables = Set<AnyCancellable>()
    
    override func loadView() {
        super.loadView()
        observe()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchLayout()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func observe() {
        collectionView.eventPublisher.sink { [weak self] event in
            switch event {
            case let .itemTapped(item):
                self?.handleItemTapped(item: item)
            }
        }.store(in: &cancellables)
    }
    
    private func fetchLayout() {
        apiClient.fetchLayout()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error: \(error)")
                }
            } receiveValue: { [weak self] apiResponse in
                let uiModel = HomeUIModelHelper.makeUIModel(response: apiResponse)
                self?.collectionView.setDataSource(uiModel: uiModel)
            }.store(in: &cancellables)
    }
    
    private func handleItemTapped(item: HomeUIModel.Item) {
        switch item {
        case .mainBanner:
            break
        case let .course(_, _, title, _, _, _, _, _):
            showCourseDetailsViewController(title: title)
        case .textHeader:
            break
        case let .udemyBusinessBanner(_, link):
            showSafariWebView(link: link)
        case let .categoriesScroller(_, titles):
            guard let title = titles.first else { return }
            print(">>> categoriesScroller tapped \(title)")
        case .featuredCourse:
            break
        }
    }
    
    private func setupView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func showCourseDetailsViewController(title: String) {
        let viewController = CourseDetailViewController()
        viewController.setText(title: title)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func showSafariWebView(link: String) {
        guard let url = URL(string: link) else { return }
        navigationController?.present(SFSafariViewController(url: url), animated: true)
    }
    
    
}

struct APIClient {
    
    private let urlString =
    "https://run.mocky.io/v3/7efcd0a5-21fd-4f12-9e73-7aaa6701d722"
    
    func fetchLayout() -> AnyPublisher<APIResponse, Error> {
        return URLSession.shared.dataTaskPublisher(for: URL(string: urlString)!)
            .map({$0.data})
            .decode(type: APIResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
