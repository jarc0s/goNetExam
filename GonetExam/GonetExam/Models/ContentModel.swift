//
//  ContentModel.swift
//  GonetExam
//
//  Created by Juan Arcos on 15/05/20.
//  Copyright © 2020 Juan Arcos. All rights reserved.
//

import Foundation

struct ContentModel {
    var titleContent: String
    var descriptionContent: String
    var imageName: String
}


extension ContentModel {
    
    static func getAll() -> [ContentModel] {
        let arrContent: [ContentModel] = [
            ContentModel(titleContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", descriptionContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis at pellentesque sapien. Morbi malesuada, risus vel pulvinar pharetra, nisi lacus auctor augue, eget elementum enim nisi vitae ante. Vivamus at erat nec lacus aliquam scelerisque ut id tellus. In feugiat arcu vitae dui tempor tincidunt. Nam rutrum eros vehicula elit euismod, sed varius libero iaculis. Proin iaculis, neque in rhoncus fermentum, ante metus condimentum justo, in vehicula quam urna quis purus. Mauris vestibulum, purus sit amet blandit pretium, eros ipsum aliquam mauris, et pharetra orci tortor et felis. Aenean convallis neque vulputate, ullamcorper ipsum nec, tincidunt nunc. Nulla molestie odio molestie quam tempus, eget vestibulum arcu efficitur. Vivamus condimentum ac diam sed consequat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla rhoncus quis eros ut dictum. In ultrices ex vitae ligula cursus maximus.", imageName: "logo"),
            ContentModel(titleContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.", descriptionContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec nunc nunc. Vivamus dignissim felis et dui euismod ultrices. Vivamus tincidunt ante vitae vulputate iaculis. Mauris vehicula ex a egestas ullamcorper. Nulla in euismod libero, ut malesuada erat. Etiam justo magna, hendrerit eget felis et, vestibulum laoreet nunc. Quisque semper tellus vel eros sollicitudin, nec venenatis est egestas. Praesent vestibulum mollis mi vitae vehicula.", imageName: "logo1"),
            ContentModel(titleContent: "Lorem ipsum dolor sit amet", descriptionContent: "Nullam non ipsum dolor. Nullam ut arcu eleifend, commodo velit id, laoreet felis. Curabitur pretium erat sed semper varius. Morbi risus arcu, venenatis sit amet placerat ac, ullamcorper vel est. Nunc eu ultrices felis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas faucibus felis vitae lorem blandit molestie. Proin gravida consectetur magna, vel ultrices quam maximus vitae. Etiam id justo at arcu porta porta. Mauris at odio purus. Etiam odio ante, sollicitudin quis eros ut, bibendum facilisis ipsum. Sed egestas lacus id augue mattis, vitae ornare urna tincidunt.", imageName: "logo2"),
            ContentModel(titleContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae ornare lorem. Duis leo nulla.", descriptionContent: "Sed vulputate ante et ullamcorper feugiat. Nam scelerisque commodo eros, id pharetra lorem. Aliquam venenatis vestibulum nulla ut vestibulum. Nam est augue, semper in libero non, iaculis rhoncus elit. Proin odio massa, lobortis id sagittis eu, ultrices et tortor. In ultrices volutpat sapien, vel luctus nulla feugiat id. Nunc libero orci, gravida ac augue sit amet, lacinia elementum nunc. Fusce sed sollicitudin mauris. Phasellus ac odio posuere, placerat nisi id, ultrices lacus. Vestibulum tincidunt lacus libero, sed hendrerit est pretium nec.", imageName: "logo"),
            ContentModel(titleContent: "Lorem ipsum dolor", descriptionContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac nunc quis.", imageName: "logo1"),
            ContentModel(titleContent: "Lorem ipsum dolor sit amet, consectetur.", descriptionContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac nunc quis.", imageName: "logo2"),
            ContentModel(titleContent: "Lorem ipsum dolor sit.", descriptionContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac nunc quis.", imageName: "logo")
        ]
        
        return arrContent
    }
}
