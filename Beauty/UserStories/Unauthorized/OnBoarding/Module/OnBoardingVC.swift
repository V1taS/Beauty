//
//  OnBoardingVC.swift
//  Beauty
//
//  Created by Vitalii Sosin on 31.10.2021.
//  
//

import UIKit

final class OnBoardingVC: UIViewController {

    // MARK: - Internal variables
    var interactor: OnBoardingInteractor?

    // MARK: - Private variables
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    private var pages: [UIViewController] = []
    private let initialPage: Int = .zero
    private let pageControl = UIPageControl()
    private let stack = UIStackView()
    private let buttonView = ButtonView()
    private var model: [OnBoardingModel] = []
    private let closeButton = UIButton(type: .system)

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        applyDefaultBehavior()
    }

    // MARK: - Private funcs
    private func configureLayout() {
        pageVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageVC.view)
        addChild(pageVC)
        pageVC.didMove(toParent: self)

        closeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(closeButton)

        [titleLabel, descriptionLabel, pageControl, buttonView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            stack.addArrangedSubview($0)
        }
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)

        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: view.compatableSafeAreaLayoutGuide.trailingAnchor, constant: -24),

            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    private func applyDefaultBehavior() {
        interactor?.loadedView()

        view.backgroundColor = .white

        pageVC.dataSource = self
        pageVC.delegate = self

        stack.axis = .vertical
        stack.setCustomSpacing(8, after: titleLabel)
        stack.setCustomSpacing(44, after: descriptionLabel)
        stack.setCustomSpacing(60, after: pageControl)


        titleLabel.numberOfLines = .zero
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.OnBoarding.title
        titleLabel.textColor = UIColor.OnBoarding.Label.title


        descriptionLabel.numberOfLines = .zero
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont.OnBoarding.description
        descriptionLabel.textColor = UIColor.OnBoarding.Label.description

        buttonView.colorBg = UIColor.OnBoarding.Button.nextBg
        buttonView.colorTitle = UIColor.OnBoarding.Button.nextTitle
        buttonView.title = String.OnBoarding.Button.next
        buttonView.action = { [weak self] in
            self?.interactor?.close()
        }

        closeButton.setImage(UIImage.OnBoarding.Button.close.withRenderingMode(.alwaysTemplate), for: .normal)
        closeButton.tintColor = UIColor.OnBoarding.Button.close

        pageVC.setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)

        pageControl.currentPageIndicatorTintColor = UIColor.OnBoarding.PageControl.primary
        pageControl.pageIndicatorTintColor = UIColor.OnBoarding.PageControl.secondary
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage


        pageControl.addTarget(self, action: #selector(pageControlTapHandler(sender:)), for: .allTouchEvents)
        closeButton.addTarget(self, action: #selector(touchCloseButton), for: .touchUpInside)
    }

    private func createSomePage(_ model: [OnBoardingModel]) {
        model.forEach {
            let size = UIScreen.main.bounds
            let page = UIViewController()
            page.view.frame = CGRect(x: .zero, y: .zero, width: size.width, height: size.height)
            let dimmingImageView = DimmingImageView(frame: page.view.frame)
            dimmingImageView.image = $0.backgroundImage
            page.view.addSubview(dimmingImageView)
            pages.append(page)
        }
        pageVC.setViewControllers([pages[.zero]], direction: .forward, animated: true, completion: nil)
    }

    @objc
    private func pageControlTapHandler(sender:UIPageControl) {
        pageVC.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }

    @objc private func touchCloseButton() {
        self.interactor?.close()
    }
}

extension OnBoardingVC: OnBoardingView {
    func updateView(_ model: [OnBoardingModel]) {
        titleLabel.text = model[pageControl.currentPage].title
        descriptionLabel.text = model[pageControl.currentPage].description
        self.model = model
        createSomePage(model)
    }
}

extension OnBoardingVC: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
            if viewControllerIndex == 0 {
                // wrap to last page in array
                return self.pages.last
            } else {
                // go to previous page in array
                return self.pages[viewControllerIndex - 1]
            }
        }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
            if viewControllerIndex < self.pages.count - 1 {
                // go to next page in array
                return self.pages[viewControllerIndex + 1]
            } else {
                // wrap to first page in array
                return self.pages.first
            }
        }
        return nil
    }

}

extension OnBoardingVC: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        // set the pageControl.currentPage to the index of the current viewController in pages
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = self.pages.firstIndex(of: viewControllers[.zero]) {
                self.pageControl.currentPage = viewControllerIndex
                self.titleLabel.text = self.model[pageControl.currentPage].title
                self.descriptionLabel.text = self.model[pageControl.currentPage].description

                if self.model.count - 1 == pageControl.currentPage {
                    buttonView.title = String.OnBoarding.Button.start
                } else {
                    buttonView.title = String.OnBoarding.Button.next
                }
            }
        }
    }
}

private enum Constants {
}

