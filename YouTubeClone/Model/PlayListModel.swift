//
//  PlayListModel.swift
//  YouTubeClone
//
//  Created by Marina Andrés Aragón on 25/5/23.
//

import Foundation

struct PlaylistModel: Decodable {
    let kind:String
    let etag:String
    let pageInfo:PageInfo
    let items:[Items]
    
    struct Items: Decodable {
        let kind:String
        let etag: String
        let id: String
        let snippet: Snippet
        let contentDetails:ContentDetails
        
        
        struct Snippet: Decodable {
            let publishedAt: Date
            let channelId: String
            let title: String
            let description: String
            let channelTitle: String
            let localized: Localize
            
            struct Thumbnails: Decodable {
                let medium: Medium
                
                struct Medium: Decodable {
                    let url: String
                    let width: Int
                    let height: Int
                }
            }
            struct Localize: Decodable {
                let title: String
                let description: String
            }
        }
        struct ContentDetails: Decodable {
            let contentDetails:Int
        }
    }
    
    struct PageInfo:Decodable {
        let totalResults: Int
        let resultsPerPage: Int
    }
}
