//
//  HomeProvider.swift
//  YouTubeClone
//
//  Created by Marina Andrés Aragón on 31/5/23.
//

import Foundation
protocol HomeProviderProtocol {
    func getChannel(channelId : String) async throws -> ChannelModel
    func getVideos(searchString : String, channelId : String) async throws -> VideoModel
    func getPlaylists(ChannelId : String) async throws -> PlaylistModel
    func getPlaylistsItems(playlistId : String) async throws -> PlaylistItemsModel
}
class HomeProvider: HomeProviderProtocol {
    lazy var presenter = HomePresenter(delegate: self)
    func getVideos(searchString : String, channelId : String) async throws -> VideoModel{
        var queryParams : [String:String] = ["part":"snippet", "type": "video"]
        if !channelId.isEmpty{
            queryParams["channelId"] = channelId
        }
        if !searchString.isEmpty{
            queryParams["q"] = searchString
        }
        let requestModel = RequestModel(endpoint: .search, queryItems: queryParams)
        
        do{
            let model = try await ServiceLayer.callService(requestModel, VideoModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
    }
    
    
    func getChannel(channelId : String) async throws -> ChannelModel{
        let queryParams : [String:String] = ["part":"snippet,statistics,brandingSettings", "id":channelId]
        let requestModel = RequestModel(endpoint: .channels, queryItems: queryParams)
        
        do{
            let model = try await ServiceLayer.callService(requestModel, ChannelModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
        
    }
    
    func getPlaylists(ChannelId : String) async throws -> PlaylistModel{
        let queryParams : [String:String] = ["part":"snippet,contentDetails", "channelId": ChannelId]
        let requestModel = RequestModel(endpoint: .playlist, queryItems: queryParams)
        
        do{
            let model = try await ServiceLayer.callService(requestModel, PlaylistModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
        
    }
    
    func getPlaylistsItems(playlistId : String) async throws -> PlaylistItemsModel{
        let queryParams : [String:String] = ["part":"snippet,id,contentDetails", "playlistId": playlistId]
        let requestModel = RequestModel(endpoint: .playlistItems, queryItems: queryParams)
        
        do{
            let model = try await ServiceLayer.callService(requestModel, PlaylistItemsModel.self)
            return model
        }catch{
            print(error)
            throw error
        }
    
    
    

 }
    
}
extension HomeProvider: HomeViewProtocol {
    func getData(list: [[Any]]) {
        print(list)
    }
    
    
}
