//
//  HomePresenter.swift
//  YouTubeClone
//
//  Created by Marina Andrés Aragón on 31/5/23.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func getData(list: [[Any]])
    }

class HomePresenter {
    var provider: HomeProviderProtocol
    var delegate: HomeViewProtocol?
    private var objectList: [[Any]] = []
    
    init(delegate : HomeViewProtocol, provider : HomeProviderProtocol = HomeProvider()){
           self.provider = provider
           self.delegate = delegate
           #if DEBUG
           if MockManager.shared.runAppWithMock{
               self.provider = HomeProviderMock()
           }
           #endif
       }
            
            func getHomeObjects() async {
                objectList.removeAll()
                do {
                    // let channel = try await provider.getChannel(channelId: Constants.channelId).items
                    //  let playlist = try await provider.getPlaylists(ChannelId: Constants.channelId).items
                    let videos = try await provider.getVideos(searchString: "", channelId: Constants.channelId).items
                    //  let playlistItems = try await provider.getPlaylistsItems(playlistId: playlist.first?.id ?? "").items
                    
                    //  objectList.append(channel)
                    //  objectList.append(playlistItems)
                    objectList.append(videos)
                    //  objectList.append(playlist)
                    
                } catch {
                    print(error)
                }
            }
        }
