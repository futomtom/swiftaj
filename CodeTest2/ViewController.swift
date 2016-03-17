//
//  ViewController.swift
//  CodeTest2
//
//  Created by alexfu on 3/11/16.
//  Copyright © 2016 alexfu. All rights reserved.
//

import UIKit
import BrightcovePlayerSDK
import BrightcovePlayerUI

extension UIView{
    
    func boundInside(superView: UIView){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        superView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[subview]-0-|", options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics:nil, views:["subview":self]))
        superView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[subview]-0-|", options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics:nil, views:["subview":self]))
        
        
    }
}

class ViewController: UIViewController,BCOVPlaybackControllerDelegate, BCOVPUIPlayerViewDelegate {

    var catalogService:BCOVCatalogService!
    var playbackController:BCOVPlaybackController!
    var playerView:BCOVPUIPlayerView!
    var manager: BCOVPlayerSDKManager!
    
    
    @IBOutlet weak var videoContainer: UIView!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = BCOVPlayerSDKManager.sharedManager()
        playbackController = manager.createPlaybackController()
        playbackController.delegate = self
        playbackController.autoAdvance = true
        playbackController.autoPlay = true
        catalogService = BCOVCatalogService(token: "09MQKMo8MdLanB7dqUAJWoeMXY2FDrbYhfnEpx91paZbR7-GxK2nBQ..")

        let options: BCOVPUIPlayerViewOptions = BCOVPUIPlayerViewOptions()
        options.presentingViewController = self
        playerView = BCOVPUIPlayerView(playbackController: self.playbackController, options: options)
        playerView.delegate = self
        self.videoContainer.addSubview(self.playerView)
        
        
        playerView.boundInside(self.view)
     //   self.requestContentFromCatalog()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

/*
NSString *token;      // (Brightcove Media API token with URL access)
NSString *playlistID; // (ID of the playlist you wish to use)

BCOVPlayerSDKManager *manager = [BCOVPlayerSDKManager sharedManager];
id<BCOVPlaybackController> controller = [manager createPlaybackControllerWithViewStrategy:nil];
self.controller = controller; //store this to a strong property
[self.view addSubview:controller.view];

BCOVCatalogService *catalog = [[BCOVCatalogService alloc] initWithToken:token];
[catalog findPlaylistWithPlaylistID:playlistID
parameters:nil
completion:^(BCOVPlaylist *playlist,
NSDictionary *jsonResponse,
NSError      *error) {

[controller setVideos:playlist];
[controller play];

}];
*/
