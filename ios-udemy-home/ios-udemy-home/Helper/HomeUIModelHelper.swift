//
//  HomeUIModelHelper.swift
//  ios-udemy-home
//
//  Created by Dongik Song on 10/13/24.
//

import Foundation

struct HomeUIModelHelper {
  typealias SectionModel = HomeUIModel.SectionModel
  
  static func makeUIModel(response: APIResponse) -> HomeUIModel {
    var sectionModels = [SectionModel]()
    for layout in response.layouts {
      switch layout {
      case let .mainBanner(id, mainBanner):
        let sectionModel = SectionModel(
          section: .mainBanner(id: id),
          body: [.mainBanner(
            id: mainBanner.id,
            imageLink: mainBanner.imageLink,
            title: mainBanner.title,
            caption: mainBanner.caption)
          ])
        sectionModels.append(sectionModel)
      case let .textHeader(id, textHeader):
        let sectionModel = SectionModel(
          section: .textHeader(id: id),
          body: [.textHeader(
            id: textHeader.id,
            text: textHeader.text,
            highlightedText: textHeader.highlightedText)
          ])
        sectionModels.append(sectionModel)
      case let .courseSwimlane(id, courses):
        let items: [HomeUIModel.Item] = courses.map { course in
          return .course(id: course.id, imageLink: course.imageLink, title: course.title, author: course.author, rating: course.rating, reviewCount: course.reviewCount, price: course.price, tag: course.tag)
        }
        let sectionModel = SectionModel(
          section: .courseSwimlane(id: id),
          body: items)
        sectionModels.append(sectionModel)
      case let .categories(id, categories):
        let sectionModel = SectionModel(
          section: .categories(id: id),
          body: [.categoriesScroller(
            id: categories.id,
            titles: categories.titles)])
        sectionModels.append(sectionModel)
      case let .featuredCourse(id, course):
        let sectionModel = SectionModel(
          section: .featuredCourse(id: id),
          body: [.featuredCourse(
            id: course.id,
            imageLink: course.imageLink,
            title: course.title,
            author: course.author,
            rating: course.rating,
            reviewCount: course.reviewCount,
            price: course.price)
          ])
        sectionModels.append(sectionModel)
      case let .udemyBusinessBanner(id, udemyBusinessBanner):
        let sectionModel = SectionModel(
          section: .udemyBusinessBanner(id: id),
          body: [.udemyBusinessBanner(
            id: udemyBusinessBanner.id,
            link: udemyBusinessBanner.link)
          ])
        sectionModels.append(sectionModel)
      case .unknown(let type):
        print(">>>> Unknown type found - \(type)")
      }
    }
    return HomeUIModel(sectionModels: sectionModels)
  }
}
