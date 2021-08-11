//
//  Created by Peter Combee on 22/07/2021.
//

import Foundation

struct Breed: Decodable, Equatable {
    
    fileprivate enum RootKeys: String, CodingKey {
        case id, name, description, image
    }

    fileprivate enum ImageKeys: String, CodingKey {
        case width, height, url
    }
    
    let id: String
    let name: String
    let description: String
    let image: Image?

    init(id: String, name: String, description: String, image: Image?) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: RootKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        
        if
            let imageContainer = try? container.nestedContainer(keyedBy: ImageKeys.self, forKey: .image),
            let height = try? imageContainer.decode(Int?.self, forKey: .height),
            let width = try? imageContainer.decode(Int?.self, forKey: .width),
            let url = try? imageContainer.decode(String?.self, forKey: .url)
        {
            image = .init(height: height, width: width, url: url)
        } else {
            image = nil
        }
        
    }
    
}

struct Image: Equatable, Decodable {
    let height: Int
    let width: Int
    let url: String
}
