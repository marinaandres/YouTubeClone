//
//  HomeProviderMock.swift
//  YouTubeClone
//
//  Created by Marina Andrés Aragón on 2/6/23.
//

import Foundation

class HomeProviderMock: HomeProviderProtocol {
    func getChannel(channelId: String) async throws -> ChannelModel {
        guard let model = Utils.parseJson(jsonName: "Channel", model: ChannelModel.self) else {
            throw NetworkError.jsonDecoder
        }
        return model
    }
    
    func getVideos(searchString: String, channelId: String) async throws -> VideoModel {
       
        guard let model = Utils.parseJson(jsonName: "SearchVideos", model: VideoModel.self) else {
            throw NetworkError.jsonDecoder
        }
        return model
    }
    
    func getPlaylists(ChannelId: String) async throws -> PlaylistModel {
        guard let model = Utils.parseJson(jsonName: "Playlist", model: PlaylistModel.self) else {
            throw NetworkError.jsonDecoder
        }
        return model
    }
    
    func getPlaylistsItems(playlistId: String) async throws -> PlaylistItemsModel {
        guard let model = Utils.parseJson(jsonName: "PlaylistItems", model: PlaylistItemsModel.self) else {
            throw NetworkError.jsonDecoder
        }
        return model
    }
}
