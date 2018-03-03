//
//  Lessons.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func generateLessons() {
    getAllTasks()
    let lesson2 = Lesson(context: context)
    lesson2.selectedOne = taskLesson
    lesson2.category = "Spiritual"
    lesson2.topic = "Plan of Salvation"
    lesson2.title = "Our Eternal Life"
    lesson2.detail = "Members of The Church of Jesus Christ of Latter-day Saints (Mormons) believe that we are eternal beings, sons and daughters of our Heavenly Father and Jesus Chris is our Savior."
    lesson2.url = "https://www.youtube.com/watch?v=9MiF_HKoFr4"
    lesson2.youTubeVideo = true
    lesson2.order = 2
    lesson2.favorite = true
    lesson2.random = Int64(arc4random_uniform(1000))
    lesson2.selected = true
    lesson2.sortingIndex = 0
    lesson2.alphabet = String(describing: lesson2.title![(lesson2.title!.startIndex)])
    
    let lesson3 = Lesson(context: context)
    lesson3.category = "Temporal"
    lesson3.topic = "Emotional"
    lesson3.title = "Meditation"
    lesson3.detail = "Basic steps on how to meditate."
    lesson3.url = "https://www.wikihow.com/Meditate"
    lesson3.youTubeVideo = false
    lesson3.order = 3
    lesson3.favorite = true
    lesson3.random = Int64(arc4random_uniform(1000))
    lesson3.selected = false
    lesson3.sortingIndex = 0
    lesson3.alphabet = String(describing: lesson3.title![(lesson3.title!.startIndex)])
    
    let lesson4 = Lesson(context: context)
    lesson4.category = "Temporal"
    lesson4.topic = "Financial"
    lesson4.title = "Financial Peace"
    lesson4.detail = "Baby Step 1: $1,000 cash in a beginner emergency fund.\nBaby Step 2: Use the debt snowball to pay off all your debt but the house.\nBaby Step 3: A fully funded emergency fund of 3 to 6 months of expenses.\nBaby Step 4: Invest 15% of your household income into retirement.\nBaby Step 5: Start saving for college.\nBaby Step 6: Pay off your home early.\nBaby Step 7: Build wealth and give generously."
    lesson4.url = "https://www.daveramsey.com/baby-steps/?ectid=30.31.13181&gclid=CjwKCAiA9rjRBRAeEiwA2SV4ZW6QF6enSOGt5f5lC2mFQN8UoKfxSfCT3KWtDt9oT7kIQwzZSfPxCxoCTlUQAvD_BwE"
    lesson4.youTubeVideo = false
    lesson4.order = 4
    lesson4.favorite = false
    lesson4.random = Int64(arc4random_uniform(1000))
    lesson4.selected = false
    lesson4.sortingIndex = 0
    lesson4.alphabet = String(describing: lesson4.title![(lesson4.title!.startIndex)])
    
    let lesson5 = Lesson(context: context)
    lesson5.category = "Temporal"
    lesson5.topic = "Intellectual"
    lesson5.title = "Education Creates Opportunities"
    lesson5.detail = "Education opens the door, while experience gets you through the door."
    lesson5.url = "https://www.youtube.com/watch?v=AMbR-jATgWs"
    lesson5.youTubeVideo = true
    lesson5.order = 5
    lesson5.favorite = false
    lesson5.random = Int64(arc4random_uniform(1000))
    lesson5.selected = false
    lesson5.sortingIndex = 0
    lesson5.alphabet = String(describing: lesson5.title![(lesson5.title!.startIndex)])
    
    let lesson6 = Lesson(context: context)
    lesson6.category = "Temporal"
    lesson6.topic = "Relational/Social"
    lesson6.title = "Connection"
    lesson6.detail = "Brené Brown on Empathy"
    lesson6.url = "https://www.youtube.com/watch?v=1Evwgu369Jw"
    lesson6.youTubeVideo = true
    lesson6.order = 6
    lesson6.favorite = true
    lesson6.random = Int64(arc4random_uniform(1000))
    lesson6.selected = false
    lesson6.sortingIndex = 0
    lesson6.alphabet = String(describing: lesson6.title![(lesson6.title!.startIndex)])
    
    let lesson7 = Lesson(context: context)
    lesson7.category = "Temporal"
    lesson7.topic = "Spiritual"
    lesson7.title = "What Matters Most in Life?"
    lesson7.detail = "Does money, love, work, intelligence, or athleticism define you or make you happy? No.\nLiving in a way that is congruent to your core values not only define you but bring you happiness.\n\n- Rylan Evans"
    lesson7.url = "https://www.youtube.com/watch?v=Lg-wNxJ5XxY&t"
    lesson7.youTubeVideo = true
    lesson7.order = 7
    lesson7.favorite = true
    lesson7.random = Int64(arc4random_uniform(1000))
    lesson7.selected = false
    lesson7.sortingIndex = 0
    lesson7.alphabet = String(describing: lesson7.title![(lesson7.title!.startIndex)])
    
    let lesson8 = Lesson(context: context)
    lesson8.category = "Temporal"
    lesson8.topic = "Physical"
    lesson8.title = "Health"
    lesson8.detail = "Living healthy is mainly controling your input and output. Put simply, it's the food you eat and the excerise you do. The food you input is more impactful."
    lesson8.url = "https://www.youtube.com/watch?v=ztiHRiFXtoc"
    lesson8.youTubeVideo = true
    lesson8.order = 8
    lesson8.favorite = false
    lesson8.random = Int64(arc4random_uniform(1000))
    lesson8.selected = false
    lesson8.sortingIndex = 0
    lesson8.alphabet = String(describing: lesson8.title![(lesson8.title!.startIndex)])
    
    let lesson9 = Lesson(context: context)
    lesson9.category = "Temporal"
    lesson9.topic = "Environmental"
    lesson9.title = "Change Your Environment"
    lesson9.detail = "Environment = the surroundings or conditions in which a person lives or operates.\nChange through changing yourself first."
    lesson9.url = "https://youtu.be/Rhx5MnQj008?t=1m26s"
    lesson9.youTubeVideo = false
    lesson9.order = 9
    lesson9.favorite = false
    lesson9.random = Int64(arc4random_uniform(1000))
    lesson9.selected = false
    lesson9.sortingIndex = 0
    lesson9.alphabet = String(describing: lesson9.title![(lesson9.title!.startIndex)])
    
    let lesson10 = Lesson(context: context)
    lesson10.category = "Spiritual"
    lesson10.topic = "Jesus Christ"
    lesson10.title = "Lord I Believe"
    lesson10.detail = "I am not asking you to pretend to have faith you don't have. I am asking you to be true to the faith you do have.\n\n- Elder Holland"
    lesson10.url = "https://www.lds.org/general-conference/2013/04/lord-i-believe?lang=eng"
    lesson10.youTubeVideo = false
    lesson10.order = 10
    lesson10.favorite = true
    lesson10.random = Int64(arc4random_uniform(1000))
    lesson10.selected = false
    lesson10.sortingIndex = 0
    lesson10.alphabet = String(describing: lesson10.title![(lesson10.title!.startIndex)])
    
    let lesson11 = Lesson(context: context)
    lesson11.category = "Temporal"
    lesson11.topic = "Occupational"
    lesson11.title = "Work vs. Dreams"
    lesson11.detail = "Follow your passion? Never give up on your dreams?\nPassion does not equal ability. Instead, have fun with your passion and follow your opportunities."
    lesson11.url = "https://www.youtube.com/watch?v=CVEuPmVAb8o"
    lesson11.youTubeVideo = true
    lesson11.order = 10
    lesson11.favorite = false
    lesson11.random = Int64(arc4random_uniform(1000))
    lesson11.selected = false
    lesson11.sortingIndex = 0
    lesson11.alphabet = String(describing: lesson11.title![(lesson11.title!.startIndex)])
    
    let lesson12 = Lesson(context: context)
    lesson12.category = "Spiritual"
    lesson12.topic = "Care for the Poor & Needy"
    lesson12.title = "Helping Others"
    lesson12.detail = "In order to serve someone you have to be secure yourself."
    lesson12.url = "https://www.youtube.com/watch?v=6aFXY01VXzg"
    lesson12.youTubeVideo = true
    lesson12.order = 9
    lesson12.favorite = false
    lesson12.random = Int64(arc4random_uniform(1000))
    lesson12.selected = false
    lesson12.sortingIndex = 0
    lesson12.alphabet = String(describing: lesson12.title![(lesson12.title!.startIndex)])
    
    let lesson13 = Lesson(context: context)
    lesson13.category = "Temporal"
    lesson13.topic = "Relational/Social"
    lesson13.title = "Relationships"
    lesson13.detail = "Advice on relationships and how to treat others."
    lesson13.url = "https://www.youtube.com/playlist?list=PLtY1iLdia2RzjB12TXR7OuQYr6CYDS37b"
    lesson13.youTubeVideo = false
    lesson13.order = 9
    lesson13.favorite = false
    lesson13.random = Int64(arc4random_uniform(1000))
    lesson13.selected = false
    lesson13.sortingIndex = 0
    lesson13.alphabet = String(describing: lesson13.title![(lesson13.title!.startIndex)])
    
    let lesson14 = Lesson(context: context)
    lesson14.category = "Temporal"
    lesson14.topic = "Spiritual"
    lesson14.title = "Inspiration from Prince EA"
    lesson14.detail = "Motivational video playlist.\nWARNING! Some content may not be appropriate for everyone, viewer discretion advised."
    lesson14.url = "https://www.youtube.com/playlist?list=PLtY1iLdia2RygWmqtjHGYm9P3Lz8HHhma"
    lesson14.youTubeVideo = false
    lesson14.order = 9
    lesson14.favorite = false
    lesson14.random = Int64(arc4random_uniform(1000))
    lesson14.selected = false
    lesson14.sortingIndex = 0
    lesson14.alphabet = String(describing: lesson14.title![(lesson14.title!.startIndex)])
    
    let lesson15 = Lesson(context: context)
    lesson15.category = "Temporal"
    lesson15.topic = "Occupational"
    lesson15.title = "A Fisherman"
    lesson15.detail = "The Fisherman vs The Industrialist"
    lesson15.url = "https://www.youtube.com/watch?v=2atNgJ6W4N0"
    lesson15.youTubeVideo = true
    lesson15.order = 9
    lesson15.favorite = false
    lesson15.random = Int64(arc4random_uniform(1000))
    lesson15.selected = false
    lesson15.sortingIndex = 0
    lesson15.alphabet = String(describing: lesson15.title![(lesson15.title!.startIndex)])
    
    let lesson16 = Lesson(context: context)
    lesson16.category = "Temporal"
    lesson16.topic = "Relational/Social"
    lesson16.title = "Race and Humanity"
    lesson16.detail = "What race are you?"
    lesson16.url = "https://www.youtube.com/watch?v=TPPNcmP-9mQ"
    lesson16.youTubeVideo = true
    lesson16.order = 9
    lesson16.favorite = false
    lesson16.random = Int64(arc4random_uniform(1000))
    lesson16.selected = false
    lesson16.sortingIndex = 0
    lesson16.alphabet = String(describing: lesson16.title![(lesson16.title!.startIndex)])
    
    let lesson17 = Lesson(context: context)
    lesson17.category = "Temporal"
    lesson17.topic = "Spiritual"
    lesson17.title = "If There Is No God, Murder Isn't Wrong"
    lesson17.detail = "You may think it's wrong, but how do you know it's wrong?"
    lesson17.url = "https://www.youtube.com/watch?v=yrcQ_PTkVD4"
    lesson17.youTubeVideo = true
    lesson17.order = 9
    lesson17.favorite = true
    lesson17.random = Int64(arc4random_uniform(1000))
    lesson17.selected = false
    lesson17.sortingIndex = 0
    lesson17.alphabet = String(describing: lesson17.title![(lesson17.title!.startIndex)])
    
    let lesson18 = Lesson(context: context)
    lesson18.category = "Spiritual"
    lesson18.topic = "Holy Ghost"
    lesson18.title = "Voice of the Spirit"
    lesson18.detail = "In a world full of noise and many voices, President James E. Faust invites us to listen to and follow the voice of the Spirit, which is calm and quiet and leads to eternal life."
    lesson18.url = "https://www.youtube.com/watch?v=VPbDZnrxBLM&t"
    lesson18.youTubeVideo = true
    lesson18.order = 9
    lesson18.favorite = false
    lesson18.random = Int64(arc4random_uniform(1000))
    lesson18.selected = false
    lesson18.sortingIndex = 0
    lesson18.alphabet = String(describing: lesson18.title![(lesson18.title!.startIndex)])
    
    let lesson19 = Lesson(context: context)
    lesson19.category = lessonCategoryArray[0]
    lesson19.topic = "Spiritual"
    lesson19.title = "Spiritual Whirlwinds"
    lesson19.detail = "Don’t let the whirlwinds drag you down. These are your days—to stand strong as disciples of the Lord Jesus Christ."
    lesson19.url = "https://www.youtube.com/watch?v=DzWXSz9hlxw"
    lesson19.youTubeVideo = true
    lesson19.order = 9
    lesson19.favorite = false
    lesson19.random = Int64(arc4random_uniform(1000))
    lesson19.selected = false
    lesson19.sortingIndex = 0
    lesson19.alphabet = String(describing: lesson19.title![(lesson19.title!.startIndex)])
    
    let lesson20 = Lesson(context: context)
    lesson20.category = lessonCategoryArray[0]
    lesson20.topic = "Heavenly Father"
    lesson20.title = "The Will of God"
    lesson20.detail = "God uses love-inspired correction to guide us to a future we do not or cannot now envision but which He knows is the better way for us."
    lesson20.url = "https://www.youtube.com/watch?v=Rr8xvw0cgw0"
    lesson20.youTubeVideo = true
    lesson20.order = 9
    lesson20.favorite = false
    lesson20.random = Int64(arc4random_uniform(1000))
    lesson20.selected = false
    lesson20.sortingIndex = 0
    lesson20.alphabet = String(describing: lesson20.title![(lesson20.title!.startIndex)])
    
    let lesson21 = Lesson(context: context)
    lesson21.category = "Temporal"
    lesson21.topic = "Emotional"
    lesson21.title = "Is Your Child Getting Enough Vitamin N?"
    lesson21.detail = "If you're a parent, is your child getting enough Vitamin N?"
    lesson21.url = "https://www.youtube.com/watch?v=j3cgUhtRUbE"
    lesson21.youTubeVideo = true
    lesson21.order = 9
    lesson21.favorite = false
    lesson21.random = Int64(arc4random_uniform(1000))
    lesson21.selected = false
    lesson21.sortingIndex = 0
    lesson21.alphabet = String(describing: lesson21.title![(lesson21.title!.startIndex)])
    
    let lesson22 = Lesson(context: context)
    lesson22.category = lessonCategoryArray[0]
    lesson22.topic = "Endure to the end"
    lesson22.title = "Living with Depression"
    lesson22.detail = "“I remember kneeling by my bed and just asking the Savior, 'Where have you been? Why weren’t you there in those moments when I needed you?'”"
    lesson22.url = "https://www.youtube.com/watch?v=7hPZQDeo0Jw"
    lesson22.youTubeVideo = true
    lesson22.order = 9
    lesson22.favorite = false
    lesson22.random = Int64(arc4random_uniform(1000))
    lesson22.selected = false
    lesson22.sortingIndex = 0
    lesson22.alphabet = String(describing: lesson22.title![(lesson22.title!.startIndex)])
    
    let lesson23 = Lesson(context: context)
    lesson23.category = lessonCategoryArray[0]
    lesson23.topic = "Jesus Christ"
    lesson23.title = "The Savior Understands Me"
    lesson23.detail = "Encouragement to members to extend the hand of fellowship to others, regardless of perceived differences."
    lesson23.url = "https://www.youtube.com/watch?v=EUhgBU3coPY"
    lesson23.youTubeVideo = true
    lesson23.order = 9
    lesson23.favorite = true
    lesson23.random = Int64(arc4random_uniform(1000))
    lesson23.selected = false
    lesson23.sortingIndex = 0
    lesson23.alphabet = String(describing: lesson23.title![(lesson23.title!.startIndex)])
    
    let lesson24 = Lesson(context: context)
    lesson24.category = lessonCategoryArray[0]
    lesson24.topic = "Christlike Attributes"
    lesson24.title = "Deep Beauty"
    lesson24.detail = "Sister Elaine S. Dalton tells of how she learned as a young woman what true beauty means. As a young woman, you were born to be a queen."
    lesson24.url = "https://www.youtube.com/watch?v=_Jk4tpPGu_M"
    lesson24.youTubeVideo = true
    lesson24.order = 9
    lesson24.favorite = false
    lesson24.random = Int64(arc4random_uniform(1000))
    lesson24.selected = false
    lesson24.sortingIndex = 0
    lesson24.alphabet = String(describing: lesson24.title![(lesson24.title!.startIndex)])
    
    let lesson25 = Lesson(context: context)
    lesson25.category = lessonCategoryArray[0]
    lesson25.topic = "Atonement"
    lesson25.title = "The Perfect Lie"
    lesson25.detail = "Tiffany saw perfection in her future as a wife, mother, and overachiever. But as checklists grew longer and expectations grew harder to meet, Tiffany felt exhausted and broken."
    lesson25.url = "https://www.youtube.com/watch?v=gIQFLbvuWXc"
    lesson25.youTubeVideo = true
    lesson25.order = 9
    lesson25.favorite = false
    lesson25.random = Int64(arc4random_uniform(1000))
    lesson25.selected = false
    lesson25.sortingIndex = 0
    lesson25.alphabet = String(describing: lesson25.title![(lesson25.title!.startIndex)])
    
    let lesson26 = Lesson(context: context)
    lesson26.category = lessonCategoryArray[0]
    lesson26.topic = "Principles & Ordinances"
    lesson26.title = "Faith - Being an Agent to Act"
    lesson26.detail = "In this new video series, leaders of The Church of Jesus Christ of Latter-day Saints reassure those who may feel unwelcome in the Church that they are loved and needed. They also encourage members to extend the hand of fellowship to others, regardless of perceived differences."
    lesson26.url = "https://www.youtube.com/watch?v=4WIuG9VqG4M"
    lesson26.youTubeVideo = true
    lesson26.order = 9
    lesson26.favorite = false
    lesson26.random = Int64(arc4random_uniform(1000))
    lesson26.selected = false
    lesson26.sortingIndex = 0
    lesson26.alphabet = String(describing: lesson26.title![(lesson26.title!.startIndex)])
    
    let lesson28 = Lesson(context: context)
    lesson28.category = "Temporal"
    lesson28.topic = "Spiritual"
    lesson28.title = "Where Do Good and Evil Come From?"
    lesson28.detail = "If there is a God, why is there so much evil?"
    lesson28.url = "https://www.youtube.com/watch?v=xliyujhwhNM"
    lesson28.youTubeVideo = true
    lesson28.order = 9
    lesson28.favorite = false
    lesson28.random = Int64(arc4random_uniform(1000))
    lesson28.selected = false
    lesson28.sortingIndex = 0
    lesson28.alphabet = String(describing: lesson28.title![(lesson28.title!.startIndex)])
    
    let lesson29 = Lesson(context: context)
    lesson29.category = lessonCategoryArray[0]
    lesson29.topic = "Atonement"
    lesson29.title = "Like a Broken Vessel"
    lesson29.detail = "One in four people in the world will be affected by mental illness at some point in their lives. More than 16 million U.S. adults had at least one major depressive episode in the past year."
    lesson29.url = "https://www.youtube.com/watch?v=IrNqGqy5kbQ"
    lesson29.youTubeVideo = true
    lesson29.order = 9
    lesson29.favorite = true
    lesson29.random = Int64(arc4random_uniform(1000))
    lesson29.selected = false
    lesson29.sortingIndex = 0
    lesson29.alphabet = String(describing: lesson29.title![(lesson29.title!.startIndex)])
    
    let lesson30 = Lesson(context: context)
    lesson30.category = lessonCategoryArray[0]
    lesson30.topic = "Heavenly Father"
    lesson30.title = "Earthly Father, Heavenly Father"
    lesson30.detail = "Men on Earth have the opportunity to become fathers and experience some of the same joys that our Heavenly Father feels for us. Fatherhood is a divine responsibility to be cherished."
    lesson30.url = "https://www.youtube.com/watch?v=R5FxdCgD-qI"
    lesson30.youTubeVideo = true
    lesson30.order = 9
    lesson30.favorite = true
    lesson30.random = Int64(arc4random_uniform(1000))
    lesson30.selected = false
    lesson30.sortingIndex = 0
    lesson30.alphabet = String(describing: lesson30.title![(lesson30.title!.startIndex)])
    
    let lesson31 = Lesson(context: context)
    lesson31.category = "Temporal"
    lesson31.topic = "Relational/Social"
    lesson31.title = "Love - All Of Humanity"
    lesson31.detail = "Charlie Chaplin's inspirational final speech in 'The Great Dictator'."
    lesson31.url = "https://www.youtube.com/watch?v=CsgaFKwUA6g"
    lesson31.youTubeVideo = false
    lesson31.order = 9
    lesson31.favorite = true
    lesson31.random = Int64(arc4random_uniform(1000))
    lesson31.selected = false
    lesson31.sortingIndex = 0
    lesson31.alphabet = String(describing: lesson31.title![(lesson31.title!.startIndex)])
    
    let lesson32 = Lesson(context: context)
    lesson32.category = "Temporal"
    lesson32.topic = "Spiritual"
    lesson32.title = "Does God Exist?"
    lesson32.detail = "4 New Arguments - Science tells us that the universe came into being via The Big Bang. But how do you get from energy and matter to a self-aware human being? "
    lesson32.url = "https://www.youtube.com/watch?v=gIorXcloIac"
    lesson32.youTubeVideo = true
    lesson32.order = 9
    lesson32.favorite = false
    lesson32.random = Int64(arc4random_uniform(1000))
    lesson32.selected = false
    lesson32.sortingIndex = 0
    lesson32.alphabet = String(describing: lesson32.title![(lesson32.title!.startIndex)])
    
    let lesson33 = Lesson(context: context)
    lesson33.category = "Temporal"
    lesson33.topic = "Intellectual"
    lesson33.title = "Internet vs. our Brains"
    lesson33.detail = "Most of us are on the Internet on a daily basis and whether we like it or not, the Internet is affecting us. It changes how we think, how we work, and it even changes our brains."
    lesson33.url = "https://www.youtube.com/watch?v=cKaWJ72x1rI"
    lesson33.youTubeVideo = true
    lesson33.order = 9
    lesson33.favorite = false
    lesson33.random = Int64(arc4random_uniform(1000))
    lesson33.selected = false
    lesson33.sortingIndex = 0
    lesson33.alphabet = String(describing: lesson33.title![(lesson33.title!.startIndex)])
    
    let lesson34 = Lesson(context: context)
    lesson34.category = "Temporal"
    lesson34.topic = "Emotional"
    lesson34.title = "Addiction"
    lesson34.detail = "What causes addiction? Easy, right? Drugs cause addiction. But maybe it is not that simple."
    lesson34.url = "https://www.youtube.com/watch?v=ao8L-0nSYzg"
    lesson34.youTubeVideo = true
    lesson34.order = 9
    lesson34.favorite = false
    lesson34.random = Int64(arc4random_uniform(1000))
    lesson34.selected = false
    lesson34.sortingIndex = 0
    lesson34.alphabet = String(describing: lesson34.title![(lesson34.title!.startIndex)])
    
    let lesson35 = Lesson(context: context)
    lesson35.category = lessonCategoryArray[0]
    lesson35.topic = "Commandments"
    lesson35.title = "What Should I Do When I See Pornography?"
    lesson35.detail = "Call it what it is.\nTurn it off or turn away.\nTalk to a parent or trusted adult."
    lesson35.url = "https://www.youtube.com/watch?v=UNeYQA3ZeX8"
    lesson35.youTubeVideo = true
    lesson35.order = 9
    lesson35.favorite = false
    lesson35.random = Int64(arc4random_uniform(1000))
    lesson35.selected = false
    lesson35.sortingIndex = 0
    lesson35.alphabet = String(describing: lesson35.title![(lesson35.title!.startIndex)])
    
    let lesson37 = Lesson(context: context)
    lesson37.category = lessonCategoryArray[0]
    lesson37.topic = "Endure to the end"
    lesson37.title = "My New Life"
    lesson37.detail = "Stephanie Nielson, survivor of a near-fatal plane crash, shares her story of a beautiful life centered on faith in Jesus Christ and love of family. "
    lesson37.url = "https://www.youtube.com/watch?v=KHDvxPjsm8E"
    lesson37.youTubeVideo = true
    lesson37.order = 9
    lesson37.favorite = false
    lesson37.random = Int64(arc4random_uniform(1000))
    lesson37.selected = false
    lesson37.sortingIndex = 0
    lesson37.alphabet = String(describing: lesson37.title![(lesson37.title!.startIndex)])
    
    let lesson44 = Lesson(context: context)
    lesson44.category = lessonCategoryArray[0]
    lesson44.topic = "Spiritual"
    lesson44.title = "Enemy Territory"
    lesson44.detail = "President Boyd K. Packer shares an experience in which he was protected during World War II by listening to a prompting from the Spirit and promises youth that they will be protected if they heed the promptings that come from the Holy Ghost."
    lesson44.url = "https://www.youtube.com/watch?v=DasSohiV38o"
    lesson44.youTubeVideo = true
    lesson44.order = 9
    lesson44.favorite = false
    lesson44.random = Int64(arc4random_uniform(1000))
    lesson44.selected = false
    lesson44.sortingIndex = 0
    lesson44.alphabet = String(describing: lesson44.title![(lesson44.title!.startIndex)])
    
    let lesson47 = Lesson(context: context)
    lesson47.category = lessonCategoryArray[0]
    lesson47.topic = "Christlike Attributes"
    lesson47.title = "Dare to Stand Alone"
    lesson47.detail = "President Thomas S. Monson shares an experience he had in the Navy when he had to stand alone and reminds us that we are never alone when we stand with our Father in Heaven."
    lesson47.url = "https://www.youtube.com/watch?v=z_92mKlQOlk"
    lesson47.youTubeVideo = true
    lesson47.order = 9
    lesson47.favorite = false
    lesson47.random = Int64(arc4random_uniform(1000))
    lesson47.selected = false
    lesson47.sortingIndex = 0
    lesson47.alphabet = String(describing: lesson47.title![(lesson47.title!.startIndex)])
    
    let lesson50 = Lesson(context: context)
    lesson50.category = lessonCategoryArray[0]
    lesson50.topic = "Commandments"
    lesson50.title = "Chastity: What Are the Limits?"
    lesson50.detail = "Latter-day Saint teens are counseled to stay sexually pure, but what exactly are the limits? Using teachings of modern prophets, this presentation shows why that's the wrong question to ask, as well as how we can find happiness and peace through staying chaste."
    lesson50.url = "https://www.youtube.com/watch?v=gHJoMvJadBg"
    lesson50.youTubeVideo = true
    lesson50.order = 9
    lesson50.favorite = false
    lesson50.random = Int64(arc4random_uniform(1000))
    lesson50.selected = false
    lesson50.sortingIndex = 0
    lesson50.alphabet = String(describing: lesson50.title![(lesson50.title!.startIndex)])
    
    let lesson51 = Lesson(context: context)
    lesson51.category = lessonCategoryArray[0]
    lesson51.topic = "Plan of Salvation"
    lesson51.title = "Our True Identity"
    lesson51.detail = "President Dieter Uchtdorf retells the story of the ugly duckling and urges us to reflect on who we really are—sons and daughters of a glorious Heavenly Father."
    lesson51.url = "https://www.youtube.com/watch?v=wiiadnMvm20"
    lesson51.youTubeVideo = true
    lesson51.order = 9
    lesson51.favorite = false
    lesson51.random = Int64(arc4random_uniform(1000))
    lesson51.selected = false
    lesson51.sortingIndex = 0
    lesson51.alphabet = String(describing: lesson51.title![(lesson51.title!.startIndex)])
    
    let lesson52 = Lesson(context: context)
    lesson52.category = lessonCategoryArray[0]
    lesson52.topic = "Holy Ghost"
    lesson52.title = "Choose the Light"
    lesson52.detail = "A reckless biker finds himself in a battle against time and the elements when he enters a situation he can’t get out of. He discovers his only option is to choose the light."
    lesson52.url = "https://www.youtube.com/watch?v=4OuOMBQoxdc"
    lesson52.youTubeVideo = true
    lesson52.order = 9
    lesson52.favorite = false
    lesson52.random = Int64(arc4random_uniform(1000))
    lesson52.selected = false
    lesson52.sortingIndex = 0
    lesson52.alphabet = String(describing: lesson52.title![(lesson52.title!.startIndex)])
    
    let lesson53 = Lesson(context: context)
    lesson53.category = lessonCategoryArray[0]
    lesson53.topic = "Endure to the end"
    lesson53.title = "The Journey"
    lesson53.detail = "President Dieter F. Uchtdorf recalls fleeing, as a child, from war-torn East Germany with his mother."
    lesson53.url = "https://www.youtube.com/watch?v=ilNeYhAwiUc"
    lesson53.youTubeVideo = true
    lesson53.order = 9
    lesson53.favorite = false
    lesson53.random = Int64(arc4random_uniform(1000))
    lesson53.selected = false
    lesson53.sortingIndex = 0
    lesson53.alphabet = String(describing: lesson53.title![(lesson53.title!.startIndex)])
    
    let lesson54 = Lesson(context: context)
    lesson54.category = lessonCategoryArray[0]
    lesson54.topic = "Plan of Salvation"
    lesson54.title = "Shower of Heavenly Blessings"
    lesson54.detail = "Have you ever felt that Heavenly Father keeps blessings instead of freely sharing them? In reality, He showers us with blessings constantly and it's up to us to decide how to have them reach us. "
    lesson54.url = "https://www.youtube.com/watch?v=8-vXpnKMtUE"
    lesson54.youTubeVideo = true
    lesson54.order = 9
    lesson54.favorite = false
    lesson54.random = Int64(arc4random_uniform(1000))
    lesson54.selected = false
    lesson54.sortingIndex = 0
    lesson54.alphabet = String(describing: lesson54.title![(lesson54.title!.startIndex)])
    
    let lesson55 = Lesson(context: context)
    lesson55.category = lessonCategoryArray[0]
    lesson55.topic = "Christlike Attributes"
    lesson55.title = "Overcoming Fear Through Faith & Hope In God"
    lesson55.detail = "A Mother's Hope: When President Uchtdorf was a young child, he learned that his mother was a great example of how hope and faith in God and in the Gospel of Jesus Christ can help anyone overcome fear."
    lesson55.url = "https://www.youtube.com/watch?v=9ssHhzi7alI"
    lesson55.youTubeVideo = true
    lesson55.order = 9
    lesson55.favorite = false
    lesson55.random = Int64(arc4random_uniform(1000))
    lesson55.selected = false
    lesson55.sortingIndex = 0
    lesson55.alphabet = String(describing: lesson55.title![(lesson55.title!.startIndex)])
    
    let lesson56 = Lesson(context: context)
    lesson56.category = lessonCategoryArray[0]
    lesson56.topic = "Principles & Ordinances"
    lesson56.title = "Flecks of Gold"
    lesson56.detail = "This compelling story of an 1850s gold prospector illustrates how giving service to others blesses our lives."
    lesson56.url = "https://www.youtube.com/watch?v=fEfg-Z-TOc8"
    lesson56.youTubeVideo = true
    lesson56.order = 9
    lesson56.favorite = false
    lesson56.random = Int64(arc4random_uniform(1000))
    lesson56.selected = false
    lesson56.sortingIndex = 0
    lesson56.alphabet = String(describing: lesson56.title![(lesson56.title!.startIndex)])
    
    let lesson57 = Lesson(context: context)
    lesson57.category = lessonCategoryArray[0]
    lesson57.topic = "Commandments"
    lesson57.title = "Addiction: You Will Be Freed"
    lesson57.detail = "Through the Atonement of Jesus Christ, all can be transformed, cleansed, and freed from addiction."
    lesson57.url = "https://www.youtube.com/watch?v=ry8-YIwnEcU"
    lesson57.youTubeVideo = true
    lesson57.order = 9
    lesson57.favorite = true
    lesson57.random = Int64(arc4random_uniform(1000))
    lesson57.selected = false
    lesson57.sortingIndex = 0
    lesson57.alphabet = String(describing: lesson57.title![(lesson57.title!.startIndex)])
    
    let lesson58 = Lesson(context: context)
    lesson58.category = lessonCategoryArray[0]
    lesson58.topic = "Commandments"
    lesson58.title = "Watch Your Step"
    lesson58.detail = "See how a moment's decision can have far-reaching consequences—for good or bad."
    lesson58.url = "https://www.youtube.com/watch?v=gWQ5dPeixdw"
    lesson58.youTubeVideo = true
    lesson58.order = 9
    lesson58.favorite = false
    lesson58.random = Int64(arc4random_uniform(1000))
    lesson58.selected = false
    lesson58.sortingIndex = 0
    lesson58.alphabet = String(describing: lesson58.title![(lesson58.title!.startIndex)])
    
    let lesson59 = Lesson(context: context)
    lesson59.category = lessonCategoryArray[0]
    lesson59.topic = "Plan of Salvation"
    lesson59.title = "We're Still a Family"
    lesson59.detail = "A young man shares how the Plan of Salvation has helped him to see the blessings that can come through trials."
    lesson59.url = "https://www.youtube.com/watch?v=HYRb4DNf8wc"
    lesson59.youTubeVideo = true
    lesson59.order = 9
    lesson59.favorite = false
    lesson59.random = Int64(arc4random_uniform(1000))
    lesson59.selected = false
    lesson59.sortingIndex = 0
    lesson59.alphabet = String(describing: lesson59.title![(lesson59.title!.startIndex)])
    
    let lesson60 = Lesson(context: context)
    lesson60.category = lessonCategoryArray[0]
    lesson60.topic = "Jesus Christ"
    lesson60.title = "Follow Him"
    lesson60.detail = "If we follow Jesus Christ, we will find new life. If we trust Him, He will show us the way back to God."
    lesson60.url = "https://www.youtube.com/watch?v=Pz00iuorG2Q"
    lesson60.youTubeVideo = true
    lesson60.order = 9
    lesson60.favorite = true
    lesson60.random = Int64(arc4random_uniform(1000))
    lesson60.selected = false
    lesson60.sortingIndex = 0
    lesson60.alphabet = String(describing: lesson60.title![(lesson60.title!.startIndex)])
    
    let lesson64 = Lesson(context: context)
    lesson64.category = "Temporal"
    lesson64.topic = "Spiritual"
    lesson64.title = "Science and God?"
    lesson64.detail = "Why are we here? Literally. The latest science says we shouldn’t be."
    lesson64.url = "https://www.youtube.com/watch?v=UjGPHF5A6Po"
    lesson64.youTubeVideo = true
    lesson64.order = 9
    lesson64.favorite = false
    lesson64.random = Int64(arc4random_uniform(1000))
    lesson64.selected = false
    lesson64.sortingIndex = 0
    lesson64.alphabet = String(describing: lesson64.title![(lesson64.title!.startIndex)])
    
    let lesson66 = Lesson(context: context)
    lesson66.category = "Temporal"
    lesson66.topic = "Emotional"
    lesson66.title = "The Farmer Story"
    lesson66.detail = "Good, Bad...who knows?"
    lesson66.url = "https://www.youtube.com/watch?v=P3P7f0Zg9wk"
    lesson66.youTubeVideo = true
    lesson66.order = 9
    lesson66.favorite = false
    lesson66.random = Int64(arc4random_uniform(1000))
    lesson66.selected = false
    lesson66.sortingIndex = 0
    lesson66.alphabet = String(describing: lesson66.title![(lesson66.title!.startIndex)])
    
    let lesson67 = Lesson(context: context)
    lesson67.category = "Temporal"
    lesson67.topic = "Relational/Social"
    lesson67.title = "Don't Compare Yourself to Others"
    lesson67.detail = "Have you ever envied someone else's success? Do you sometimes wish you had another person's life? Well, comedian Tom Shillue explains why comparing yourself to other people will put you on the fast track to an unhappy life."
    lesson67.url = "https://www.youtube.com/watch?v=0MPG-aLD-EY"
    lesson67.youTubeVideo = true
    lesson67.order = 9
    lesson67.favorite = false
    lesson67.random = Int64(arc4random_uniform(1000))
    lesson67.selected = false
    lesson67.sortingIndex = 0
    lesson67.alphabet = String(describing: lesson67.title![(lesson67.title!.startIndex)])
    
    let lesson68 = Lesson(context: context)
    lesson68.category = "Temporal"
    lesson68.topic = "Relational/Social"
    lesson68.title = "It's Not About The Nail"
    lesson68.detail = "“Don't try to fix it. I just need you to listen.” Every man has heard these words. And they are the law of the land. No matter what."
    lesson68.url = "https://www.youtube.com/watch?v=-4EDhdAHrOg"
    lesson68.youTubeVideo = true
    lesson68.order = 9
    lesson68.favorite = false
    lesson68.random = Int64(arc4random_uniform(1000))
    lesson68.selected = false
    lesson68.sortingIndex = 0
    lesson68.alphabet = String(describing: lesson68.title![(lesson68.title!.startIndex)])
    
    let lesson69 = Lesson(context: context)
    lesson69.category = lessonCategoryArray[0]
    lesson69.topic = "Jesus Christ"
    lesson69.title = "He Lives"
    lesson69.detail = "Because of the Resurrection, Jesus Christ lives. Because of Him, you can overcome sin and experience everlasting joy."
    lesson69.url = "https://www.youtube.com/watch?v=BZqTRSVA1YA"
    lesson69.youTubeVideo = true
    lesson69.order = 9
    lesson69.favorite = false
    lesson69.random = Int64(arc4random_uniform(1000))
    lesson69.selected = false
    lesson69.sortingIndex = 0
    lesson69.alphabet = String(describing: lesson69.title![(lesson69.title!.startIndex)])
    
    let lesson70 = Lesson(context: context)
    lesson70.category = "Spiritual"
    lesson70.topic = "Atonement"
    lesson70.title = "A New Life"
    lesson70.detail = "My belief in Jesus Christ has given me a new life. The life that is full of happiness, the life that is full of miracles, the life that is full of blessings."
    lesson70.url = "https://www.youtube.com/watch?v=tRSZBINJ0eA"
    lesson70.youTubeVideo = true
    lesson70.order = 9
    lesson70.favorite = false
    lesson70.random = Int64(arc4random_uniform(1000))
    lesson70.selected = false
    lesson70.sortingIndex = 0
    lesson70.alphabet = String(describing: lesson70.title![(lesson70.title!.startIndex)])
    
    let lesson71 = Lesson(context: context)
    lesson71.category = lessonCategoryArray[0]
    lesson71.topic = "Spiritual"
    lesson71.title = "The Music of the Gospel"
    lesson71.detail = "The joy of the dance will be experienced only when we come to hear the music."
    lesson71.url = "https://www.youtube.com/watch?v=ju8S2vswhjY"
    lesson71.youTubeVideo = true
    lesson71.order = 9
    lesson71.favorite = false
    lesson71.random = Int64(arc4random_uniform(1000))
    lesson71.selected = false
    lesson71.sortingIndex = 0
    lesson71.alphabet = String(describing: lesson71.title![(lesson71.title!.startIndex)])
    
    let lesson75 = Lesson(context: context)
    lesson75.category = "Temporal"
    lesson75.topic = "Physical"
    lesson75.title = "A Message From Your Body"
    lesson75.detail = "“Hey you, please take care of me!”"
    lesson75.url = "https://www.youtube.com/watch?v=YEP30_iM-ZI"
    lesson75.youTubeVideo = true
    lesson75.order = 9
    lesson75.favorite = false
    lesson75.random = Int64(arc4random_uniform(1000))
    lesson75.selected = false
    lesson75.sortingIndex = 0
    lesson75.alphabet = String(describing: lesson75.title![(lesson75.title!.startIndex)])
    
    let lesson76 = Lesson(context: context)
    lesson76.category = lessonCategoryArray[0]
    lesson76.topic = "Principles & Ordinances"
    lesson76.title = "Covenants"
    lesson76.detail = "Elder Nelson Talks on making and keeping sacred covenants is a precious doctrine of The Church of Jesus Christ of Latter-day Saints, according to prophets and apostles who lead the Church."
    lesson76.url = "https://www.youtube.com/watch?v=kGR2guh4qVQ"
    lesson76.youTubeVideo = true
    lesson76.order = 9
    lesson76.favorite = false
    lesson76.random = Int64(arc4random_uniform(1000))
    lesson76.selected = false
    lesson76.sortingIndex = 0
    lesson76.alphabet = String(describing: lesson76.title![(lesson76.title!.startIndex)])
    
    let lesson77 = Lesson(context: context)
    lesson77.category = lessonCategoryArray[0]
    lesson77.topic = "Spiritual"
    lesson77.title = "Temple Garment"
    lesson77.detail = "Temple garments are worn by faithful Latter-day Saints as a reminder of sacred beliefs and commitments. Sometimes inaccurately referred to as “Mormon underwear” or “magical underwear.”"
    lesson77.url = "https://www.youtube.com/watch?v=SkTz_NQqKA8"
    lesson77.youTubeVideo = true
    lesson77.order = 9
    lesson77.favorite = true
    lesson77.random = Int64(arc4random_uniform(1000))
    lesson77.selected = false
    lesson77.sortingIndex = 0
    lesson77.alphabet = String(describing: lesson77.title![(lesson77.title!.startIndex)])
    
    let lesson78 = Lesson(context: context)
    lesson78.category = lessonCategoryArray[0]
    lesson78.topic = "Heavenly Father"
    lesson78.title = "The Power of Prayer"
    lesson78.detail = "Prayer is how we reach out to God. And more often than not, prayer lets God reach into our hearts and fill us with His love."
    lesson78.url = "https://www.youtube.com/watch?v=WRhLK0TCmiQ"
    lesson78.youTubeVideo = true
    lesson78.order = 9
    lesson78.favorite = false
    lesson78.random = Int64(arc4random_uniform(1000))
    lesson78.selected = false
    lesson78.sortingIndex = 0
    lesson78.alphabet = String(describing: lesson78.title![(lesson78.title!.startIndex)])
    
    let lesson79 = Lesson(context: context)
    lesson79.category = lessonCategoryArray[0]
    lesson79.topic = "Perfect the Saints"
    lesson79.title = "You Never Know How Much Good You Do"
    lesson79.detail = "How many things did you get checked off your “to- do” list today?"
    lesson79.url = "https://www.youtube.com/watch?v=3n-DOKBffuU"
    lesson79.youTubeVideo = true
    lesson79.order = 9
    lesson79.favorite = true
    lesson79.random = Int64(arc4random_uniform(1000))
    lesson79.selected = false
    lesson79.sortingIndex = 0
    lesson79.alphabet = String(describing: lesson79.title![(lesson79.title!.startIndex)])
    
    let lesson80 = Lesson(context: context)
    lesson80.category = lessonCategoryArray[0]
    lesson80.topic = "Christlike Attributes"
    lesson80.title = "Bearing Our Burdens with Hope"
    lesson80.detail = "Being happy does not always mean being without hardship. Sometimes it means just the opposite."
    lesson80.url = "https://www.youtube.com/watch?v=aoe1-YXuuKU"
    lesson80.youTubeVideo = true
    lesson80.order = 9
    lesson80.favorite = false
    lesson80.random = Int64(arc4random_uniform(1000))
    lesson80.selected = false
    lesson80.sortingIndex = 0
    lesson80.alphabet = String(describing: lesson80.title![(lesson80.title!.startIndex)])
    
    let lesson81 = Lesson(context: context)
    lesson81.category = lessonCategoryArray[0]
    lesson81.topic = "Plan of Salvation"
    lesson81.title = "Am I Good Enough?"
    lesson81.detail = "If you will really try and will not rationalize or rebel—repenting often and pleading for grace—you positively are going to be “good enough.”"
    lesson81.url = "https://www.youtube.com/watch?v=RGXit7LwV-E"
    lesson81.youTubeVideo = true
    lesson81.order = 9
    lesson81.favorite = true
    lesson81.random = Int64(arc4random_uniform(1000))
    lesson81.selected = false
    lesson81.sortingIndex = 0
    lesson81.alphabet = String(describing: lesson81.title![(lesson81.title!.startIndex)])
    
    let lesson83 = Lesson(context: context)
    lesson83.category = "Temporal"
    lesson83.topic = "Environmental"
    lesson83.title = "Emergancy Preparedness"
    lesson83.detail = "72 Hour Kits"
    lesson83.url = "https://www.asecurelife.com/72-hour-kit/"
    lesson83.youTubeVideo = false
    lesson83.order = 9
    lesson83.favorite = false
    lesson83.random = Int64(arc4random_uniform(1000))
    lesson83.selected = false
    lesson83.sortingIndex = 0
    lesson83.alphabet = String(describing: lesson83.title![(lesson83.title!.startIndex)])
    
    let lesson84 = Lesson(context: context)
    lesson84.category = lessonCategoryArray[0]
    lesson84.topic = "Forgiveness"
    lesson84.title = "The Shiny Bicycle"
    lesson84.detail = "Everybody makes mistakes, and even though it's not easy, with the help of Heavenly Father and Jesus Christ we can receive forgiveness for our sins."
    lesson84.url = "https://www.youtube.com/watch?v=ItEsXGhcOEs"
    lesson84.youTubeVideo = true
    lesson84.order = 9
    lesson84.favorite = false
    lesson84.random = Int64(arc4random_uniform(1000))
    lesson84.selected = false
    lesson84.sortingIndex = 0
    lesson84.alphabet = String(describing: lesson84.title![(lesson84.title!.startIndex)])
    
    let lesson85 = Lesson(context: context)
    lesson85.category = lessonCategoryArray[0]
    lesson85.topic = "Christlike Attributes"
    lesson85.title = "The Coat: A Story of Charity"
    lesson85.detail = "Did you know that this touching story of selflessness and love is true? "
    lesson85.url = "https://www.youtube.com/watch?v=cp3IH8ZNviQ"
    lesson85.youTubeVideo = true
    lesson85.order = 9
    lesson85.favorite = false
    lesson85.random = Int64(arc4random_uniform(1000))
    lesson85.selected = false
    lesson85.sortingIndex = 0
    lesson85.alphabet = String(describing: lesson85.title![(lesson85.title!.startIndex)])
    
    let lesson86 = Lesson(context: context)
    lesson86.category = lessonCategoryArray[0]
    lesson86.topic = "Plan of Salvation"
    lesson86.title = "Happy Families"
    lesson86.detail = "Mormon Channel playlist of happy families can be together forever."
    lesson86.url = "https://www.youtube.com/playlist?list=PLAYgY8SPtEWGLQuG5emKY0mdwCKSL-po1"
    lesson86.youTubeVideo = false
    lesson86.order = 9
    lesson86.favorite = false
    lesson86.random = Int64(arc4random_uniform(1000))
    lesson86.selected = false
    lesson86.sortingIndex = 0
    lesson86.alphabet = String(describing: lesson86.title![(lesson86.title!.startIndex)])
    
    let lesson87 = Lesson(context: context)
    lesson87.category = lessonCategoryArray[0]
    lesson87.topic = "Atonement"
    lesson87.title = "Jesus Christ - A Little Better"
    lesson87.detail = "Mormon Channel playlist with 1 on 1 testimonies about Jesus Christ."
    lesson87.url = "https://www.youtube.com/playlist?list=PLAYgY8SPtEWGdk48FbKS9nIJ4mEcj_U5x"
    lesson87.youTubeVideo = false
    lesson87.order = 9
    lesson87.favorite = true
    lesson87.random = Int64(arc4random_uniform(1000))
    lesson87.selected = false
    lesson87.sortingIndex = 0
    lesson87.alphabet = String(describing: lesson87.title![(lesson87.title!.startIndex)])
    
    let lesson88 = Lesson(context: context)
    lesson88.category = lessonCategoryArray[0]
    lesson88.topic = "Endure to the end"
    lesson88.title = "Dealing with: Temptations, Trials, Trauma, and Tragedy"
    lesson88.detail = "Mormon Channel teaches how His Grace heals all."
    lesson88.url = "https://www.youtube.com/playlist?list=PLAYgY8SPtEWG9lP4x8bbGgbUccxWmyzRk"
    lesson88.youTubeVideo = false
    lesson88.order = 9
    lesson88.favorite = true
    lesson88.random = Int64(arc4random_uniform(1000))
    lesson88.selected = false
    lesson88.sortingIndex = 0
    lesson88.alphabet = String(describing: lesson88.title![(lesson88.title!.startIndex)])
    
    let lesson89 = Lesson(context: context)
    lesson89.category = lessonCategoryArray[0]
    lesson89.topic = "Principles & Ordinances"
    lesson89.title = "Gospel Principles Animated"
    lesson89.detail = "Kids animated videos that teach Gospel principles."
    lesson89.url = "https://www.youtube.com/playlist?list=PLe0BvbTylcNPKsUQ04uWphFcVyP-zYsmN"
    lesson89.youTubeVideo = false
    lesson89.order = 9
    lesson89.favorite = true
    lesson89.random = Int64(arc4random_uniform(1000))
    lesson89.selected = false
    lesson89.sortingIndex = 0
    lesson89.alphabet = String(describing: lesson89.title![(lesson89.title!.startIndex)])
    
    let lesson90 = Lesson(context: context)
    lesson90.category = "Spiritual"
    lesson90.topic = "Proclaim the Gospel"
    lesson90.title = "I'm a Mormon"
    lesson90.detail = "Videos from people all over the world testify how they are members of the Church of Jesus Christ of Latter Day Saints."
    lesson90.url = "https://www.youtube.com/playlist?list=PLC3919215DCC6CBE1"
    lesson90.youTubeVideo = false
    lesson90.order = 9
    lesson90.favorite = true
    lesson90.random = Int64(arc4random_uniform(1000))
    lesson90.selected = false
    lesson90.sortingIndex = 0
    lesson90.alphabet = String(describing: lesson90.title![(lesson90.title!.startIndex)])
    
    let lesson91 = Lesson(context: context)
    lesson91.category = lessonCategoryArray[0]
    lesson91.topic = "Spiritual"
    lesson91.title = "Mormon Beliefs"
    lesson91.detail = "Mormon.org shares a series of videos that explain the LDS core beliefs."
    lesson91.url = "https://www.youtube.com/playlist?list=PLq9T3v5R_q8tvJpdXgLHnLH8h0b0dxbGH"
    lesson91.youTubeVideo = false
    lesson91.order = 9
    lesson91.favorite = true
    lesson91.random = Int64(arc4random_uniform(1000))
    lesson91.selected = false
    lesson91.sortingIndex = 0
    lesson91.alphabet = String(describing: lesson91.title![(lesson91.title!.startIndex)])
    
    let lesson92 = Lesson(context: context)
    lesson92.category = lessonCategoryArray[0]
    lesson92.topic = "Spiritual"
    lesson92.title = "Mormon Messages"
    lesson92.detail = "LDS youth videos for youth and adults to help bring them closer to the Savior, Jesus Christ."
    lesson92.url = "https://www.youtube.com/playlist?list=PL6C2E726B40648A1B"
    lesson92.youTubeVideo = false
    lesson92.order = 9
    lesson92.favorite = true
    lesson92.random = Int64(arc4random_uniform(1000))
    lesson92.selected = false
    lesson92.sortingIndex = 0
    lesson92.alphabet = String(describing: lesson92.title![(lesson92.title!.startIndex)])
    
    let lesson93 = Lesson(context: context)
    lesson93.category = "Temporal"
    lesson93.topic = "Spiritual"
    lesson93.title = "Meet the Mormons"
    lesson93.detail = "The Meet the Mormons movie examines the very diverse lives of six devout members of The Church of Jesus Christ of Latter-day Saints (Mormons)."
    lesson93.url = "https://www.youtube.com/watch?v=iS6PZh6tCC0"
    lesson93.youTubeVideo = true
    lesson93.order = 9
    lesson93.favorite = false
    lesson93.random = Int64(arc4random_uniform(1000))
    lesson93.selected = false
    lesson93.sortingIndex = 0
    lesson93.alphabet = String(describing: lesson93.title![(lesson93.title!.startIndex)])
    
    let lesson94 = Lesson(context: context)
    lesson94.category = "Temporal"
    lesson94.topic = "Emotional"
    lesson94.title = "Power of Words"
    lesson94.detail = "Sticks and stones will break my bones, but words will never hurt me. Wrong. Words can break your heart."
    lesson94.url = "https://www.youtube.com/watch?v=jT6hSFAsrhY"
    lesson94.youTubeVideo = true
    lesson94.order = 9
    lesson94.favorite = false
    lesson94.random = Int64(arc4random_uniform(1000))
    lesson94.selected = false
    lesson94.sortingIndex = 0
    lesson94.alphabet = String(describing: lesson94.title![(lesson94.title!.startIndex)])
    
    let lesson95 = Lesson(context: context)
    lesson95.category = "Temporal"
    lesson95.topic = "Intellectual"
    lesson95.title = "Hollywood Media vs. Your Mind"
    lesson95.detail = "Imagine a group so powerful they could beam ideas directly into your head. Well, you don't have to imagine -- it's Hollywood."
    lesson95.url = "https://www.youtube.com/watch?v=vjMYCnI5kz0"
    lesson95.youTubeVideo = true
    lesson95.order = 9
    lesson95.favorite = true
    lesson95.random = Int64(arc4random_uniform(1000))
    lesson95.selected = false
    lesson95.sortingIndex = 0
    lesson95.alphabet = String(describing: lesson95.title![(lesson95.title!.startIndex)])
    
    let lesson96 = Lesson(context: context)
    lesson96.category = "Spiritual"
    lesson96.topic = "Restoration"
    lesson96.title = "The First Vision"
    lesson96.detail = "Joseph Smith saw God the Father and His son, Jesus Christ."
    lesson96.url = "https://www.youtube.com/watch?v=uwrKvraWP1M"
    lesson96.youTubeVideo = true
    lesson96.order = 9
    lesson96.favorite = true
    lesson96.random = Int64(arc4random_uniform(1000))
    lesson96.selected = false
    lesson96.sortingIndex = 0
    lesson96.alphabet = String(describing: lesson96.title![(lesson96.title!.startIndex)])
    
    let lesson97 = Lesson(context: context)
    lesson97.category = "Spiritual"
    lesson97.topic = "Heavenly Father"
    lesson97.title = "Discovering Truth"
    lesson97.detail = "What is truth, and how can we know it? President Dieter F. Uchtdorf explains"
    lesson97.url = "https://www.youtube.com/watch?v=hXiGaV8tY5M"
    lesson97.youTubeVideo = true
    lesson97.order = 9
    lesson97.favorite = true
    lesson97.random = Int64(arc4random_uniform(1000))
    lesson97.selected = false
    lesson97.sortingIndex = 0
    lesson97.alphabet = String(describing: lesson97.title![(lesson97.title!.startIndex)])
    
    let lesson98 = Lesson(context: context)
    lesson98.category = "Temporal"
    lesson98.topic = "Environmental"
    lesson98.title = "Fix Yourself"
    lesson98.detail = "Want to make the world a better place? Start by bettering yourself."
    lesson98.url = "https://www.youtube.com/watch?v=o73pqQ9Gzt4"
    lesson98.youTubeVideo = true
    lesson98.order = 9
    lesson98.favorite = false
    lesson98.random = Int64(arc4random_uniform(1000))
    lesson98.selected = false
    lesson98.sortingIndex = 0
    lesson98.alphabet = String(describing: lesson98.title![(lesson98.title!.startIndex)])
    
    let lesson99 = Lesson(context: context)
    lesson99.category = "Temporal"
    lesson99.topic = "Spiritual"
    lesson99.title = "Trials are Often Blessings in Disguise"
    lesson99.detail = "Our struggles and trials are often worth it in the end."
    lesson99.url = "https://www.youtube.com/watch?v=TizrHKEqvqA"
    lesson99.youTubeVideo = true
    lesson99.order = 9
    lesson99.favorite = false
    lesson99.random = Int64(arc4random_uniform(1000))
    lesson99.selected = false
    lesson99.sortingIndex = 0
    lesson99.alphabet = String(describing: lesson99.title![(lesson99.title!.startIndex)])
    
    let lesson100 = Lesson(context: context)
    lesson100.category = "Temporal"
    lesson100.topic = "Spiritual"
    lesson100.title = "LDS Charities Initiatives"
    lesson100.detail = "Our struggles and trials are often worth it in the end."
    lesson100.url = "https://www.youtube.com/watch?v=THnD6Cp9Rk0&list=PL-2ihKjhqm0VC7M-lfJPxz9H7HZvIYKEC"
    lesson100.youTubeVideo = true
    lesson100.order = 9
    lesson100.favorite = false
    lesson100.random = Int64(arc4random_uniform(1000))
    lesson100.selected = false
    lesson100.sortingIndex = 0
    lesson100.alphabet = String(describing: lesson100.title![(lesson100.title!.startIndex)])
    
    
    
    ad.saveContext()
}
