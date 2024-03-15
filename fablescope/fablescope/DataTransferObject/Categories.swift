import Foundation

struct FormResponse: Codable {
    let categories: [Category]
}

struct Category: Codable {
    let id: Int
    let name: String
    let tags: [Tag]
}

struct Tag: Codable {
    let id: Int
    let name: String
    let description: String
    let iconSVG: String
    

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case iconSVG = "icon_svg"
    }
}
