//
//  Games.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func generateGames() {
    getAllTasks()
    let game1 = Game(context: context)
    game1.category = gameCategoryArray[0]
    game1.title = "Surprise!"
    game1.url = "https://drive.google.com/file/d/1vdnjN6aNW4iRC1ljf79MBELI2-eW0BHe/view?usp=sharing"
    game1.favorite = true
    game1.order = 1
    game1.random = Int64(arc4random_uniform(1000))
    game1.selected = false
    game1.sortingIndex = 0
    game1.alphabet = String(describing: game1.title![(game1.title!.startIndex)])
    
    let game2 = Game(context: context)
    game2.category = gameCategoryArray[1]
    game2.title = "Button, Button, Who's Got the Button?"
    game2.url = "http://www.fungameskidsplay.com/buttonbuttongame.htm"
    game2.favorite = true
    game2.order = 2
    game2.random = Int64(arc4random_uniform(1000))
    game2.selected = false
    game2.sortingIndex = 0
    game2.alphabet = String(describing: game2.title![(game2.title!.startIndex)])
    
    let game5 = Game(context: context)
    game5.category = gameCategoryArray[4]
    game5.title = "Capture the Flag"
    game5.url = "http://www.fungameskidsplay.com/capturetheflaggame.htm"
    game5.favorite = false
    game5.order = 5
    game5.random = Int64(arc4random_uniform(1000))
    game5.selected = false
    game5.sortingIndex = 0
    game5.alphabet = String(describing: game5.title![(game5.title!.startIndex)])
    
    let game6 = Game(context: context)
    game6.category = gameCategoryArray[4]
    game6.title = "Dodgeball"
    game6.url = "http://www.fungameskidsplay.com/dodgeballgame.htm"
    game6.favorite = false
    game6.order = 6
    game6.random = Int64(arc4random_uniform(1000))
    game6.selected = false
    game6.sortingIndex = 0
    game6.alphabet = String(describing: game6.title![(game6.title!.startIndex)])
    
    let game7 = Game(context: context)
    game7.category = gameCategoryArray[1]
    game7.title = "Follow the Leader"
    game7.url = "http://www.fungameskidsplay.com/followtheleadergame.htm"
    game7.favorite = false
    game7.order = 7
    game7.random = Int64(arc4random_uniform(1000))
    game7.selected = false
    game7.sortingIndex = 0
    game7.alphabet = String(describing: game7.title![(game7.title!.startIndex)])
    
    let game8 = Game(context: context)
    game8.category = gameCategoryArray[1]
    game8.title = "Red Rover"
    game8.url = "http://www.fungameskidsplay.com/redrovergame.htm"
    game8.favorite = false
    game8.order = 8
    game8.random = Int64(arc4random_uniform(1000))
    game8.selected = false
    game8.sortingIndex = 0
    game8.alphabet = String(describing: game8.title![(game8.title!.startIndex)])
    
    let game11 = Game(context: context)
    game11.category = gameCategoryArray[1]
    game11.selectedOne = taskGame
    game11.title = "Hide and Seek"
    game11.url = "http://www.fungameskidsplay.com/hideandseekgame.htm"
    game11.favorite = true
    game11.order = 11
    game11.random = Int64(arc4random_uniform(1000))
    game11.selected = true
    game11.sortingIndex = 0
    game11.alphabet = String(describing: game11.title![(game11.title!.startIndex)])
    
    let game12 = Game(context: context)
    game12.category = gameCategoryArray[1]
    game12.title = "Hopscotch"
    game12.url = "http://www.fungameskidsplay.com/hopscotchgame.htm"
    game12.favorite = false
    game12.order = 12
    game12.random = Int64(arc4random_uniform(1000))
    game12.selected = false
    game12.sortingIndex = 0
    game12.alphabet = String(describing: game12.title![(game12.title!.startIndex)])
    
    let game13 = Game(context: context)
    game13.category = gameCategoryArray[1]
    game13.title = "H.O.R.S.E."
    game13.url = "http://www.fungameskidsplay.com/horsegame.htm"
    game13.favorite = false
    game13.order = 13
    game13.random = Int64(arc4random_uniform(1000))
    game13.selected = false
    game13.sortingIndex = 0
    game13.alphabet = String(describing: game13.title![(game13.title!.startIndex)])
    
    let game14 = Game(context: context)
    game14.category = gameCategoryArray[1]
    game14.title = "Hot Potato"
    game14.url = "http://www.fungameskidsplay.com/hotpotatogame.htm"
    game14.favorite = false
    game14.order = 14
    game14.random = Int64(arc4random_uniform(1000))
    game14.selected = false
    game14.sortingIndex = 0
    game14.alphabet = String(describing: game14.title![(game14.title!.startIndex)])
    
    let game15 = Game(context: context)
    game15.category = gameCategoryArray[1]
    game15.title = "Hula Hoop"
    game15.url = "http://www.fungameskidsplay.com/hulahoopgame.htm"
    game15.favorite = false
    game15.order = 15
    game15.random = Int64(arc4random_uniform(1000))
    game15.selected = false
    game15.sortingIndex = 0
    game15.alphabet = String(describing: game15.title![(game15.title!.startIndex)])
    
    let game16 = Game(context: context)
    game16.category = gameCategoryArray[1]
    game16.title = "Jacks"
    game16.url = "http://www.fungameskidsplay.com/jacksgame.htm"
    game16.favorite = false
    game16.order = 16
    game16.random = Int64(arc4random_uniform(1000))
    game16.selected = false
    game16.sortingIndex = 0
    game16.alphabet = String(describing: game16.title![(game16.title!.startIndex)])
    
    let game17 = Game(context: context)
    game17.category = gameCategoryArray[1]
    game17.title = "Juggle Circle"
    game17.url = "http://www.fungameskidsplay.com/jugglecirclegame.htm"
    game17.favorite = false
    game17.order = 17
    game17.random = Int64(arc4random_uniform(1000))
    game17.selected = false
    game17.sortingIndex = 0
    game17.alphabet = String(describing: game17.title![(game17.title!.startIndex)])
    
    let game18 = Game(context: context)
    game18.category = gameCategoryArray[1]
    game18.title = "Jump Rope"
    game18.url = "http://www.fungameskidsplay.com/jump-rope-rhymes.htm"
    game18.favorite = false
    game18.order = 18
    game18.random = Int64(arc4random_uniform(1000))
    game18.selected = false
    game18.sortingIndex = 0
    game18.alphabet = String(describing: game18.title![(game18.title!.startIndex)])
    
    let game19 = Game(context: context)
    game19.category = gameCategoryArray[4]
    game19.title = "Kickball"
    game19.url = "http://www.fungameskidsplay.com/kickballgame.htm"
    game19.favorite = false
    game19.order = 19
    game19.random = Int64(arc4random_uniform(1000))
    game19.selected = false
    game19.sortingIndex = 0
    game19.alphabet = String(describing: game19.title![(game19.title!.startIndex)])
    
    let game20 = Game(context: context)
    game20.category = gameCategoryArray[4]
    game20.title = "Kick the Can"
    game20.url = "http://www.fungameskidsplay.com/kickthecangame.htm"
    game20.favorite = false
    game20.order = 20
    game20.random = Int64(arc4random_uniform(1000))
    game20.selected = false
    game20.sortingIndex = 0
    game20.alphabet = String(describing: game20.title![(game20.title!.startIndex)])
    
    let game21 = Game(context: context)
    game21.category = gameCategoryArray[1]
    game21.title = "Limbo"
    game21.url = "http://www.fungameskidsplay.com/limbogame.htm"
    game21.favorite = true
    game21.order = 21
    game21.random = Int64(arc4random_uniform(1000))
    game21.selected = false
    game21.sortingIndex = 0
    game21.alphabet = String(describing: game21.title![(game21.title!.startIndex)])
    
    let game22 = Game(context: context)
    game22.category = gameCategoryArray[1]
    game22.title = "Marbles"
    game22.url = "http://www.fungameskidsplay.com/marblesgame.htm"
    game22.favorite = false
    game22.order = 22
    game22.random = Int64(arc4random_uniform(1000))
    game22.selected = false
    game22.sortingIndex = 0
    game22.alphabet = String(describing: game22.title![(game22.title!.startIndex)])
    
    let game23 = Game(context: context)
    game23.category = gameCategoryArray[1]
    game23.title = "Monkey in the Middle"
    game23.url = "http://www.fungameskidsplay.com/monkeyinthemiddle.htm"
    game23.favorite = false
    game23.order = 23
    game23.random = Int64(arc4random_uniform(1000))
    game23.selected = false
    game23.sortingIndex = 0
    game23.alphabet = String(describing: game23.title![(game23.title!.startIndex)])
    
    let game24 = Game(context: context)
    game24.category = gameCategoryArray[1]
    game24.title = "Playground Shark"
    game24.url = "http://www.fungameskidsplay.com/playgroundsharkgame.htm"
    game24.favorite = false
    game24.order = 24
    game24.random = Int64(arc4random_uniform(1000))
    game24.selected = false
    game24.sortingIndex = 0
    game24.alphabet = String(describing: game24.title![(game24.title!.startIndex)])
    
    let game25 = Game(context: context)
    game25.category = gameCategoryArray[1]
    game25.title = "Mother May I?"
    game25.url = "http://www.fungameskidsplay.com/mothermayigame.htm"
    game25.favorite = false
    game25.order = 25
    game25.random = Int64(arc4random_uniform(1000))
    game25.selected = false
    game25.sortingIndex = 0
    game25.alphabet = String(describing: game25.title![(game25.title!.startIndex)])
    
    let game26 = Game(context: context)
    game26.category = gameCategoryArray[1]
    game26.title = "Red Light Green Light"
    game26.url = "http://www.fungameskidsplay.com/redlightgreenlightgame.htm"
    game26.favorite = false
    game26.order = 26
    game26.random = Int64(arc4random_uniform(1000))
    game26.selected = false
    game26.sortingIndex = 0
    game26.alphabet = String(describing: game26.title![(game26.title!.startIndex)])
    
    let game27 = Game(context: context)
    game27.category = gameCategoryArray[1]
    game27.title = "Relay Race"
    game27.url = "http://www.fungameskidsplay.com/relayracegames.htm"
    game27.favorite = false
    game27.order = 27
    game27.random = Int64(arc4random_uniform(1000))
    game27.selected = false
    game27.sortingIndex = 0
    game27.alphabet = String(describing: game27.title![(game27.title!.startIndex)])
    
    let game28 = Game(context: context)
    game28.category = gameCategoryArray[1]
    game28.title = "Tag"
    game28.url = "http://www.fungameskidsplay.com/taggames.htm"
    game28.favorite = true
    game28.order = 28
    game28.random = Int64(arc4random_uniform(1000))
    game28.selected = false
    game28.sortingIndex = 0
    game28.alphabet = String(describing: game28.title![(game28.title!.startIndex)])
    
    let game29 = Game(context: context)
    game29.category = gameCategoryArray[1]
    game29.title = "I Spy"
    game29.url = "http://www.fungameskidsplay.com/travelgames.htm"
    game29.favorite = false
    game29.order = 29
    game29.random = Int64(arc4random_uniform(1000))
    game29.selected = false
    game29.sortingIndex = 0
    game29.alphabet = String(describing: game29.title![(game29.title!.startIndex)])
    
    let game30 = Game(context: context)
    game30.category = gameCategoryArray[0]
    game30.title = "You're It!"
    game30.url = "http://www.fungameskidsplay.com/youreit.htm"
    game30.favorite = false
    game30.order = 30
    game30.random = Int64(arc4random_uniform(1000))
    game30.selected = false
    game30.sortingIndex = 0
    game30.alphabet = String(describing: game30.title![(game30.title!.startIndex)])
    
    let game31 = Game(context: context)
    game31.category = gameCategoryArray[1]
    game31.title = "5 Little Monkeys Swinging In The Tree"
    game31.url = "https://www.youtube.com/watch?v=sy0Zr_UrFp0"
    game31.favorite = false
    game31.order = 31
    game31.random = Int64(arc4random_uniform(1000))
    game31.selected = false
    game31.sortingIndex = 0
    game31.alphabet = String(describing: game31.title![(game31.title!.startIndex)])
    
    let game32 = Game(context: context)
    game32.category = gameCategoryArray[4]
    game32.title = "Basketball"
    game32.url = "https://www.wikihow.com/Play-Basketball"
    game32.favorite = false
    game32.order = 32
    game32.random = Int64(arc4random_uniform(1000))
    game32.selected = false
    game32.sortingIndex = 0
    game32.alphabet = String(describing: game32.title![(game32.title!.startIndex)])
    
    let game33 = Game(context: context)
    game33.category = gameCategoryArray[4]
    game33.title = "Soccer"
    game33.url = "https://www.wikihow.com/Play-Soccer"
    game33.favorite = false
    game33.order = 33
    game33.random = Int64(arc4random_uniform(1000))
    game33.selected = false
    game33.sortingIndex = 0
    game33.alphabet = String(describing: game33.title![(game33.title!.startIndex)])
    
    let game34 = Game(context: context)
    game34.category = gameCategoryArray[6]
    game34.title = "Kite Flying"
    game34.url = "https://www.wikihow.com/Fly-a-Stunt-Kite"
    game34.favorite = false
    game34.order = 34
    game34.random = Int64(arc4random_uniform(1000))
    game34.selected = false
    game34.sortingIndex = 0
    game34.alphabet = String(describing: game34.title![(game34.title!.startIndex)])
    
    let game35 = Game(context: context)
    game35.category = gameCategoryArray[6]
    game35.title = "Hiking"
    game35.url = "https://www.wikihow.com/Hike"
    game35.favorite = false
    game35.order = 35
    game35.random = Int64(arc4random_uniform(1000))
    game35.selected = false
    game35.sortingIndex = 0
    game35.alphabet = String(describing: game35.title![(game35.title!.startIndex)])
    
    let game36 = Game(context: context)
    game36.category = gameCategoryArray[5]
    game36.title = "Luminaria"
    game36.url = "https://thanksgivingpoint.org/events/luminaria/"
    game36.favorite = false
    game36.order = 36
    game36.random = Int64(arc4random_uniform(1000))
    game36.selected = false
    game36.sortingIndex = 0
    game36.alphabet = String(describing: game36.title![(game36.title!.startIndex)])
    
    let game37 = Game(context: context)
    game37.category = gameCategoryArray[6]
    game37.title = "Lemonade Stand"
    game37.url = "https://www.wikihow.com/Run-a-Lemonade-Stand"
    game37.favorite = false
    game37.order = 37
    game37.random = Int64(arc4random_uniform(1000))
    game37.selected = false
    game37.sortingIndex = 0
    game37.alphabet = String(describing: game37.title![(game37.title!.startIndex)])
    
    let game38 = Game(context: context)
    game38.category = gameCategoryArray[6]
    game38.title = "Build A Snowman"
    game38.url = "https://www.wikihow.com/Make-a-Snowman"
    game38.favorite = false
    game38.order = 38
    game38.random = Int64(arc4random_uniform(1000))
    game38.selected = false
    game38.sortingIndex = 0
    game38.alphabet = String(describing: game38.title![(game38.title!.startIndex)])
    
    let game39 = Game(context: context)
    game39.category = gameCategoryArray[9]
    game39.title = "Picture Collage"
    game39.url = "https://www.wikihow.com/Make-a-Collage"
    game39.favorite = false
    game39.order = 39
    game39.random = Int64(arc4random_uniform(1000))
    game39.selected = false
    game39.sortingIndex = 0
    game39.alphabet = String(describing: game39.title![(game39.title!.startIndex)])
    
    let game40 = Game(context: context)
    game40.category = gameCategoryArray[5]
    game40.title = "Zoo"
    game40.url = "https://www.tripadvisor.com/Attractions"
    game40.favorite = false
    game40.order = 40
    game40.random = Int64(arc4random_uniform(1000))
    game40.selected = false
    game40.sortingIndex = 0
    game40.alphabet = String(describing: game40.title![(game40.title!.startIndex)])
    
    let game41 = Game(context: context)
    game41.category = gameCategoryArray[5]
    game41.title = "Local Event"
    game41.url = "https://www.tripadvisor.com/Attractions"
    game41.favorite = false
    game41.order = 41
    game41.random = Int64(arc4random_uniform(1000))
    game41.selected = false
    game41.sortingIndex = 0
    game41.alphabet = String(describing: game41.title![(game41.title!.startIndex)])
    
    let game42 = Game(context: context)
    game42.category = gameCategoryArray[1]
    game42.title = "Blanket Fort"
    game42.url = "https://www.wikihow.com/Make-a-Blanket-Fort"
    game42.favorite = true
    game42.order = 42
    game42.random = Int64(arc4random_uniform(1000))
    game42.selected = false
    game42.sortingIndex = 0
    game42.alphabet = String(describing: game42.title![(game42.title!.startIndex)])
    
    let game43 = Game(context: context)
    game43.category = gameCategoryArray[7]
    game43.title = "Genealogy"
    game43.url = "https://www.familysearch.org/"
    game43.favorite = false
    game43.order = 43
    game43.random = Int64(arc4random_uniform(1000))
    game43.selected = false
    game43.sortingIndex = 0
    game43.alphabet = String(describing: game43.title![(game43.title!.startIndex)])
    
    let game44 = Game(context: context)
    game44.category = gameCategoryArray[5]
    game44.title = "Family Photos"
    game44.url = "https://www.wikihow.com/Accessorize-Your-Home-With-Family-Photos"
    game44.favorite = false
    game44.order = 44
    game44.random = Int64(arc4random_uniform(1000))
    game44.selected = false
    game44.sortingIndex = 0
    game44.alphabet = String(describing: game44.title![(game44.title!.startIndex)])
    
    let game45 = Game(context: context)
    game45.category = gameCategoryArray[7]
    game45.title = "Clean House"
    game45.url = "https://www.wikihow.com/Clean-a-House"
    game45.favorite = false
    game45.order = 45
    game45.random = Int64(arc4random_uniform(1000))
    game45.selected = false
    game45.sortingIndex = 0
    game45.alphabet = String(describing: game45.title![(game45.title!.startIndex)])
    
    let game46 = Game(context: context)
    game46.category = gameCategoryArray[7]
    game46.title = "Visit Someone in Need"
    game46.url = "https://www.wikihow.com/Prepare-Yourself-for-Visiting-Someone-in-Hospital"
    game46.favorite = false
    game46.order = 46
    game46.random = Int64(arc4random_uniform(1000))
    game46.selected = false
    game46.sortingIndex = 0
    game46.alphabet = String(describing: game46.title![(game46.title!.startIndex)])
    
    let game47 = Game(context: context)
    game47.category = gameCategoryArray[6]
    game47.title = "Sledding"
    game47.url = "https://www.wikihow.com/Go-Sledding"
    game47.favorite = false
    game47.order = 47
    game47.random = Int64(arc4random_uniform(1000))
    game47.selected = false
    game47.sortingIndex = 0
    game47.alphabet = String(describing: game47.title![(game47.title!.startIndex)])
    
    let game48 = Game(context: context)
    game48.category = gameCategoryArray[9]
    game48.title = "Draw / Color"
    game48.url = "https://www.wikihow.com/Draw"
    game48.favorite = false
    game48.order = 48
    game48.random = Int64(arc4random_uniform(1000))
    game48.selected = false
    game48.sortingIndex = 0
    game48.alphabet = String(describing: game48.title![(game48.title!.startIndex)])
    
    let game49 = Game(context: context)
    game49.category = gameCategoryArray[0]
    game49.title = "Tell Stories"
    game49.url = "https://www.wikihow.com/Tell-a-Story"
    game49.favorite = false
    game49.order = 49
    game49.random = Int64(arc4random_uniform(1000))
    game49.selected = false
    game49.sortingIndex = 0
    game49.alphabet = String(describing: game49.title![(game49.title!.startIndex)])
    
    let game50 = Game(context: context)
    game50.category = gameCategoryArray[4]
    game50.title = "Baseball"
    game50.url = "https://www.wikihow.com/Play-Baseball"
    game50.favorite = false
    game50.order = 50
    game50.random = Int64(arc4random_uniform(1000))
    game50.selected = false
    game50.sortingIndex = 0
    game50.alphabet = String(describing: game50.title![(game50.title!.startIndex)])
    
    let game51 = Game(context: context)
    game51.category = gameCategoryArray[4]
    game51.title = "Ultimate Frisbee"
    game51.url = "https://www.wikihow.com/Play-Ultimate-Frisbee"
    game51.favorite = false
    game51.order = 51
    game51.random = Int64(arc4random_uniform(1000))
    game51.selected = false
    game51.sortingIndex = 0
    game51.alphabet = String(describing: game51.title![(game51.title!.startIndex)])
    
    let game52 = Game(context: context)
    game52.category = gameCategoryArray[4]
    game52.title = "Football"
    game52.url = "https://www.wikihow.com/Play-American-Football"
    game52.favorite = false
    game52.order = 52
    game52.random = Int64(arc4random_uniform(1000))
    game52.selected = false
    game52.sortingIndex = 0
    game52.alphabet = String(describing: game52.title![(game52.title!.startIndex)])
    
    let game53 = Game(context: context)
    game53.category = gameCategoryArray[6]
    game53.title = "Biking"
    game53.url = "https://www.wikihow.com/Ride-a-Bicycle"
    game53.favorite = false
    game53.order = 53
    game53.random = Int64(arc4random_uniform(1000))
    game53.selected = false
    game53.sortingIndex = 0
    game53.alphabet = String(describing: game53.title![(game53.title!.startIndex)])
    
    let game54 = Game(context: context)
    game54.category = gameCategoryArray[0]
    game54.title = "Play Musical Instrument(s) and/or Sing"
    game54.url = "https://www.wikihow.com/Make-a-Simple-Musical-Instrument"
    game54.favorite = false
    game54.order = 54
    game54.random = Int64(arc4random_uniform(1000))
    game54.selected = false
    game54.sortingIndex = 0
    game54.alphabet = String(describing: game54.title![(game54.title!.startIndex)])
    
    let game55 = Game(context: context)
    game55.category = gameCategoryArray[6]
    game55.title = "Rollerblade or Skate"
    game55.url = "https://www.wikihow.com/Rollerblade"
    game55.favorite = false
    game55.order = 55
    game55.random = Int64(arc4random_uniform(1000))
    game55.selected = false
    game55.sortingIndex = 0
    game55.alphabet = String(describing: game55.title![(game55.title!.startIndex)])
    
    let game56 = Game(context: context)
    game56.category = gameCategoryArray[9]
    game56.title = "Paint"
    game56.url = "https://www.wikihow.com/Make-Non-Toxic-Paint-for-Kids"
    game56.favorite = false
    game56.order = 56
    game56.random = Int64(arc4random_uniform(1000))
    game56.selected = false
    game56.sortingIndex = 0
    game56.alphabet = String(describing: game56.title![(game56.title!.startIndex)])
    
    let game57 = Game(context: context)
    game57.category = gameCategoryArray[7]
    game57.title = "72 Hour Kit"
    game57.url = "https://www.ready.gov/build-a-kit"
    game57.favorite = false
    game57.order = 57
    game57.random = Int64(arc4random_uniform(1000))
    game57.selected = false
    game57.sortingIndex = 0
    game57.alphabet = String(describing: game57.title![(game57.title!.startIndex)])
    
    let game58 = Game(context: context)
    game58.category = gameCategoryArray[7]
    game58.title = "Yard Work / Gardening / Planting"
    game58.url = "https://www.wikihow.com/Garden"
    game58.favorite = false
    game58.order = 58
    game58.random = Int64(arc4random_uniform(1000))
    game58.selected = false
    game58.sortingIndex = 0
    game58.alphabet = String(describing: game58.title![(game58.title!.startIndex)])
    
    let game59 = Game(context: context)
    game59.category = gameCategoryArray[6]
    game59.title = "Swimming"
    game59.url = "https://www.wikihow.com/Swim"
    game59.favorite = false
    game59.order = 59
    game59.random = Int64(arc4random_uniform(1000))
    game59.selected = false
    game59.sortingIndex = 0
    game59.alphabet = String(describing: game59.title![(game59.title!.startIndex)])
    
    let game60 = Game(context: context)
    game60.category = gameCategoryArray[6]
    game60.title = "Bird Watching"
    game60.url = "https://www.wikihow.com/Bird-Watch"
    game60.favorite = false
    game60.order = 60
    game60.random = Int64(arc4random_uniform(1000))
    game60.selected = false
    game60.sortingIndex = 0
    game60.alphabet = String(describing: game60.title![(game60.title!.startIndex)])
    
    let game61 = Game(context: context)
    game61.category = gameCategoryArray[6]
    game61.title = "Walk"
    game61.url = "https://www.wikihow.com/Walk"
    game61.favorite = false
    game61.order = 61
    game61.random = Int64(arc4random_uniform(1000))
    game61.selected = false
    game61.sortingIndex = 0
    game61.alphabet = String(describing: game61.title![(game61.title!.startIndex)])
    
    let game62 = Game(context: context)
    game62.category = gameCategoryArray[6]
    game62.title = "Pick Berries / Fruit"
    game62.url = "https://www.wikihow.com/Freeze-Blackberries"
    game62.favorite = false
    game62.order = 62
    game62.random = Int64(arc4random_uniform(1000))
    game62.selected = false
    game62.sortingIndex = 0
    game62.alphabet = String(describing: game62.title![(game62.title!.startIndex)])
    
    let game63 = Game(context: context)
    game63.category = gameCategoryArray[8]
    game63.title = "Can Food"
    game63.url = "https://www.wikihow.com/Can-Food"
    game63.favorite = false
    game63.order = 63
    game63.random = Int64(arc4random_uniform(1000))
    game63.selected = false
    game63.sortingIndex = 0
    game63.alphabet = String(describing: game63.title![(game63.title!.startIndex)])
    
    let game64 = Game(context: context)
    game64.category = gameCategoryArray[8]
    game64.title = "Make Desert"
    game64.url = "https://www.wikihow.com/Category:Desserts-and-Sweets"
    game64.favorite = false
    game64.order = 64
    game64.random = Int64(arc4random_uniform(1000))
    game64.selected = false
    game64.sortingIndex = 0
    game64.alphabet = String(describing: game64.title![(game64.title!.startIndex)])
    
    let game65 = Game(context: context)
    game65.category = gameCategoryArray[8]
    game65.title = "Make Dinner"
    game65.url = "https://www.wikihow.com/Make-a-Good-Meal-for-Your-Family-(for-Kids)"
    game65.favorite = false
    game65.order = 65
    game65.random = Int64(arc4random_uniform(1000))
    game65.selected = false
    game65.sortingIndex = 0
    game65.alphabet = String(describing: game65.title![(game65.title!.startIndex)])
    
    let game66 = Game(context: context)
    game66.category = gameCategoryArray[7]
    game66.title = "Share Treats With Someone"
    game66.url = "https://www.wikihow.com/Category:Desserts-and-Sweets"
    game66.favorite = false
    game66.order = 66
    game66.random = Int64(arc4random_uniform(1000))
    game66.selected = false
    game66.sortingIndex = 0
    game66.alphabet = String(describing: game66.title![(game66.title!.startIndex)])
    
    let game67 = Game(context: context)
    game67.category = gameCategoryArray[10]
    game67.title = "Write / Journal"
    game67.url = "https://www.wikihow.com/Write"
    game67.favorite = false
    game67.order = 67
    game67.random = Int64(arc4random_uniform(1000))
    game67.selected = false
    game67.sortingIndex = 0
    game67.alphabet = String(describing: game67.title![(game67.title!.startIndex)])
    
    let game68 = Game(context: context)
    game68.category = gameCategoryArray[5]
    game68.title = "Museum"
    game68.url = "https://www.tripadvisor.com/Attractions"
    game68.favorite = false
    game68.order = 68
    game68.random = Int64(arc4random_uniform(1000))
    game68.selected = false
    game68.sortingIndex = 0
    game68.alphabet = String(describing: game68.title![(game68.title!.startIndex)])
    
    let game69 = Game(context: context)
    game69.category = gameCategoryArray[5]
    game69.title = "Aquarium"
    game69.url = "https://www.tripadvisor.com/Attractions"
    game69.favorite = false
    game69.order = 69
    game69.random = Int64(arc4random_uniform(1000))
    game69.selected = false
    game69.sortingIndex = 0
    game69.alphabet = String(describing: game69.title![(game69.title!.startIndex)])
    
    let game70 = Game(context: context)
    game70.category = gameCategoryArray[3]
    game70.title = "Poker"
    game70.url = "https://www.wikihow.com/Deal-Poker"
    game70.favorite = false
    game70.order = 70
    game70.random = Int64(arc4random_uniform(1000))
    game70.selected = false
    game70.sortingIndex = 0
    game70.alphabet = String(describing: game70.title![(game70.title!.startIndex)])
    
    let game71 = Game(context: context)
    game71.category = gameCategoryArray[3]
    game71.title = "War"
    game71.url = "https://www.wikihow.com/Play-War-(Card-Game)"
    game71.favorite = false
    game71.order = 71
    game71.random = Int64(arc4random_uniform(1000))
    game71.selected = false
    game71.sortingIndex = 0
    game71.alphabet = String(describing: game71.title![(game71.title!.startIndex)])
    
    let game72 = Game(context: context)
    game72.category = gameCategoryArray[3]
    game72.title = "Go-Fish"
    game72.url = "https://www.wikihow.com/Play-Go-Fish-with-Any-Cards"
    game72.favorite = false
    game72.order = 72
    game72.random = Int64(arc4random_uniform(1000))
    game72.selected = false
    game72.sortingIndex = 0
    game72.alphabet = String(describing: game72.title![(game72.title!.startIndex)])
    
    let game73 = Game(context: context)
    game73.category = gameCategoryArray[3]
    game73.title = "Hearts"
    game73.url = "https://www.wikihow.com/Play-Hearts"
    game73.favorite = false
    game73.order = 73
    game73.random = Int64(arc4random_uniform(1000))
    game73.selected = false
    game73.sortingIndex = 0
    game73.alphabet = String(describing: game73.title![(game73.title!.startIndex)])
    
    let game74 = Game(context: context)
    game74.category = gameCategoryArray[3]
    game74.title = "Spades"
    game74.url = "https://www.wikihow.com/Play-Spades"
    game74.favorite = true
    game74.order = 74
    game74.random = Int64(arc4random_uniform(1000))
    game74.selected = false
    game74.sortingIndex = 0
    game74.alphabet = String(describing: game74.title![(game74.title!.startIndex)])
    
    let game75 = Game(context: context)
    game75.category = gameCategoryArray[3]
    game75.title = "Five-Card Draw"
    game75.url = "https://drive.google.com/open?id=1hV7xkGPC8slw6dlWRNlHqbLznyxm9W4q"
    game75.favorite = true
    game75.order = 75
    game75.random = Int64(arc4random_uniform(1000))
    game75.selected = false
    game75.sortingIndex = 0
    game75.alphabet = String(describing: game75.title![(game75.title!.startIndex)])
    
    let game76 = Game(context: context)
    game76.category = gameCategoryArray[3]
    game76.title = "21 - Blackjack"
    game76.url = "https://www.wikihow.com/Play-Blackjack"
    game76.favorite = true
    game76.order = 76
    game76.random = Int64(arc4random_uniform(1000))
    game76.selected = false
    game76.sortingIndex = 0
    game76.alphabet = String(describing: game76.title![(game76.title!.startIndex)])
    
    let game77 = Game(context: context)
    game77.category = gameCategoryArray[3]
    game77.title = "Texas hold'em"
    game77.url = "https://www.wikihow.com/Shuffle-and-Deal-Texas-Holdem"
    game77.favorite = true
    game77.order = 77
    game77.random = Int64(arc4random_uniform(1000))
    game77.selected = false
    game77.sortingIndex = 0
    game77.alphabet = String(describing: game77.title![(game77.title!.startIndex)])
    
    let game78 = Game(context: context)
    game78.category = gameCategoryArray[2]
    game78.title = "Snakes and Ladders"
    game78.url = "http://amzn.to/2ejq9rD"
    game78.favorite = true
    game78.order = 78
    game78.random = Int64(arc4random_uniform(1000))
    game78.selected = false
    game78.sortingIndex = 0
    game78.alphabet = String(describing: game78.title![(game78.title!.startIndex)])
    
    let game79 = Game(context: context)
    game79.category = gameCategoryArray[2]
    game79.title = "Candyland"
    game79.url = "http://amzn.to/2ejmEBs"
    game79.favorite = true
    game79.order = 79
    game79.random = Int64(arc4random_uniform(1000))
    game79.selected = false
    game79.sortingIndex = 0
    game79.alphabet = String(describing: game79.title![(game79.title!.startIndex)])
    
    let game80 = Game(context: context)
    game80.category = gameCategoryArray[2]
    game80.title = "Yahtzee!"
    game80.url = "http://amzn.to/2e7cXGT"
    game80.favorite = true
    game80.order = 80
    game80.random = Int64(arc4random_uniform(1000))
    game80.selected = false
    game80.sortingIndex = 0
    game80.alphabet = String(describing: game80.title![(game80.title!.startIndex)])
    
    let game81 = Game(context: context)
    game81.category = gameCategoryArray[3]
    game81.title = "Uno"
    game81.url = "http://amzn.to/2e8QQlS"
    game81.favorite = true
    game81.order = 81
    game81.random = Int64(arc4random_uniform(1000))
    game81.selected = false
    game81.sortingIndex = 0
    game81.alphabet = String(describing: game81.title![(game81.title!.startIndex)])
    
    let game82 = Game(context: context)
    game82.category = gameCategoryArray[2]
    game82.title = "Sorry!"
    game82.url = "http://amzn.to/2euN2r4"
    game82.favorite = false
    game82.order = 82
    game82.random = Int64(arc4random_uniform(1000))
    game82.selected = false
    game82.sortingIndex = 0
    game82.alphabet = String(describing: game82.title![(game82.title!.startIndex)])
    
    let game83 = Game(context: context)
    game83.category = gameCategoryArray[2]
    game83.title = "Pictionary"
    game83.url = "http://amzn.to/2etoKfL"
    game83.favorite = false
    game83.order = 83
    game83.random = Int64(arc4random_uniform(1000))
    game83.selected = false
    game83.sortingIndex = 0
    game83.alphabet = String(describing: game83.title![(game83.title!.startIndex)])
    
    let game84 = Game(context: context)
    game84.category = gameCategoryArray[2]
    game84.title = "Dominoes"
    game84.url = "http://amzn.to/2emDz5n"
    game84.favorite = false
    game84.order = 84
    game84.random = Int64(arc4random_uniform(1000))
    game84.selected = false
    game84.sortingIndex = 0
    game84.alphabet = String(describing: game84.title![(game84.title!.startIndex)])
    
    let game85 = Game(context: context)
    game85.category = gameCategoryArray[2]
    game85.title = "The Game of Life"
    game85.url = "http://amzn.to/2dP9U3a"
    game85.favorite = false
    game85.order = 85
    game85.random = Int64(arc4random_uniform(1000))
    game85.selected = false
    game85.sortingIndex = 0
    game85.alphabet = String(describing: game85.title![(game85.title!.startIndex)])
    
    let game86 = Game(context: context)
    game86.category = gameCategoryArray[2]
    game86.title = "Trivial Pursuit"
    game86.url = "http://amzn.to/2eSFkKa"
    game86.favorite = false
    game86.order = 86
    game86.random = Int64(arc4random_uniform(1000))
    game86.selected = false
    game86.sortingIndex = 0
    game86.alphabet = String(describing: game86.title![(game86.title!.startIndex)])
    
    let game87 = Game(context: context)
    game87.category = gameCategoryArray[2]
    game87.title = "Taboo"
    game87.url = "http://amzn.to/2e92vRI"
    game87.favorite = false
    game87.order = 87
    game87.random = Int64(arc4random_uniform(1000))
    game87.selected = false
    game87.sortingIndex = 0
    game87.alphabet = String(describing: game87.title![(game87.title!.startIndex)])
    
    let game88 = Game(context: context)
    game88.category = gameCategoryArray[2]
    game88.title = "Ticket to Ride"
    game88.url = "http://amzn.to/2e2hE3F"
    game88.favorite = false
    game88.order = 88
    game88.random = Int64(arc4random_uniform(1000))
    game88.selected = false
    game88.sortingIndex = 0
    game88.alphabet = String(describing: game88.title![(game88.title!.startIndex)])
    
    let game89 = Game(context: context)
    game89.category = gameCategoryArray[2]
    game89.title = "Canasta"
    game89.url = "http://amzn.to/2ev2Nyh"
    game89.favorite = false
    game89.order = 89
    game89.random = Int64(arc4random_uniform(1000))
    game89.selected = false
    game89.sortingIndex = 0
    game89.alphabet = String(describing: game89.title![(game89.title!.startIndex)])
    
    let game90 = Game(context: context)
    game90.category = gameCategoryArray[2]
    game90.title = "Clue"
    game90.url = "http://amzn.to/2ev2kfs"
    game90.favorite = false
    game90.order = 90
    game90.random = Int64(arc4random_uniform(1000))
    game90.selected = false
    game90.sortingIndex = 0
    game90.alphabet = String(describing: game90.title![(game90.title!.startIndex)])
    
    let game91 = Game(context: context)
    game91.category = gameCategoryArray[2]
    game91.title = "Scrabble"
    game91.url = "http://amzn.to/2etEAab"
    game91.favorite = false
    game91.order = 91
    game91.random = Int64(arc4random_uniform(1000))
    game91.selected = false
    game91.sortingIndex = 0
    game91.alphabet = String(describing: game91.title![(game91.title!.startIndex)])
    
    let game92 = Game(context: context)
    game92.category = gameCategoryArray[2]
    game92.title = "Apples to Apples"
    game92.url = "http://amzn.to/2ev21B4"
    game92.favorite = false
    game92.order = 92
    game92.random = Int64(arc4random_uniform(1000))
    game92.selected = false
    game92.sortingIndex = 0
    game92.alphabet = String(describing: game92.title![(game92.title!.startIndex)])
    
    let game93 = Game(context: context)
    game93.category = gameCategoryArray[2]
    game93.title = "Settlers of Cataan"
    game93.url = "http://amzn.to/2etFPWW"
    game93.favorite = false
    game93.order = 93
    game93.random = Int64(arc4random_uniform(1000))
    game93.selected = false
    game93.sortingIndex = 0
    game93.alphabet = String(describing: game93.title![(game93.title!.startIndex)])
    
    let game94 = Game(context: context)
    game94.category = gameCategoryArray[2]
    game94.title = "Risk"
    game94.url = "http://amzn.to/2e96Lkc"
    game94.favorite = false
    game94.order = 94
    game94.random = Int64(arc4random_uniform(1000))
    game94.selected = false
    game94.sortingIndex = 0
    game94.alphabet = String(describing: game94.title![(game94.title!.startIndex)])
    
    let game95 = Game(context: context)
    game95.category = gameCategoryArray[3]
    game95.title = "Bridge"
    game95.url = "https://www.wikihow.com/Play-Bridge"
    game95.favorite = false
    game95.order = 95
    game95.random = Int64(arc4random_uniform(1000))
    game95.selected = false
    game95.sortingIndex = 0
    game95.alphabet = String(describing: game95.title![(game95.title!.startIndex)])
    
    let game96 = Game(context: context)
    game96.category = gameCategoryArray[1]
    game96.title = "Mafia"
    game96.url = "https://www.wikihow.com/Play-Mafia"
    game96.favorite = false
    game96.order = 96
    game96.random = Int64(arc4random_uniform(1000))
    game96.selected = false
    game96.sortingIndex = 0
    game96.alphabet = String(describing: game96.title![(game96.title!.startIndex)])
    
    let game97 = Game(context: context)
    game97.category = gameCategoryArray[2]
    game97.title = "Monopoly"
    game97.url = "http://amzn.to/2eSRov7"
    game97.favorite = false
    game97.order = 97
    game97.random = Int64(arc4random_uniform(1000))
    game97.selected = false
    game97.sortingIndex = 0
    game97.alphabet = String(describing: game97.title![(game97.title!.startIndex)])
    
    let game98 = Game(context: context)
    game98.category = gameCategoryArray[3]
    game98.title = "Farkle"
    game98.url = "https://www.wikihow.com/Play-Farkle"
    game98.favorite = true
    game98.order = 98
    game98.random = Int64(arc4random_uniform(1000))
    game98.selected = false
    game98.sortingIndex = 0
    game98.alphabet = String(describing: game98.title![(game98.title!.startIndex)])
    
    let game99 = Game(context: context)
    game99.category = gameCategoryArray[3]
    game99.title = "Phase 10"
    game99.url = "https://www.amazon.com/Phase-Card-Game-Styles-Vary/dp/B004MU9V8Q/ref=sr_1_2?s=toys-and-games&ie=UTF8&qid=1512765083&sr=1-2&keywords=phase+10"
    game99.favorite = false
    game99.order = 99
    game99.random = Int64(arc4random_uniform(1000))
    game99.selected = false
    game99.sortingIndex = 0
    game99.alphabet = String(describing: game99.title![(game99.title!.startIndex)])
    
    let game100 = Game(context: context)
    game100.category = gameCategoryArray[3]
    game100.title = "Skip-Bo"
    game100.url = "https://www.amazon.com/Mattel-42050-SKIP-Card-Game/dp/B0000205XI/ref=sr_1_4?s=toys-and-games&ie=UTF8&qid=1512765192&sr=1-4&keywords=skip+bo"
    game100.favorite = false
    game100.order = 100
    game100.random = Int64(arc4random_uniform(1000))
    game100.selected = false
    game100.sortingIndex = 0
    game100.alphabet = String(describing: game100.title![(game100.title!.startIndex)])
    
    let game101 = Game(context: context)
    game101.category = gameCategoryArray[6]
    game101.title = "Family Exercise"
    game101.url = "https://www.wikihow.com/Exercise-Together-As-a-Family"
    game101.favorite = false
    game101.order = 101
    game101.random = Int64(arc4random_uniform(1000))
    game101.selected = false
    game101.sortingIndex = 0
    game101.alphabet = String(describing: game101.title![(game101.title!.startIndex)])
    
    let game102 = Game(context: context)
    game102.category = gameCategoryArray[10]
    game102.title = "Meditation"
    game102.url = "https://www.wikihow.com/Meditate-for-Beginners"
    game102.favorite = true
    game102.order = 102
    game102.random = Int64(arc4random_uniform(1000))
    game102.selected = false
    game102.sortingIndex = 0
    game102.alphabet = String(describing: game102.title![(game102.title!.startIndex)])
    
    let game103 = Game(context: context)
    game103.category = gameCategoryArray[10]
    game103.title = "Yoga"
    game103.url = "https://www.wikihow.com/Do-Yoga-for-Absolute-Beginners"
    game103.favorite = true
    game103.order = 103
    game103.random = Int64(arc4random_uniform(1000))
    game103.selected = false
    game103.sortingIndex = 0
    game103.alphabet = String(describing: game103.title![(game103.title!.startIndex)])
    
    let game104 = Game(context: context)
    game104.category = gameCategoryArray[9]
    game104.title = "Make Christmas Ornaments"
    game104.url = "https://www.wikihow.com/Make-a-Christmas-Tree-Ornament"
    game104.favorite = false
    game104.order = 104
    game104.random = Int64(arc4random_uniform(1000))
    game104.selected = false
    game104.sortingIndex = 0
    game104.alphabet = String(describing: game104.title![(game104.title!.startIndex)])
    
    let game105 = Game(context: context)
    game105.category = gameCategoryArray[7]
    game105.title = "Service Project"
    game105.url = "https://www.justserve.org/"
    game105.favorite = false
    game105.order = 105
    game105.random = Int64(arc4random_uniform(1000))
    game105.selected = false
    game105.sortingIndex = 0
    game105.alphabet = String(describing: game105.title![(game105.title!.startIndex)])
    
    let game106 = Game(context: context)
    game106.category = gameCategoryArray[6]
    game106.title = "Fishing"
    game106.url = "https://www.wikihow.com/Fish"
    game106.favorite = false
    game106.order = 106
    game106.random = Int64(arc4random_uniform(1000))
    game106.selected = false
    game106.sortingIndex = 0
    game106.alphabet = String(describing: game106.title![(game106.title!.startIndex)])
    
    let game107 = Game(context: context)
    game107.category = gameCategoryArray[0]
    game107.title = "Take Photographs"
    game107.url = "https://www.wikihow.com/Take-Better-Photographs"
    game107.favorite = false
    game107.order = 107
    game107.random = Int64(arc4random_uniform(1000))
    game107.selected = false
    game107.sortingIndex = 0
    game107.alphabet = String(describing: game107.title![(game107.title!.startIndex)])
    
    let game108 = Game(context: context)
    game108.category = gameCategoryArray[1]
    game108.title = "Role-Playing / Dress-Up"
    game108.url = "https://www.wikihow.com/Roleplay"
    game108.favorite = false
    game108.order = 108
    game108.random = Int64(arc4random_uniform(1000))
    game108.selected = false
    game108.sortingIndex = 0
    game108.alphabet = String(describing: game108.title![(game108.title!.startIndex)])
    
    let game109 = Game(context: context)
    game109.category = gameCategoryArray[2]
    game109.title = "Chess / Checkers"
    game109.url = "https://www.wikihow.com/Play-Chess"
    game109.favorite = false
    game109.order = 109
    game109.random = Int64(arc4random_uniform(1000))
    game109.selected = false
    game109.sortingIndex = 0
    game109.alphabet = String(describing: game109.title![(game109.title!.startIndex)])
    
    let game110 = Game(context: context)
    game110.category = gameCategoryArray[1]
    game110.title = "Charades"
    game110.url = "https://www.wikihow.com/Play-Charades"
    game110.favorite = true
    game110.order = 110
    game110.random = Int64(arc4random_uniform(1000))
    game110.selected = false
    game110.sortingIndex = 0
    game110.alphabet = String(describing: game110.title![(game110.title!.startIndex)])
    
    let game111 = Game(context: context)
    game111.category = gameCategoryArray[1]
    game111.title = "Murder Mystery"
    game111.url = "https://www.wikihow.com/Host-a-Murder-Mystery-Party"
    game111.favorite = false
    game111.order = 111
    game111.random = Int64(arc4random_uniform(1000))
    game111.selected = false
    game111.sortingIndex = 0
    game111.alphabet = String(describing: game111.title![(game111.title!.startIndex)])
    
    let game112 = Game(context: context)
    game112.category = gameCategoryArray[7]
    game112.title = "Car Wash"
    game112.url = "https://www.wikihow.com/Wash-a-Car-by-Hand"
    game112.favorite = false
    game112.order = 112
    game112.random = Int64(arc4random_uniform(1000))
    game112.selected = false
    game112.sortingIndex = 0
    game112.alphabet = String(describing: game112.title![(game112.title!.startIndex)])
    
    let game113 = Game(context: context)
    game113.category = gameCategoryArray[1]
    game113.title = "Movie Night"
    game113.url = "https://www.rottentomatoes.com/"
    game113.favorite = false
    game113.order = 113
    game113.random = Int64(arc4random_uniform(1000))
    game113.selected = false
    game113.sortingIndex = 0
    game113.alphabet = String(describing: game113.title![(game113.title!.startIndex)])
    
    let game114 = Game(context: context)
    game114.category = gameCategoryArray[6]
    game114.title = "Golf / Miniature Golf"
    game114.url = "https://www.wikihow.com/Learn-to-Play-Golf"
    game114.favorite = false
    game114.order = 114
    game114.random = Int64(arc4random_uniform(1000))
    game114.selected = false
    game114.sortingIndex = 0
    game114.alphabet = String(describing: game114.title![(game114.title!.startIndex)])
    
    let game115 = Game(context: context)
    game115.category = gameCategoryArray[5]
    game115.title = "Shopping"
    game115.url = "https://www.wikihow.com/Grocery-Shop-With-Kids"
    game115.favorite = false
    game115.order = 115
    game115.random = Int64(arc4random_uniform(1000))
    game115.selected = false
    game115.sortingIndex = 0
    game115.alphabet = String(describing: game115.title![(game115.title!.startIndex)])
    
    let game116 = Game(context: context)
    game116.category = gameCategoryArray[1]
    game116.title = "Puzzle"
    game116.url = "https://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=puzzles"
    game116.favorite = false
    game116.order = 116
    game116.random = Int64(arc4random_uniform(1000))
    game116.selected = false
    game116.sortingIndex = 0
    game116.alphabet = String(describing: game116.title![(game116.title!.startIndex)])
    
    let game117 = Game(context: context)
    game117.category = gameCategoryArray[10]
    game117.title = "Stretch"
    game117.url = "https://www.wikihow.com/Stretch"
    game117.favorite = false
    game117.order = 117
    game117.random = Int64(arc4random_uniform(1000))
    game117.selected = false
    game117.sortingIndex = 0
    game117.alphabet = String(describing: game117.title![(game117.title!.startIndex)])
    
    let game118 = Game(context: context)
    game118.category = gameCategoryArray[0]
    game118.title = "Trust Fall"
    game118.url = "https://en.wikipedia.org/wiki/Trust_fall"
    game118.favorite = true
    game118.order = 118
    game118.random = Int64(arc4random_uniform(1000))
    game118.selected = false
    game118.sortingIndex = 0
    game118.alphabet = String(describing: game117.title![(game117.title!.startIndex)])

    
    ad.saveContext()
}
