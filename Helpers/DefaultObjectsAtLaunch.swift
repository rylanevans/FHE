//
//  DefaultObjectsAtLaunch.swift
//  FHE
//
//  Created by Rylan Evans on 11/15/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func checkIfLauncedBefore() {
    let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
    
    if launchedBefore == true {
        print("Not first launch.")
        addToTickToCounter()
        getTasks()
        getAttendingMembers()
    } else {
        print("First launch, setting UserDefault.")
        beginTickCounter()
        generateFamilyMembers()
        generateTasks()
        generateSongs()
        UserDefaults.standard.set(true, forKey: "launchedBefore")
    }
}

func addToTickToCounter() {
    let fetchRequest: NSFetchRequest<Counter> = Counter.fetchRequest()
    
    do {
        counterArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
    
    if counter.launched > 0 {
        counter.launched += 1
        ad.saveContext()
    }
}

func beginTickCounter(){
    let counter = Counter(context: context)
    counter.launched = 1
    ad.saveContext()
    
    let fetchRequest: NSFetchRequest<Counter> = Counter.fetchRequest()
    
    do {
        counterArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func generateFamilyMembers() {
    let memberAuto = Member(context: context)
    memberAuto.name = "Auto-Assign"
    memberAuto.age = 0
    memberAuto.attending = true
    memberAuto.order = 0
    memberAuto.photo = #imageLiteral(resourceName: "Missing Profile") as UIImage
    memberAuto.random = Int64(arc4random_uniform(100))
    
    let memberDad = Member(context: context)
    memberDad.name = "Dad"
    memberDad.age = 38
    memberDad.attending = true
    memberDad.order = 1
    memberDad.photo = #imageLiteral(resourceName: "Dad") as UIImage
    memberDad.random = Int64(arc4random_uniform(100))
    
    let memberMom = Member(context: context)
    memberMom.name = "Mom"
    memberMom.age = 36
    memberMom.attending = true
    memberMom.order = 2
    memberMom.photo = #imageLiteral(resourceName: "Mom") as UIImage
    memberMom.random = Int64(arc4random_uniform(100))
    
    let memberLilly = Member(context: context)
    memberLilly.name = "Lilly"
    memberLilly.age = 12
    memberLilly.attending = true
    memberLilly.order = 3
    memberLilly.photo = #imageLiteral(resourceName: "Lilly") as UIImage
    memberLilly.random = Int64(arc4random_uniform(100))
    
    let memberAnisten = Member(context: context)
    memberAnisten.name = "Anisten"
    memberAnisten.age = 10
    memberAnisten.attending = true
    memberAnisten.order = 4
    memberAnisten.photo = #imageLiteral(resourceName: "Anisten") as UIImage
    memberAnisten.random = Int64(arc4random_uniform(100))
    
    let memberReed = Member(context: context)
    memberReed.name = "Reed"
    memberReed.age = 8
    memberReed.attending = true
    memberReed.order = 5
    memberReed.photo = #imageLiteral(resourceName: "Reed") as UIImage
    memberReed.random = Int64(arc4random_uniform(100))
    
    let memberClaire = Member(context: context)
    memberClaire.name = "Claire"
    memberClaire.age = 5
    memberClaire.attending = true
    memberClaire.order = 6
    memberClaire.photo = #imageLiteral(resourceName: "Claire") as UIImage
    memberClaire.random = Int64(arc4random_uniform(100))
    
    let memberPapa = Member(context: context)
    memberPapa.name = "Papa"
    memberPapa.age = 60
    memberPapa.attending = false
    memberPapa.order = 7
    memberPapa.photo = #imageLiteral(resourceName: "Papa") as UIImage
    memberPapa.random = Int64(arc4random_uniform(100))
    
    let memberGrammy = Member(context: context)
    memberGrammy.name = "Grammy"
    memberGrammy.age = 55
    memberGrammy.attending = false
    memberGrammy.order = 8
    memberGrammy.photo = #imageLiteral(resourceName: "Grammy") as UIImage
    memberGrammy.random = Int64(arc4random_uniform(100))
    
    let memberGuest = Member(context: context)
    memberGuest.name = "Guest"
    memberGuest.age = 100
    memberGuest.attending = false
    memberGuest.order = 9
    memberGuest.photo = #imageLiteral(resourceName: "Missing Profile") as UIImage
    memberGuest.random = Int64(arc4random_uniform(100))
    
    ad.saveContext()
}

func generateTasks() {
    getAttendingMembers()
    let taskOpenPrayer = Task(context: context)
    taskOpenPrayer.assigned = false
    let assigneetaskOpenPrayer = membersArray[0]
    taskOpenPrayer.assignment = assigneetaskOpenPrayer
    taskOpenPrayer.defaultNumber = 1
    taskOpenPrayer.enabled = true
    taskOpenPrayer.name = "Opening Prayer"
    taskOpenPrayer.order = Int64(arc4random_uniform(100))
    taskOpenPrayer.segment = 1
    taskOpenPrayer.image = #imageLiteral(resourceName: "Prayer")
    
    let taskSongs = Task(context: context)
    taskSongs.assigned = false
    let assigneetaskSongs = membersArray[1]
    taskSongs.assignment = assigneetaskSongs
    taskSongs.defaultNumber = 2
    taskSongs.enabled = true
    taskSongs.name = "Song"
    taskSongs.order = Int64(arc4random_uniform(100))
    taskSongs.segment = 1
    taskSongs.image = #imageLiteral(resourceName: "Song")
    
    let taskRule = Task(context: context)
    taskRule.assigned = false
    let assigneetaskRule = membersArray[0]
    taskRule.assignment = assigneetaskRule
    taskRule.defaultNumber = 3
    taskRule.enabled = false
    taskRule.name = "Rule"
    taskRule.order = Int64(arc4random_uniform(100))
    taskRule.segment = 1
    taskRule.image = #imageLiteral(resourceName: "Rule")
    
    let taskScripture = Task(context: context)
    taskScripture.assigned = false
    let assigneetaskScripture = membersArray[2]
    taskScripture.assignment = assigneetaskScripture
    taskScripture.defaultNumber = 4
    taskScripture.enabled = true
    taskScripture.name = "Scripture"
    taskScripture.order = Int64(arc4random_uniform(100))
    taskScripture.segment = 1
    taskScripture.image = #imageLiteral(resourceName: "Scripture")
    
    let taskCalendar = Task(context: context)
    taskCalendar.assigned = false
    let assigneetaskCalendar = membersArray[0]
    taskCalendar.assignment = assigneetaskCalendar
    taskCalendar.defaultNumber = 5
    taskCalendar.enabled = false
    taskCalendar.name = "Calendar"
    taskCalendar.order = Int64(arc4random_uniform(100))
    taskCalendar.segment = 1
    taskCalendar.image = #imageLiteral(resourceName: "Calendar")
    
    let taskTestimony = Task(context: context)
    taskTestimony.assigned = false
    let assigneetaskTestimony = membersArray[0]
    taskTestimony.assignment = assigneetaskTestimony
    taskTestimony.defaultNumber = 6
    taskTestimony.enabled = false
    taskTestimony.name = "Testimony"
    taskTestimony.order = Int64(arc4random_uniform(100))
    taskTestimony.segment = 1
    taskTestimony.image = #imageLiteral(resourceName: "Testimony")
    
    let taskSpotlight = Task(context: context)
    taskSpotlight.assigned = false
    let assigneetaskSpotlight = membersArray[0]
    taskSpotlight.assignment = assigneetaskSpotlight
    taskSpotlight.defaultNumber = 7
    taskSpotlight.enabled = false
    taskSpotlight.name = "Spotlight"
    taskSpotlight.order = Int64(arc4random_uniform(100))
    taskSpotlight.segment = 1
    taskSpotlight.image = #imageLiteral(resourceName: "Spotlight")
    
    let taskMisc = Task(context: context)
    taskMisc.assigned = false
    let assigneetaskMisc = membersArray[0]
    taskMisc.assignment = assigneetaskMisc
    taskMisc.defaultNumber = 8
    taskMisc.enabled = false
    taskMisc.name = "Misc"
    taskMisc.order = Int64(arc4random_uniform(100))
    taskMisc.segment = 1
    taskMisc.image = #imageLiteral(resourceName: "Misc")
    
    let taskThought = Task(context: context)
    taskThought.assigned = false
    let assigneetaskThought = membersArray[0]
    taskThought.assignment = assigneetaskThought
    taskThought.defaultNumber = 9
    taskThought.enabled = false
    taskThought.name = "Thought"
    taskThought.order = Int64(arc4random_uniform(100))
    taskThought.segment = 1
    taskThought.image = #imageLiteral(resourceName: "Thought")
    
    let taskLesson = Task(context: context)
    taskLesson.assigned = false
    let assigneetaskLesson = membersArray[3]
    taskLesson.assignment = assigneetaskLesson
    taskLesson.defaultNumber = 10
    taskLesson.enabled = true
    taskLesson.name = "Lesson"
    taskLesson.order = Int64(arc4random_uniform(100))
    taskLesson.segment = 1
    taskLesson.image = #imageLiteral(resourceName: "Lesson")
    
    let taskCouncil = Task(context: context)
    taskCouncil.assigned = false
    let assigneetaskCouncil = membersArray[0]
    taskCouncil.assignment = assigneetaskCouncil
    taskCouncil.defaultNumber = 11
    taskCouncil.enabled = false
    taskCouncil.name = "Council"
    taskCouncil.order = Int64(arc4random_uniform(100))
    taskCouncil.segment = 1
    taskCouncil.image = #imageLiteral(resourceName: "Council")
    
    let taskGame = Task(context: context)
    taskGame.assigned = false
    let assigneetaskGame = membersArray[4]
    taskGame.assignment = assigneetaskGame
    taskGame.defaultNumber = 12
    taskGame.enabled = true
    taskGame.name = "Activity"
    taskGame.order = Int64(arc4random_uniform(100))
    taskGame.segment = 1
    taskGame.image = #imageLiteral(resourceName: "Game")
    
    let taskClosePrayer = Task(context: context)
    taskClosePrayer.assigned = false
    let assigneetaskClosePrayer = membersArray[5]
    taskClosePrayer.assignment = assigneetaskClosePrayer
    taskClosePrayer.defaultNumber = 13
    taskClosePrayer.enabled = true
    taskClosePrayer.name = "Closing Prayer"
    taskClosePrayer.order = Int64(arc4random_uniform(100))
    taskClosePrayer.segment = 1
    taskClosePrayer.image = #imageLiteral(resourceName: "Prayer")
    
    let taskTreat = Task(context: context)
    taskTreat.assigned = false
    let assigneetaskTreat = membersArray[0]
    taskTreat.assignment = assigneetaskTreat
    taskTreat.defaultNumber = 14
    taskTreat.enabled = true
    taskTreat.name = "Treat"
    taskTreat.order = Int64(arc4random_uniform(100))
    taskTreat.segment = 1
    taskTreat.image = #imageLiteral(resourceName: "Treat")
    
    ad.saveContext()
}

func generatePray() {
    getTasks()
    let prayer = Prayer(context: context)
    prayer.title = "Steps To Prayer"
    prayer.detail = "1. Address Heavenly Father/n2. Share Gratitude/n3. Ask for needs/n4. Close in Jesus Christ's name"
    prayer.selected = true
    let selectedPrayer = tasksArray[0]
    prayer.selectedOne = selectedPrayer
}

func generateSongs() {
    getTasks()
    let song1 = Song(context: context)
    song1.order = 1
    song1.random = Int64(arc4random_uniform(100))
    song1.book = songBooksArray[1]
    song1.number = 2
    song1.url = "https://www.lds.org/music/library/hymns/the-spirit-of-god?lang=eng"
    song1.title = "The Spirit of God"
    song1.topic = "Holy Ghost"
    song1.selected = false
    song1.favorite = false
    song1.sortingIndex = 0
    
    let song2 = Song(context: context)
    song2.order = 2
    song2.random = Int64(arc4random_uniform(1000))
    song2.book = songBooksArray[1]
    song2.number = 19
    song2.url = "https://www.lds.org/music/library/hymns/we-thank-thee-o-god-for-a-prophet?lang=eng"
    song2.title = "We Thank Thee, O God, for a Prophet"
    song2.topic = "Restoration"
    song2.selected = false
    song2.favorite = false
    song2.sortingIndex = 0
    
    let song3 = Song(context: context)
    song3.order = 3
    song3.random = Int64(arc4random_uniform(1000))
    song3.book = songBooksArray[1]
    song3.number = 27
    song3.url = "https://www.lds.org/music/library/hymns/praise-to-the-man?lang=eng"
    song3.title = "Praise to the Man"
    song3.topic = "Restoration"
    song3.selected = false
    song3.favorite = false
    song3.sortingIndex = 0
    
    let song4 = Song(context: context)
    song4.order = 4
    song4.random = Int64(arc4random_uniform(1000))
    song4.book = songBooksArray[1]
    song4.number = 29
    song4.url = "https://www.lds.org/music/library/hymns/a-poor-wayfaring-man-of-grief?lang=eng"
    song4.title = "A Poor Wayfaring Man of Grief"
    song4.topic = "Care for the Poor & Needy"
    song4.selected = false
    song4.favorite = false
    song4.sortingIndex = 0
    
    let song5 = Song(context: context)
    song5.order = 5
    song5.random = Int64(arc4random_uniform(1000))
    song5.book = songBooksArray[1]
    song5.number = 85
    song5.url = "https://www.lds.org/music/library/hymns/how-firm-a-foundation?lang=eng"
    song5.title = "How Firm a Foundation"
    song5.topic = "Atonement"
    song5.selected = false
    song5.favorite = false
    song5.sortingIndex = 0
    
    let song6 = Song(context: context)
    song6.order = 6
    song6.random = Int64(arc4random_uniform(1000))
    song6.book = songBooksArray[1]
    song6.number = 89
    song6.url = "https://www.lds.org/music/library/hymns/the-lord-is-my-light?lang=eng"
    song6.title = "The Lord Is My Light"
    song6.topic = "Jesus Christ"
    song6.selected = false
    song6.favorite = false
    song6.sortingIndex = 0
    
    let song7 = Song(context: context)
    song7.order = 7
    song7.random = Int64(arc4random_uniform(1000))
    song7.book = songBooksArray[1]
    song7.number = 92
    song7.url = "https://www.lds.org/music/library/hymns/for-the-beauty-of-the-earth?lang=eng"
    song7.title = "For the Beauty of the Earth"
    song7.topic = "Plan of Salvation"
    song7.selected = false
    song7.favorite = false
    song7.sortingIndex = 0
    
    let song8 = Song(context: context)
    song8.order = 8
    song8.random = Int64(arc4random_uniform(1000))
    song8.book = songBooksArray[1]
    song8.number = 98
    song8.url = "https://www.lds.org/music/library/hymns/i-need-thee-every-hour?lang=eng"
    song8.title = "I Need Thee Every Hour"
    song8.topic = "Jesus Christ"
    song8.selected = false
    song8.favorite = true
    song8.sortingIndex = 0
    
    let song9 = Song(context: context)
    song9.order = 9
    song9.random = Int64(arc4random_uniform(1000))
    song9.book = songBooksArray[1]
    song9.number = 100
    song9.url = "https://www.lds.org/music/library/hymns/nearer-my-god-to-thee?lang=eng"
    song9.title = "Nearer, My God, to Thee"
    song9.topic = "Heavenly Father"
    song9.selected = false
    song9.favorite = true
    song9.sortingIndex = 0
    
    let song10 = Song(context: context)
    song10.order = 10
    song10.random = Int64(arc4random_uniform(1000))
    song10.book = songBooksArray[1]
    song10.number = 103
    song10.url = "https://www.lds.org/music/library/hymns/precious-savior-dear-redeemer?lang=eng"
    song10.title = "Precious Savior, Dear Redeemer"
    song10.topic = "Jesus Christ"
    song10.selected = false
    song10.favorite = false
    song10.sortingIndex = 0
    
    let song11 = Song(context: context)
    song11.order = 11
    song11.random = Int64(arc4random_uniform(1000))
    song11.book = songBooksArray[1]
    song11.number = 106
    song11.url = "https://www.lds.org/music/library/hymns/god-speed-the-right?lang=eng"
    song11.title = "God Speed the Right"
    song11.topic = "Heavenly Father"
    song11.selected = false
    song11.favorite = false
    song11.sortingIndex = 0
    
    let song12 = Song(context: context)
    song12.order = 12
    song12.random = Int64(arc4random_uniform(1000))
    song12.book = songBooksArray[1]
    song12.number = 108
    song12.url = "https://www.lds.org/music/library/hymns/the-lord-is-my-shepherd?lang=eng"
    song12.title = "The Lord Is My Shepherd"
    song12.topic = "Jesus Christ"
    song12.selected = false
    song12.favorite = false
    song12.sortingIndex = 0
    
    let song13 = Song(context: context)
    song13.order = 13
    song13.random = Int64(arc4random_uniform(1000))
    song13.book = songBooksArray[1]
    song13.number = 113
    song13.url = "https://www.lds.org/music/library/hymns/our-saviors-love?lang=eng"
    song13.title = "Our Savior’s Love"
    song13.topic = "Christlike Attributes"
    song13.selected = false
    song13.favorite = false
    song13.sortingIndex = 0
    
    let song14 = Song(context: context)
    song14.order = 14
    song14.random = Int64(arc4random_uniform(1000))
    song14.book = songBooksArray[1]
    song14.number = 116
    song14.url = "https://www.lds.org/music/library/hymns/come-follow-me?lang=eng"
    song14.title = "Come, Follow Me"
    song14.topic = "Commandments"
    song14.selected = false
    song14.favorite = false
    song14.sortingIndex = 0
    
    let song15 = Song(context: context)
    song15.order = 15
    song15.random = Int64(arc4random_uniform(1000))
    song15.book = songBooksArray[1]
    song15.number = 130
    song15.url = "https://www.lds.org/music/library/hymns/be-thou-humble?lang=eng"
    song15.title = "Be Thou Humble"
    song15.topic = "Christlike Attributes"
    song15.selected = false
    song15.favorite = false
    song15.sortingIndex = 0
    
    let song16 = Song(context: context)
    song16.order = 16
    song16.random = Int64(arc4random_uniform(1000))
    song16.book = songBooksArray[1]
    song16.number = 131
    song16.url = "https://www.lds.org/music/library/hymns/more-holiness-give-me?lang=eng"
    song16.title = "More Holiness Give Me"
    song16.topic = "Christlike Attributes"
    song16.selected = false
    song16.favorite = false
    song16.sortingIndex = 0
    
    let song17 = Song(context: context)
    song17.order = 17
    song17.random = Int64(arc4random_uniform(1000))
    song17.book = songBooksArray[1]
    song17.number = 133
    song17.url = "https://www.lds.org/music/library/hymns/father-in-heaven?lang=eng"
    song17.title = "Father in Heaven"
    song17.topic = "Heavenly Father"
    song17.selected = false
    song17.favorite = false
    song17.sortingIndex = 0
    
    let song18 = Song(context: context)
    song18.order = 18
    song18.random = Int64(arc4random_uniform(1000))
    song18.book = songBooksArray[1]
    song18.number = 134
    song18.url = "https://www.lds.org/music/library/hymns/i-believe-in-christ?lang=eng"
    song18.title = "I Believe in Christ"
    song18.topic = "Jesus Christ"
    song18.selected = false
    song18.favorite = false
    song18.sortingIndex = 0
    
    let song19 = Song(context: context)
    song19.order = 19
    song19.random = Int64(arc4random_uniform(1000))
    song19.book = songBooksArray[1]
    song19.number = 136
    song19.url = "https://www.lds.org/music/library/hymns/i-know-that-my-redeemer-lives?lang=eng"
    song19.title = "I Know That My Redeemer Lives"
    song19.topic = "Jesus Christ"
    song19.selected = false
    song19.favorite = false
    song19.sortingIndex = 0
    
    let song20 = Song(context: context)
    song20.order = 20
    song20.random = Int64(arc4random_uniform(1000))
    song20.book = songBooksArray[1]
    song20.number = 137
    song20.url = "https://www.lds.org/music/library/hymns/testimony?lang=eng"
    song20.title = "Testimony"
    song20.topic = "Christlike Attributes"
    song20.selected = false
    song20.favorite = false
    song20.sortingIndex = 0
    
    let song21 = Song(context: context)
    song21.order = 21
    song21.random = Int64(arc4random_uniform(1000))
    song21.book = songBooksArray[1]
    song21.number = 140
    song21.url = "https://www.lds.org/music/library/hymns/did-you-think-to-pray?lang=eng"
    song21.title = "Did You Think to Pray?"
    song21.topic = "Commandments"
    song21.selected = false
    song21.favorite = false
    song21.sortingIndex = 0
    
    let song22 = Song(context: context)
    song22.order = 22
    song22.random = Int64(arc4random_uniform(1000))
    song22.book = songBooksArray[1]
    song22.number = 142
    song22.url = "https://www.lds.org/music/library/hymns/sweet-hour-of-prayer?lang=eng"
    song22.title = "Sweet Hour of Prayer"
    song22.topic = "Commandments"
    song22.selected = false
    song22.favorite = false
    song22.sortingIndex = 0
    
    let song23 = Song(context: context)
    song23.order = 23
    song23.random = Int64(arc4random_uniform(1000))
    song23.book = songBooksArray[1]
    song23.number = 152
    song23.url = "https://www.lds.org/music/library/hymns/god-be-with-you-till-we-meet-again?lang=eng"
    song23.title = "God Be with You Till We Meet Again"
    song23.topic = "Plan of Salvation"
    song23.selected = false
    song23.favorite = false
    song23.sortingIndex = 0
    
    let song24 = Song(context: context)
    song24.order = 24
    song24.random = Int64(arc4random_uniform(1000))
    song24.book = songBooksArray[1]
    song24.number = 165
    song24.url = "https://www.lds.org/music/library/hymns/abide-with-me-tis-eventide?lang=eng"
    song24.title = "Abide with Me; ’Tis Eventide"
    song24.topic = "Jesus Christ"
    song24.selected = false
    song24.favorite = false
    song24.sortingIndex = 0
    
    let song25 = Song(context: context)
    song25.order = 25
    song25.random = Int64(arc4random_uniform(1000))
    song25.book = songBooksArray[1]
    song25.number = 170
    song25.url = "https://www.lds.org/music/library/hymns/god-our-father-hear-us-pray?lang=eng"
    song25.title = "God, Our Father, Hear Us Pray"
    song25.topic = "Heavenly Father"
    song25.selected = false
    song25.favorite = false
    song25.sortingIndex = 0
    
    let song26 = Song(context: context)
    song26.order = 26
    song26.random = Int64(arc4random_uniform(1000))
    song26.book = songBooksArray[1]
    song26.number = 193
    song26.url = "https://www.lds.org/music/library/hymns/i-stand-all-amazed?lang=eng"
    song26.title = "I Stand All Amazed"
    song26.topic = "Heavenly Father"
    song26.selected = false
    song26.favorite = false
    song26.sortingIndex = 0
    
    let song27 = Song(context: context)
    song27.order = 27
    song27.random = Int64(arc4random_uniform(1000))
    song27.book = songBooksArray[1]
    song27.number = 194
    song27.url = "https://www.lds.org/music/library/hymns/there-is-a-green-hill-far-away?lang=eng"
    song27.title = "There Is a Green Hill Far Away"
    song27.topic = "Atonement"
    song27.selected = false
    song27.favorite = false
    song27.sortingIndex = 0
    
    let song28 = Song(context: context)
    song28.order = 28
    song28.random = Int64(arc4random_uniform(1000))
    song28.book = songBooksArray[1]
    song28.number = 199
    song28.url = "https://www.lds.org/music/library/hymns/he-is-risen?lang=eng"
    song28.title = "He Is Risen!"
    song28.topic = "Resurrection"
    song28.selected = false
    song28.favorite = false
    song28.sortingIndex = 0
    
    let song29 = Song(context: context)
    song29.order = 29
    song29.random = Int64(arc4random_uniform(1000))
    song29.book = songBooksArray[1]
    song29.number = 203
    song29.url = "https://www.lds.org/music/library/hymns/angels-we-have-heard-on-high?lang=eng"
    song29.title = "Angels We Have Heard on High"
    song29.topic = "Birth of our Savior"
    song29.selected = false
    song29.favorite = false
    song29.sortingIndex = 0
    
    let song30 = Song(context: context)
    song30.order = 30
    song30.random = Int64(arc4random_uniform(1000))
    song30.book = songBooksArray[1]
    song30.number = 204
    song30.url = "https://www.lds.org/music/library/hymns/silent-night?lang=eng"
    song30.title = "Silent Night"
    song30.topic = "Birth of our Savior"
    song30.selected = false
    song30.favorite = false
    song30.sortingIndex = 0
    
    let song31 = Song(context: context)
    song31.order = 31
    song31.random = Int64(arc4random_uniform(1000))
    song31.book = songBooksArray[1]
    song31.number = 209
    song31.url = "https://www.lds.org/music/library/hymns/hark-the-herald-angels-sing?lang=eng"
    song31.title = "Hark! The Herald Angels Sing"
    song31.topic = "Birth of our Savior"
    song31.selected = false
    song31.favorite = false
    song31.sortingIndex = 0
    
    let song32 = Song(context: context)
    song32.order = 32
    song32.random = Int64(arc4random_uniform(1000))
    song32.book = songBooksArray[1]
    song32.number = 213
    song32.url = "https://www.lds.org/music/library/hymns/the-first-noel?lang=eng"
    song32.title = "The First Noel"
    song32.topic = "Birth of our Savior"
    song32.selected = false
    song32.favorite = false
    song32.sortingIndex = 0
    
    let song33 = Song(context: context)
    song33.order = 33
    song33.random = Int64(arc4random_uniform(1000))
    song33.book = songBooksArray[1]
    song33.number = 223
    song33.url = "https://www.lds.org/music/library/hymns/have-i-done-any-good?lang=eng"
    song33.title = "Have I Done Any Good?"
    song33.topic = "Care for the Poor & Needy"
    song33.selected = false
    song33.favorite = false
    song33.sortingIndex = 0
    
    let song34 = Song(context: context)
    song34.order = 34
    song34.random = Int64(arc4random_uniform(1000))
    song34.book = songBooksArray[1]
    song34.number = 227
    song34.url = "https://www.lds.org/music/library/hymns/there-is-sunshine-in-my-soul-today?lang=eng"
    song34.title = "There Is Sunshine in My Soul Today"
    song34.topic = "Holy Ghost"
    song34.selected = false
    song34.favorite = false
    song34.sortingIndex = 0
    
    let song35 = Song(context: context)
    song35.order = 35
    song35.random = Int64(arc4random_uniform(1000))
    song35.book = songBooksArray[1]
    song35.number = 239
    song35.url = "https://www.lds.org/music/library/hymns/choose-the-right?lang=eng"
    song35.title = "Choose the Right"
    song35.topic = "Commandments"
    song35.selected = false
    song35.favorite = true
    song35.sortingIndex = 0
    
    let song36 = Song(context: context)
    song36.order = 36
    song36.random = Int64(arc4random_uniform(1000))
    song36.book = songBooksArray[1]
    song36.number = 243
    song36.url = "https://www.lds.org/music/library/hymns/let-us-all-press-on?lang=eng"
    song36.title = "Let Us All Press On"
    song36.topic = "Endure to the end"
    song36.selected = false
    song36.favorite = false
    song36.sortingIndex = 0
    
    let song37 = Song(context: context)
    song37.order = 37
    song37.random = Int64(arc4random_uniform(1000))
    song37.book = songBooksArray[1]
    song37.number = 246
    song37.url = "https://www.lds.org/music/library/hymns/onward-christian-soldiers?lang=eng"
    song37.title = "Onward, Christian Soldiers"
    song37.topic = "Perfect the Saints"
    song37.selected = false
    song37.favorite = false
    song37.sortingIndex = 0
    
    let song38 = Song(context: context)
    song38.order = 38
    song38.random = Int64(arc4random_uniform(1000))
    song38.book = songBooksArray[1]
    song38.number = 249
    song38.url = "https://www.lds.org/music/library/hymns/called-to-serve?lang=eng"
    song38.title = "Called to Serve"
    song38.topic = "Proclaim the Gospel"
    song38.selected = false
    song38.favorite = false
    song38.sortingIndex = 0
    
    let song39 = Song(context: context)
    song39.order = 39
    song39.random = Int64(arc4random_uniform(1000))
    song39.book = songBooksArray[1]
    song39.number = 250
    song39.url = "https://www.lds.org/music/library/hymns/we-are-all-enlisted?lang=eng"
    song39.title = "We Are All Enlisted"
    song39.topic = "Perfect the Saints"
    song39.selected = false
    song39.favorite = false
    song39.sortingIndex = 0
    
    let song40 = Song(context: context)
    song40.order = 40
    song40.random = Int64(arc4random_uniform(1000))
    song40.book = songBooksArray[1]
    song40.number = 252
    song40.url = "https://www.lds.org/music/library/hymns/put-your-shoulder-to-the-wheel?lang=eng"
    song40.title = "Put Your Shoulder to the Wheel"
    song40.topic = "Endure to the end"
    song40.selected = false
    song40.favorite = false
    song40.sortingIndex = 0
    
    let song41 = Song(context: context)
    song41.order = 41
    song41.random = Int64(arc4random_uniform(1000))
    song41.book = songBooksArray[1]
    song41.number = 255
    song41.url = "https://www.lds.org/music/library/hymns/carry-on?lang=eng"
    song41.title = "Carry On"
    song41.topic = "Endure to the end"
    song41.selected = false
    song41.favorite = false
    song41.sortingIndex = 0
    
    let song42 = Song(context: context)
    song42.order = 42
    song42.random = Int64(arc4random_uniform(1000))
    song42.book = songBooksArray[1]
    song42.number = 259
    song42.url = "https://www.lds.org/music/library/hymns/hope-of-israel?lang=eng"
    song42.title = "Hope of Israel"
    song42.topic = "Perfect the Saints"
    song42.selected = false
    song42.favorite = false
    song42.sortingIndex = 0
    
    let song43 = Song(context: context)
    song43.order = 43
    song43.random = Int64(arc4random_uniform(1000))
    song43.book = songBooksArray[1]
    song43.number = 260
    song43.url = "https://www.lds.org/music/library/hymns/whos-on-the-lords-side?lang=eng"
    song43.title = "Who’s on the Lord’s Side?"
    song43.topic = "Perfect the Saints"
    song43.selected = false
    song43.favorite = false
    song43.sortingIndex = 0
    
    let song51 = Song(context: context)
    song51.order = 51
    song51.random = Int64(arc4random_uniform(100))
    song51.book = songBooksArray[0]
    song51.number = 2
    song51.url = "https://www.lds.org/music/library/childrens-songbook/i-am-a-child-of-god?lang=eng"
    song51.title = "I Am a Child of God"
    song51.topic = "Heavenly Father"
    song51.selected = false
    song51.favorite = true
    song51.sortingIndex = 0
    
    let song52 = Song(context: context)
    song52.order = 52
    song52.random = Int64(arc4random_uniform(1000))
    song52.book = songBooksArray[0]
    song52.number = 4
    song52.url = "https://www.lds.org/music/library/childrens-songbook/i-lived-in-heaven?lang=eng"
    song52.title = "I Lived in Heaven"
    song52.topic = "Plan of Salvation"
    song52.selected = false
    song52.favorite = false
    song52.sortingIndex = 0
    
    let song53 = Song(context: context)
    song53.order = 53
    song53.random = Int64(arc4random_uniform(1000))
    song53.book = songBooksArray[0]
    song53.number = 5
    song53.url = "https://www.lds.org/music/library/childrens-songbook/i-know-my-father-lives?lang=eng"
    song53.title = "I Know My Father Lives"
    song53.topic = "Heavenly Father"
    song53.selected = false
    song53.favorite = false
    song53.sortingIndex = 0
    
    let song54 = Song(context: context)
    song54.order = 54
    song54.random = Int64(arc4random_uniform(1000))
    song54.book = songBooksArray[0]
    song54.number = 7
    song54.url = "https://www.lds.org/music/library/childrens-songbook/i-thank-thee-dear-father?lang=eng"
    song54.title = "I Thank Thee, Dear Father"
    song54.topic = "Heavenly Father"
    song54.selected = false
    song54.favorite = false
    song54.sortingIndex = 0
    
    let song55 = Song(context: context)
    song55.order = 55
    song55.random = Int64(arc4random_uniform(1000))
    song55.book = songBooksArray[0]
    song55.number = 11
    song55.url = "https://www.lds.org/music/library/childrens-songbook/im-thankful-to-be-me?lang=eng"
    song55.title = "I’m Thankful to Be Me"
    song55.topic = "Christlike Attributes"
    song55.selected = false
    song55.favorite = false
    song55.sortingIndex = 0
    
    let song56 = Song(context: context)
    song56.order = 56
    song56.random = Int64(arc4random_uniform(1000))
    song56.book = songBooksArray[0]
    song56.number = 12
    song56.url = "https://www.lds.org/music/library/childrens-songbook/a-childs-prayer?lang=eng"
    song56.title = "A Child’s Prayer"
    song56.topic = "Heavenly Father"
    song56.selected = true
    song56.favorite = true
    let selectedSong = tasksArray[1]
    song56.selectedOne = selectedSong
    song56.sortingIndex = 0
    
    let song57 = Song(context: context)
    song57.order = 57
    song57.random = Int64(arc4random_uniform(1000))
    song57.book = songBooksArray[0]
    song57.number = 16
    song57.url = "https://www.lds.org/music/library/childrens-songbook/children-all-over-the-world?lang=eng"
    song57.title = "Children All Over the World"
    song57.topic = "Plan of Salvation"
    song57.selected = false
    song57.favorite = false
    song57.sortingIndex = 0
    
    let song58 = Song(context: context)
    song58.order = 58
    song58.random = Int64(arc4random_uniform(1000))
    song58.book = songBooksArray[0]
    song58.number = 26
    song58.url = "https://www.lds.org/music/library/childrens-songbook/reverently-quietly?lang=eng"
    song58.title = "Reverently, Quietly"
    song58.topic = "Christlike Attributes"
    song58.selected = false
    song58.favorite = false
    song58.sortingIndex = 0
    
    let song59 = Song(context: context)
    song59.order = 59
    song59.random = Int64(arc4random_uniform(1000))
    song59.book = songBooksArray[0]
    song59.number = 37
    song59.url = "https://www.lds.org/music/library/childrens-songbook/stars-were-gleaming?lang=eng"
    song59.title = "Stars Were Gleaming"
    song59.topic = "Birth of our Savior"
    song59.selected = false
    song59.favorite = false
    song59.sortingIndex = 0
    
    let song60 = Song(context: context)
    song60.order = 60
    song60.random = Int64(arc4random_uniform(1000))
    song60.book = songBooksArray[0]
    song60.number = 42
    song60.url = "https://www.lds.org/music/library/childrens-songbook/away-in-a-manger?lang=eng"
    song60.title = "Away in a Manger"
    song60.topic = "Birth of our Savior"
    song60.selected = false
    song60.favorite = false
    song60.sortingIndex = 0
    
    let song61 = Song(context: context)
    song61.order = 61
    song61.random = Int64(arc4random_uniform(1000))
    song61.book = songBooksArray[0]
    song61.number = 47
    song61.url = "https://www.lds.org/music/library/childrens-songbook/sleep-little-jesus?lang=eng"
    song61.title = "Sleep, Little Jesus"
    song61.topic = "Birth of our Savior"
    song61.selected = false
    song61.favorite = false
    song61.sortingIndex = 0
    
    let song62 = Song(context: context)
    song62.order = 62
    song62.random = Int64(arc4random_uniform(1000))
    song62.book = songBooksArray[0]
    song62.number = 55
    song62.url = "https://www.lds.org/music/library/childrens-songbook/jesus-once-was-a-little-child?lang=eng"
    song62.title = "Jesus Once Was a Little Child"
    song62.topic = "Jesus Christ"
    song62.selected = false
    song62.favorite = false
    song62.sortingIndex = 0
    
    let song63 = Song(context: context)
    song63.order = 63
    song63.random = Int64(arc4random_uniform(1000))
    song63.book = songBooksArray[0]
    song63.number = 57
    song63.url = "https://www.lds.org/music/library/childrens-songbook/tell-me-the-stories-of-jesus?lang=eng"
    song63.title = "Tell Me the Stories of Jesus"
    song63.topic = "Jesus Christ"
    song63.selected = false
    song63.favorite = false
    song63.sortingIndex = 0
    
    let song64 = Song(context: context)
    song64.order = 64
    song64.random = Int64(arc4random_uniform(1000))
    song64.book = songBooksArray[0]
    song64.number = 60
    song64.url = "https://www.lds.org/music/library/childrens-songbook/jesus-wants-me-for-a-sunbeam?lang=eng"
    song64.title = "Jesus Wants Me for a Sunbeam"
    song64.topic = "Jesus Christ"
    song64.selected = false
    song64.favorite = false
    song64.sortingIndex = 0
    
    let song65 = Song(context: context)
    song65.order = 65
    song65.random = Int64(arc4random_uniform(1000))
    song65.book = songBooksArray[0]
    song65.number = 74
    song65.url = "https://www.lds.org/music/library/childrens-songbook/i-feel-my-saviors-love?lang=eng"
    song65.title = "I Feel My Savior’s Love"
    song65.topic = "Christlike Attributes"
    song65.selected = false
    song65.favorite = false
    song65.sortingIndex = 0
    
    let song66 = Song(context: context)
    song66.order = 66
    song66.random = Int64(arc4random_uniform(1000))
    song66.book = songBooksArray[0]
    song66.number = 78
    song66.url = "https://www.lds.org/music/library/childrens-songbook/im-trying-to-be-like-jesus?lang=eng"
    song66.title = "I’m Trying to Be like Jesus"
    song66.topic = "Jesus Christ"
    song66.selected = false
    song66.favorite = false
    song66.sortingIndex = 0
    
    let song67 = Song(context: context)
    song67.order = 67
    song67.random = Int64(arc4random_uniform(1000))
    song67.book = songBooksArray[0]
    song67.number = 82
    song67.url = "https://www.lds.org/music/library/childrens-songbook/when-he-comes-again?lang=eng"
    song67.title = "When He Comes Again"
    song67.topic = "Jesus Christ"
    song67.selected = false
    song67.favorite = false
    song67.sortingIndex = 0
    
    let song68 = Song(context: context)
    song68.order = 68
    song68.random = Int64(arc4random_uniform(1000))
    song68.book = songBooksArray[0]
    song68.number = 86
    song68.url = "https://www.lds.org/music/library/childrens-songbook/the-golden-plates?lang=eng"
    song68.title = "The Golden Plates"
    song68.topic = "Scriptures"
    song68.selected = false
    song68.favorite = false
    song68.sortingIndex = 0
    
    let song69 = Song(context: context)
    song69.order = 69
    song69.random = Int64(arc4random_uniform(1000))
    song69.book = songBooksArray[0]
    song69.number = 95
    song69.url = "https://www.lds.org/music/library/childrens-songbook/i-love-to-see-the-temple?lang=eng"
    song69.title = "I Love to See the Temple"
    song69.topic = "Redeem the Dead"
    song69.selected = false
    song69.favorite = true
    song69.sortingIndex = 0
    
    let song70 = Song(context: context)
    song70.order = 70
    song70.random = Int64(arc4random_uniform(1000))
    song70.book = songBooksArray[0]
    song70.number = 96
    song70.url = "https://www.lds.org/music/library/childrens-songbook/faith?lang=eng"
    song70.title = "Faith"
    song70.topic = "Principles & Ordinances"
    song70.selected = false
    song70.favorite = false
    song70.sortingIndex = 0
    
    let song71 = Song(context: context)
    song71.order = 71
    song71.random = Int64(arc4random_uniform(1000))
    song71.book = songBooksArray[0]
    song71.number = 98
    song71.url = "https://www.lds.org/music/library/childrens-songbook/repentance?lang=eng"
    song71.title = "Repentance"
    song71.topic = "Principles & Ordinances"
    song71.selected = false
    song71.favorite = false
    song71.sortingIndex = 0
    
    let song72 = Song(context: context)
    song72.order = 72
    song72.random = Int64(arc4random_uniform(1000))
    song72.book = songBooksArray[0]
    song72.number = 100
    song72.url = "https://www.lds.org/music/library/childrens-songbook/baptism?lang=eng"
    song72.title = "Baptism"
    song72.topic = "Principles & Ordinances"
    song72.selected = false
    song72.favorite = false
    song72.sortingIndex = 0
    
    let song73 = Song(context: context)
    song73.order = 73
    song73.random = Int64(arc4random_uniform(1000))
    song73.book = songBooksArray[0]
    song73.number = 103
    song73.url = "https://www.lds.org/music/library/childrens-songbook/when-i-am-baptized?lang=eng"
    song73.title = "When I Am Baptized"
    song73.topic = "Principles & Ordinances"
    song73.selected = false
    song73.favorite = false
    song73.sortingIndex = 0
    
    let song74 = Song(context: context)
    song74.order = 74
    song74.random = Int64(arc4random_uniform(1000))
    song74.book = songBooksArray[0]
    song74.number = 105
    song74.url = "https://www.lds.org/music/library/childrens-songbook/the-holy-ghost?lang=eng"
    song74.title = "The Holy Ghost"
    song74.topic = "Principles & Ordinances"
    song74.selected = false
    song74.favorite = false
    song74.sortingIndex = 0
    
    let song75 = Song(context: context)
    song75.order = 75
    song75.random = Int64(arc4random_uniform(1000))
    song75.book = songBooksArray[0]
    song75.number = 109
    song75.url = "https://www.lds.org/music/library/childrens-songbook/search-ponder-and-pray?lang=eng"
    song75.title = "Search, Ponder, and Pray"
    song75.topic = "Commandments"
    song75.selected = false
    song75.favorite = false
    song75.sortingIndex = 0
    
    let song76 = Song(context: context)
    song76.order = 76
    song76.random = Int64(arc4random_uniform(1000))
    song76.book = songBooksArray[0]
    song76.number = 110
    song76.url = "https://www.lds.org/music/library/childrens-songbook/follow-the-prophet?lang=eng"
    song76.title = "Follow the Prophet"
    song76.topic = "Restoration"
    song76.selected = false
    song76.favorite = false
    song76.sortingIndex = 0
    
    let song77 = Song(context: context)
    song77.order = 77
    song77.random = Int64(arc4random_uniform(1000))
    song77.book = songBooksArray[0]
    song77.number = 112
    song77.url = "https://www.lds.org/music/library/childrens-songbook/the-commandments?lang=eng"
    song77.title = "The Commandments"
    song77.topic = "Commandments"
    song77.selected = false
    song77.favorite = false
    song77.sortingIndex = 0
    
    let song78 = Song(context: context)
    song78.order = 78
    song78.random = Int64(arc4random_uniform(1000))
    song78.book = songBooksArray[0]
    song78.number = 118
    song78.url = "https://www.lds.org/music/library/childrens-songbook/book-of-mormon-stories?lang=eng"
    song78.title = "Book of Mormon Stories"
    song78.topic = "Scriptures"
    song78.selected = false
    song78.favorite = false
    song78.sortingIndex = 0
    
    let song79 = Song(context: context)
    song79.order = 2
    song79.random = Int64(arc4random_uniform(1000))
    song79.book = songBooksArray[0]
    song79.number = 120
    song79.url = "https://www.lds.org/music/library/childrens-songbook/nephis-courage?lang=eng"
    song79.title = "Nephi’s Courage"
    song79.topic = "Christlike Attributes"
    song79.selected = false
    song79.favorite = false
    song79.sortingIndex = 0
    
    let song80 = Song(context: context)
    song80.order = 80
    song80.random = Int64(arc4random_uniform(1000))
    song80.book = songBooksArray[0]
    song80.number = 136
    song80.url = "https://www.lds.org/music/library/childrens-songbook/love-one-another?lang=eng"
    song80.title = "Love One Another"
    song80.topic = "Commandments"
    song80.selected = false
    song80.favorite = true
    song80.sortingIndex = 0
    
    let song81 = Song(context: context)
    song81.order = 81
    song81.random = Int64(arc4random_uniform(1000))
    song81.book = songBooksArray[0]
    song81.number = 146
    song81.url = "https://www.lds.org/music/library/childrens-songbook/keep-the-commandments?lang=eng"
    song81.title = "Keep the Commandments"
    song81.topic = "Commandments"
    song81.selected = false
    song81.favorite = true
    song81.sortingIndex = 0
    
    let song82 = Song(context: context)
    song82.order = 82
    song82.random = Int64(arc4random_uniform(1000))
    song82.book = songBooksArray[0]
    song82.number = 158
    song82.url = "https://www.lds.org/music/library/childrens-songbook/dare-to-do-right?lang=eng"
    song82.title = "Dare to Do Right"
    song82.topic = "Endure to the end"
    song82.selected = false
    song82.favorite = false
    song82.sortingIndex = 0
    
    let song83 = Song(context: context)
    song83.order = 83
    song83.random = Int64(arc4random_uniform(1000))
    song83.book = songBooksArray[0]
    song83.number = 159
    song83.url = "https://www.lds.org/music/library/childrens-songbook/stand-for-the-right?lang=eng"
    song83.title = "Stand for the Right"
    song83.topic = "Commandments"
    song83.selected = false
    song83.favorite = false
    song83.sortingIndex = 0
    
    let song84 = Song(context: context)
    song84.order = 84
    song84.random = Int64(arc4random_uniform(1000))
    song84.book = songBooksArray[0]
    song84.number = 160
    song84.url = "https://www.lds.org/music/library/childrens-songbook/choose-the-right-way?lang=eng"
    song84.title = "Choose the Right Way"
    song84.topic = "Christlike Attributes"
    song84.selected = false
    song84.favorite = true
    song84.sortingIndex = 0
    
    let song85 = Song(context: context)
    song85.order = 85
    song85.random = Int64(arc4random_uniform(1000))
    song85.book = songBooksArray[0]
    song85.number = 163
    song85.url = "https://www.lds.org/music/library/childrens-songbook/i-am-like-a-star?lang=eng"
    song85.title = "I Am like a Star"
    song85.topic = "Heavenly Father"
    song85.selected = false
    song85.favorite = false
    song85.sortingIndex = 0
    
    let song86 = Song(context: context)
    song86.order = 86
    song86.random = Int64(arc4random_uniform(1000))
    song86.book = songBooksArray[0]
    song86.number = 169
    song86.url = "https://www.lds.org/music/library/childrens-songbook/i-hope-they-call-me-on-a-mission?lang=eng"
    song86.title = "I Hope They Call Me on a Mission"
    song86.topic = "Proclaim the Gospel"
    song86.selected = false
    song86.favorite = false
    song86.sortingIndex = 0
    
    let song87 = Song(context: context)
    song87.order = 87
    song87.random = Int64(arc4random_uniform(1000))
    song87.book = songBooksArray[0]
    song87.number = 172
    song87.url = "https://www.lds.org/music/library/childrens-songbook/well-bring-the-world-his-truth-army-of-helaman?lang=eng"
    song87.title = "We’ll Bring the World His Truth"
    song87.topic = "Proclaim the Gospel"
    song87.selected = false
    song87.favorite = false
    song87.sortingIndex = 0
    
    let song88 = Song(context: context)
    song88.order = 88
    song88.random = Int64(arc4random_uniform(1000))
    song88.book = songBooksArray[0]
    song88.number = 174
    song88.url = "https://www.lds.org/music/library/childrens-songbook/called-to-serve?lang=eng"
    song88.title = "Called to Serve"
    song88.topic = "Proclaim the Gospel"
    song88.selected = false
    song88.favorite = false
    song88.sortingIndex = 0
    
    let song89 = Song(context: context)
    song89.order = 89
    song89.random = Int64(arc4random_uniform(1000))
    song89.book = songBooksArray[0]
    song89.number = 176
    song89.url = "https://www.lds.org/music/library/childrens-songbook/tell-me-dear-lord?lang=eng"
    song89.title = "Tell Me, Dear Lord"
    song89.topic = "Heavenly Father"
    song89.selected = false
    song89.favorite = false
    song89.sortingIndex = 0
    
    let song90 = Song(context: context)
    song90.order = 90
    song90.random = Int64(arc4random_uniform(1000))
    song90.book = songBooksArray[0]
    song90.number = 177
    song90.url = "https://www.lds.org/music/library/childrens-songbook/teach-me-to-walk-in-the-light?lang=eng"
    song90.title = "Teach Me to Walk in the Light"
    song90.topic = "Christlike Attributes"
    song90.selected = false
    song90.favorite = false
    song90.sortingIndex = 0
    
    let song91 = Song(context: context)
    song91.order = 91
    song91.random = Int64(arc4random_uniform(1000))
    song91.book = songBooksArray[0]
    song91.number = 178
    song91.url = "https://www.lds.org/music/library/childrens-songbook/teacher-do-you-love-me?lang=eng"
    song91.title = "Teacher, Do You Love Me?"
    song91.topic = "Christlike Attributes"
    song91.selected = false
    song91.favorite = false
    song91.sortingIndex = 0
    
    let song92 = Song(context: context)
    song92.order = 92
    song92.random = Int64(arc4random_uniform(1000))
    song92.book = songBooksArray[0]
    song92.number = 188
    song92.url = "https://www.lds.org/music/library/childrens-songbook/families-can-be-together-forever?lang=eng"
    song92.title = "Families Can Be Together Forever"
    song92.topic = "Plan of Salvation"
    song92.selected = false
    song92.favorite = true
    song92.sortingIndex = 0
    
    let song93 = Song(context: context)
    song93.order = 93
    song93.random = Int64(arc4random_uniform(1000))
    song93.book = songBooksArray[0]
    song93.number = 190
    song93.url = "https://www.lds.org/music/library/childrens-songbook/love-is-spoken-here?lang=eng"
    song93.title = "Love Is Spoken Here"
    song93.topic = "Christlike Attributes"
    song93.selected = false
    song93.favorite = true
    song93.sortingIndex = 0
    
    let song94 = Song(context: context)
    song94.order = 94
    song94.random = Int64(arc4random_uniform(1000))
    song94.book = songBooksArray[0]
    song94.number = 204
    song94.url = "https://www.lds.org/music/library/childrens-songbook/mother-tell-me-the-story?lang=eng"
    song94.title = "Mother, Tell Me the Story"
    song94.topic = "Jesus Christ"
    song94.selected = false
    song94.favorite = false
    song94.sortingIndex = 0
    
    let song95 = Song(context: context)
    song95.order = 95
    song95.random = Int64(arc4random_uniform(1000))
    song95.book = songBooksArray[0]
    song95.number = 206
    song95.url = "https://www.lds.org/music/library/childrens-songbook/dearest-mother-i-love-you?lang=eng"
    song95.title = "Dearest Mother, I Love You"
    song95.topic = "Christlike Attributes"
    song95.selected = false
    song95.favorite = false
    song95.sortingIndex = 0
    
    let song96 = Song(context: context)
    song96.order = 96
    song96.random = Int64(arc4random_uniform(1000))
    song96.book = songBooksArray[0]
    song96.number = 206
    song96.url = "https://www.lds.org/music/library/childrens-songbook/mother-dear?lang=eng"
    song96.title = "Mother Dear"
    song96.topic = "Plan of Salvation"
    song96.selected = false
    song96.favorite = false
    song96.sortingIndex = 0
    
    let song97 = Song(context: context)
    song97.order = 97
    song97.random = Int64(arc4random_uniform(1000))
    song97.book = songBooksArray[0]
    song97.number = 236
    song97.url = "https://www.lds.org/music/library/childrens-songbook/give-said-the-little-stream?lang=eng"
    song97.title = "Give, Said the Little Stream"
    song97.topic = "Christlike Attributes"
    song97.selected = false
    song97.favorite = false
    song97.sortingIndex = 0
    
    let song98 = Song(context: context)
    song98.order = 98
    song98.random = Int64(arc4random_uniform(1000))
    song98.book = songBooksArray[0]
    song98.number = 266
    song98.url = "https://www.lds.org/music/library/childrens-songbook/if-youre-happy?lang=eng"
    song98.title = "If You’re Happy"
    song98.topic = "Christlike Attributes"
    song98.selected = false
    song98.favorite = false
    song98.sortingIndex = 0
    
    let song99 = Song(context: context)
    song99.order = 99
    song99.random = Int64(arc4random_uniform(1000))
    song99.book = songBooksArray[0]
    song99.number = 278
    song99.url = "https://www.lds.org/music/library/childrens-songbook/stand-up?lang=eng"
    song99.title = "Stand Up"
    song99.topic = "Christlike Attributes"
    song99.selected = false
    song99.favorite = false
    song99.sortingIndex = 0
    
    let song100 = Song(context: context)
    song100.order = 100
    song100.random = Int64(arc4random_uniform(1000))
    song100.book = songBooksArray[0]
    song100.number = 281
    song100.url = "https://www.lds.org/music/library/childrens-songbook/the-wise-man-and-the-foolish-man?lang=eng"
    song100.title = "The Wise Man and the Foolish Man"
    song100.topic = "Christlike Attributes"
    song100.selected = false
    song100.favorite = true
    song100.sortingIndex = 0
    
    let song101 = Song(context: context)
    song101.order = 101
    song101.random = Int64(arc4random_uniform(1000))
    song101.book = songBooksArray[2]
    song101.number = 0
    song101.url = "https://www.youtube.com/watch?v=KZ_VlQ8M5EE"
    song101.title = "Gethsemane"
    song101.topic = "Atonement"
    song101.selected = false
    song101.favorite = true
    song101.sortingIndex = 0
    
    let song102 = Song(context: context)
    song102.order = 102
    song102.random = Int64(arc4random_uniform(1000))
    song102.book = songBooksArray[2]
    song102.number = 0
    song102.url = "https://www.youtube.com/watch?v=nomxXk6Q1rk"
    song102.title = "Glourious"
    song102.topic = "Plan of Salvation"
    song102.selected = false
    song102.favorite = true
    song102.sortingIndex = 0
    
    let song103 = Song(context: context)
    song103.order = 103
    song103.random = Int64(arc4random_uniform(1000))
    song103.book = songBooksArray[2]
    song103.number = 0
    song103.url = "https://www.youtube.com/watch?v=fc4aptFGpRg"
    song103.title = "If You Could Hie to Kolob"
    song103.topic = "Plan of Salvation"
    song103.selected = false
    song103.favorite = false
    song103.sortingIndex = 0
    
    let song104 = Song(context: context)
    song104.order = 104
    song104.random = Int64(arc4random_uniform(1000))
    song104.book = songBooksArray[2]
    song104.number = 0
    song104.url = "https://www.youtube.com/playlist?list=PLzM4iKMyZBGM2zy6nHvZ9uAUM2PPNRtZl"
    song104.title = "Vocal Point"
    song104.topic = "Perfect the Saints"
    song104.selected = false
    song104.favorite = false
    song104.sortingIndex = 0
    
    let song105 = Song(context: context)
    song105.order = 105
    song105.random = Int64(arc4random_uniform(1000))
    song105.book = songBooksArray[2]
    song105.number = 0
    song105.url = "https://www.youtube.com/playlist?list=PLxKIAPWA4GegdsofSzjD__73Lkz0uqNkv"
    song105.title = "BYU Noteworthy"
    song105.topic = "Perfect the Saints"
    song105.selected = false
    song105.favorite = false
    song105.sortingIndex = 0
    
    let song106 = Song(context: context)
    song106.order = 106
    song106.random = Int64(arc4random_uniform(1000))
    song106.book = songBooksArray[2]
    song106.number = 0
    song106.url = "https://www.youtube.com/playlist?list=PLyvBLXLjvLew6tNlGJMm_LxZ6pFtOyTSJ"
    song106.title = "Elenyi"
    song106.topic = "Perfect the Saints"
    song106.selected = false
    song106.favorite = false
    song106.sortingIndex = 0
    
    ad.saveContext()
}

func generateRules() {
    getTasks()
    let rule1 = Rule(context: context)
    rule1.title = "Media"
    rule1.detail = "“The media's the most powerful entity on earth. They have the power to make the innocent guilty and to make the guilty innocent, and that's power. Because they control the minds of the masses.”\n- Malcolm X"
    rule1.url = "https://drive.google.com/file/d/1U6DIUWVNML50SgX4p6mdkBrrKcXpdGIE/view"
    rule1.order = 1
    rule1.random = Int64(arc4random_uniform(1000))
    rule1.selected = true
    rule1.sortingIndex = 0
    let selectedRule = tasksArray[2]
    rule1.selectedOne = selectedRule
    
    let rule2 = Rule(context: context)
    rule2.title = "Respect Others"
    rule2.detail = "We believe in the golden rule.\n“Do unto others as you would have them do unto you.“\n- Matt. 7:12"
    rule2.url = "https://drive.google.com/file/d/1zuUzKcEdZS7ZjZh5mKhQWWFPPw77_AaV/view"
    rule2.order = 2
    rule2.random = Int64(arc4random_uniform(1000))
    rule2.selected = false
    rule2.sortingIndex = 0
    
    let rule3 = Rule(context: context)
    rule3.title = "Respect Belongings"
    rule3.detail = "As you get older you start to see who was raised properly. So many people lack basic respect."
    rule3.url = "https://drive.google.com/file/d/1BbDSMAKExvlt2o_NoyN81lbD4imwlW5I/view"
    rule3.order = 3
    rule3.random = Int64(arc4random_uniform(1000))
    rule3.selected = false
    rule3.sortingIndex = 0
    
    let rule4 = Rule(context: context)
    rule4.title = "Table Manners"
    rule4.detail = "“I profoundly believe it takes a lot of ignorance to become a moral slob.“\n- William Buckley Jr."
    rule4.url = "https://drive.google.com/file/d/1nwcCCDRogdtmRvmdXAcfYBZFBDcaUgFt/view"
    rule4.order = 4
    rule4.random = Int64(arc4random_uniform(1000))
    rule4.selected = false
    rule4.sortingIndex = 0
    
    let rule5 = Rule(context: context)
    rule5.title = "Morning Routine"
    rule5.detail = "Yesterday is gone. Tomorrow is a mystery. Today is a blessing!"
    rule5.url = "https://drive.google.com/file/d/1US9Zd604Ldqekde1eoQJbwQQji3LDqJM/view"
    rule5.order = 7
    rule5.random = Int64(arc4random_uniform(1000))
    rule5.selected = false
    rule5.sortingIndex = 0
    
    let rule6 = Rule(context: context)
    rule6.title = "After School Routine"
    rule6.detail = "Never stop learning, because life never stops teaching."
    rule6.url = "https://drive.google.com/file/d/1Nb1AUCeZCMt8Em6f2LVSIzTJt776aLQl/view"
    rule6.order = 5
    rule6.random = Int64(arc4random_uniform(1000))
    rule6.selected = false
    rule6.sortingIndex = 0
    
    let rule7 = Rule(context: context)
    rule7.title = "Bedtime Routine"
    rule7.detail = "Go to be with dreams. Wake up with plans."
    rule7.url = "https://drive.google.com/file/d/1VhCDrnKvr_w4nv3tvZQnmXJMtAJzOphd/view"
    rule7.order = 6
    rule7.random = Int64(arc4random_uniform(1000))
    rule7.selected = false
    rule7.sortingIndex = 0
    
    let rule8 = Rule(context: context)
    rule8.title = "House Chores"
    rule8.detail = "“May we ever choose the harder right instead of the easier wrong.“\n- Thomas S. Monson"
    rule8.url = "https://drive.google.com/file/d/1dkwWTrKC88OoZwZ5KOlK-b3TY63gsZDa/view"
    rule8.order = 8
    rule8.random = Int64(arc4random_uniform(1000))
    rule8.selected = false
    rule8.sortingIndex = 0
    
    let rule9 = Rule(context: context)
    rule9.title = "FHE & HT Expectations"
    rule9.detail = "Human behavior flows from three main sources: desire (spirit), emotion (body), knowledge (mind)."
    rule9.url = "https://drive.google.com/file/d/1xJay1xQw_Yaq8mgcGPe4An-p6NC2PsQl/view"
    rule9.order = 9
    rule9.random = Int64(arc4random_uniform(1000))
    rule9.selected = false
    rule9.sortingIndex = 0
    
    let rule10 = Rule(context: context)
    rule10.title = "Church Guidelines"
    rule10.detail = "Feed your faith and your fears will starve to death."
    rule10.url = "https://drive.google.com/file/d/11aT0cKTF2IG9DqIXEpv2m7C6suddK-zE/view"
    rule10.order = 10
    rule10.random = Int64(arc4random_uniform(1000))
    rule10.selected = false
    rule10.sortingIndex = 0
    
    let rule11 = Rule(context: context)
    rule11.title = "Sunday Behavior"
    rule11.detail = "“Living in the moment brings you a sense of reverance for all of life's blessings.“\n- Oprah Winfrey"
    rule11.url = "https://drive.google.com/file/d/1BPMKRTIbwZEqgXvK9CmUMjinBgKLrV2d/view"
    rule11.order = 10
    rule11.random = Int64(arc4random_uniform(1000))
    rule11.selected = false
    rule11.sortingIndex = 0
    
    ad.saveContext()
}

func generateScripture() {
    getTasks()
    let scripture1 = Scripture(context: context)
    scripture1.topic = topicsArray[0]
    scripture1.volume = "Book of Mormon"
    scripture1.book = "1 Nephi"
    scripture1.chapter = "3"
    scripture1.verse = "7"
    scripture1.title = "The Lord prepares a way"
    scripture1.favorite = true
    scripture1.order = 1
    scripture1.random = Int64(arc4random_uniform(1000))
    scripture1.selected = true
    scripture1.sortingIndex = 0
    let selectedScripture = tasksArray[3]
    scripture1.selectedOne = selectedScripture
    
    let scripture2 = Scripture(context: context)
    scripture2.topic = topicsArray[0]
    scripture2.volume = "Book of Mormon"
    scripture2.book = "2 Nephi"
    scripture2.chapter = "2"
    scripture2.verse = "22-25"
    scripture2.title = "Adam fell that men might be."
    scripture2.favorite = false
    scripture2.order = 2
    scripture2.random = Int64(arc4random_uniform(1000))
    scripture2.selected = false
    scripture2.sortingIndex = 0
    
    ad.saveContext()
}

func generateCalendar() {
    getTasks()
    let calendar = Calendar(context: context)
    let selectedCalendar = tasksArray[4]
    calendar.selectedOne = selectedCalendar
    calendar.title = "Upcoming Events"
    calendar.detail = "1. Activities\n2. Birthdays / Holidays\n3. Traveling / Vacations\n4. Family dinners"
    calendar.selected = true
    
    ad.saveContext()
}

func generateTestimony() {
    getTasks()
    let testimony = Testimony(context: context)
    let selectedTestimony = tasksArray[5]
    testimony.selectedOne = selectedTestimony
    testimony.title = "I have a testimony that..."
    testimony.detail = "1. Heavenly Father lives and loves His children. I am a child of God.\n2. Jesus Christ lives, that He is the Son of God, and that He carried out the infinite Atonement.\n3. Joseph Smith is the prophet of God who was called to restore the Gospel.\n4. The Church of Jesus Christ of Latter-day Saints is the Savior's true Church on the earth.\n5. The Church is led by a living prophet today.\n6. The Book of Mormon is another testiment of Jesus Christ.\n7. A testimony is a spiritual witness given by the Holy Ghost.\n8. A testimony grows to include all principles of the Gospel."
    testimony.selected = true
    
    ad.saveContext()
}

func generateSpotlight() {
    getTasks()
    let spotlight = Spotlight(context: context)
    let selectedSpotlight = tasksArray[6]
    spotlight.selectedOne = selectedSpotlight
    spotlight.title = "Affirmations"
    spotlight.detail = "1. Emotional\n2. Financial\n3. Intellectual\n4. Social\n5. Occupational\n6. Physical\n7. Environmental\n8. Spiritual"
    spotlight.selected = true
    
    ad.saveContext()
}

func generateMisc() {
    getTasks()
    let misc = Misc(context: context)
    let selectedMisc = tasksArray[7]
    misc.selectedOne = selectedMisc
    misc.title = "Tell me something I don't know..."
    misc.detail = "While knowledge is orderly and cumulative, information is random and miscellaneous."
    misc.url = "https://www.mormonchannel.org/watch/series/mormon-channel-studio/mormon-channel-studio-nashville-tribute-band"
    misc.selected = true
    
    ad.saveContext()
}

func generateThoughts() {
    getTasks()
    let thought1 = Thought(context: context)
    let selectedThought = tasksArray[8]
    thought1.selectedOne = selectedThought
    thought1.topic = dimensionsArray[0]
    thought1.title = "Emotional"
    thought1.detail = "Meditation"
    thought1.url = "https://www.mormonchannel.org/"
    thought1.order = 1
    thought1.favorite = true
    thought1.random = Int64(arc4random_uniform(1000))
    thought1.selected = true
    thought1.sortingIndex = 0
    
    let thought2 = Thought(context: context)
    thought2.topic = dimensionsArray[1]
    thought2.title = "Financial"
    thought2.detail = "Baby Steps"
    thought2.url = "https://www.mormonchannel.org/"
    thought2.order = 2
    thought2.favorite = false
    thought2.random = Int64(arc4random_uniform(1000))
    thought2.selected = false
    thought2.sortingIndex = 0
    
    let thought3 = Thought(context: context)
    thought3.topic = dimensionsArray[2]
    thought3.title = "Intellectual"
    thought3.detail = "Education"
    thought3.url = "https://www.mormonchannel.org/"
    thought3.order = 3
    thought3.favorite = false
    thought3.random = Int64(arc4random_uniform(1000))
    thought3.selected = false
    thought3.sortingIndex = 0
    
    let thought4 = Thought(context: context)
    thought4.topic = dimensionsArray[3]
    thought4.title = "Social"
    thought4.detail = "Networking"
    thought4.url = "https://www.mormonchannel.org/"
    thought4.order = 4
    thought4.favorite = false
    thought4.random = Int64(arc4random_uniform(1000))
    thought4.selected = false
    thought4.sortingIndex = 0
    
    let thought5 = Thought(context: context)
    thought5.topic = dimensionsArray[4]
    thought5.title = "Occupational"
    thought5.detail = "Work doesn't define you."
    thought5.url = "https://www.mormonchannel.org/"
    thought5.order = 5
    thought5.favorite = false
    thought5.random = Int64(arc4random_uniform(1000))
    thought5.selected = false
    thought5.sortingIndex = 0
    
    let thought6 = Thought(context: context)
    thought6.topic = dimensionsArray[5]
    thought6.title = "Physical"
    thought6.detail = "Input and Output"
    thought6.url = "https://www.mormonchannel.org/"
    thought6.order = 6
    thought6.favorite = false
    thought6.random = Int64(arc4random_uniform(1000))
    thought6.selected = false
    thought6.sortingIndex = 0
    
    let thought7 = Thought(context: context)
    thought7.topic = dimensionsArray[6]
    thought7.title = "Environmental"
    thought7.detail = "You can change your environment."
    thought7.url = "https://www.mormonchannel.org/"
    thought7.order = 7
    thought7.favorite = false
    thought7.random = Int64(arc4random_uniform(1000))
    thought7.selected = false
    thought7.sortingIndex = 0
    
    let thought8 = Thought(context: context)
    thought8.topic = dimensionsArray[7]
    thought8.title = "Spiritual"
    thought8.detail = ""
    thought8.url = ""
    thought8.order = 8
    thought8.favorite = false
    thought8.random = Int64(arc4random_uniform(1000))
    thought8.selected = false
    thought8.sortingIndex = 0
    
    ad.saveContext()
}

func generateLessons() {
    getTasks()
    let lesson1 = Lesson(context: context)
    let selectedLesson = tasksArray[9]
    lesson1.selectedOne = selectedLesson
    lesson1.topic = topicsArray[0]
    lesson1.title = "FHE Playlist"
    lesson1.detail = "A collection of my personal favorite and spiritual videos. Pick one from the play list."
    lesson1.url = "https://www.youtube.com/playlist?list=PLbuu8VeGQ5CN5XZeSk8cUkHUpqKHaKYwP"
    lesson1.youTubeVideo = false
    lesson1.order = 1
    lesson1.favorite = true
    lesson1.random = Int64(arc4random_uniform(1000))
    lesson1.selected = true
    lesson1.sortingIndex = 0
    
    ad.saveContext()
}

func generateCouncils() {
    getTasks()
    let council = Council(context: context)
    let selectedCouncil = tasksArray[10]
    council.selectedOne = selectedCouncil
    
    
    
    
    ad.saveContext()
}

func generateGames() {
    getTasks()
    
    ad.saveContext()
}

func generateTreats() {
    getTasks()
    
    ad.saveContext()
}

