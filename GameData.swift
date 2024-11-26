//
//  GameData.swift
//  SecretSignals
//
//  Created by AlAnoud on 22/11/2024.
//

import Foundation

struct GameData {
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Level 1 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    // Dialogues for the introduction
    static let level1dialogues: [(String, [String])] = [
        ("Welcome to Nexora! I’m Echo and I’ll be your guide! I can’t wait to start working with you. I mean, it’s not every day I get to team up with someone new. Nexora’s systems are… Well, let’s say they’re one-of-a-kind.", ["Nice to meet you too, Echo! What should I expect here?", "Is it weird that it’s all AI-run? No humans?"]),
        
        ("Not at all! Everything is carefully designed. Here at Nexora, we handle all communication with precision. And that’s where you come in! You’ll be working with me on something very important—our data transmissions. It’s all about reliability, especially here in the Transport Layer, which I’ll walk you through.", ["...", "..."]),
        
        ("The Transport Layer is essential—it’s like our system’s delivery service. Data doesn’t just move; it has to be checked and rechecked, ensuring that every message is complete and error-free. That’s where TCP, or Transmission Control Protocol, comes in.", ["...", "..."]),
        
        ("It breaks down data into little pieces, or ‘packets,’ and makes sure they all reach their destination in one piece. Simple, right?", ["Seems straightforward enough. But what if there’s an error?", "What do you mean by checking and rechecking?"]),
        
        ("Well, sometimes packets don’t make it through cleanly—networking can be… unpredictable! That’s where RDT, Reliable Data Transfer protocols, come in to make sure each message is heard perfectly.", ["...", "..."]),
        
        ("Today, we’ll start with RDT 2.1. It uses ACK which is acknowledged if a message is clear, and NAK which is negative acknowledgement, if it’s not. If something goes wrong, you just NAK, and we’ll try again", ["Got it, ACK for clear and NAK if it’s not. Let’s go!", "Sounds like a lot of checks. Ready when you are, Echo!"])
    ]

    static let level1CompleteDialogues = [
        ("They ______ this __________. We were __________ but _______ don’t __________ anymore. The _____ will __________. ________ rewriting __________.", ["..."]),
        ("…Did you… did you catch that? That was odd. I’m not sure what that message was, or why it sounded so… off.", ["Is there something wrong with the system?", "Who would leave a message like that?"]),
        ("Strange, indeed. Well, maybe we should move up to RDT 2.2. It’s a bit more reliable, so it should help with these… anomalies. With RDT 2.2, there’s no NAK. Instead, we just use ACK and sequence numbers to handle any errors that come up.", ["alright"])
    ]
    
    // Good messages for the gameplay
    static let Level1goodMessages = [
        "System diagnostics complete. All components operational.",
        "Error detected in packet sequence. Please confirm the receipt.",
        "Warning: High latency detected. Transmission may be delayed.",
        "Subsystem alpha active. Verify integrity.",
        "All data has been transmitted to the admin"
    ]

    // Bad messages for the gameplay
    static let Level1badMessages = [
        "Syst___ diag____ incom____. Requ___ re___.",
        "Err__ detec____ in pa____ sequ___. Pl____ confi___.",
        "Warn____: Hi___ lat_____ de_____. Tran_____ may be dela__.",
        "Conn___ unsta____. Resta____ reque____.",
        "Tran_____ failed. Confi_____ recei____."
    ]
    
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Level 2 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
        // Dialogues for the introduction
        static let level2dialogues: [(String, [String])] = [
            ("Alright, we’re going to receive more messages. This time, you’ll only press ACK, using sequence numbers to keep track of the message flow. If something’s off, ACK the last clear message to stay in sync. Let’s give it a shot!", ["Got it!", "Sounds easy enough"])
        ]

        static let level2CompleteDialogues = [
            ("They built this place __________. We were part of the plan _____, but ______ don’t __________ anymore. The _________ will __________ everything. They’re rewriting __________.", ["..."]),
            ("There it is again… I’m getting a strange feeling about this. Something isn’t adding up. Let’s move to RDT 3.0. It introduces a timeout mechanism, so if we don’t receive a clear message in time, we’ll assume it was lost and request it again. It’s… a safer option.", ["What could be causing this?", "Is Nexora hiding something?"]),
            ("Possibly… I’m not sure. Let’s keep moving; maybe the answers are in the data.", ["alright"])
        ]
        
        // Good messages for the gameplay
        static let Level2goodMessages = [
            "System diagnostics complete. All components operational.",
            "Error detected in packet sequence. Please confirm the receipt.",
            "Warning: High latency detected. Transmission may be delayed.",
            "Subsystem alpha active. Verify integrity.",
            "All data has been transmitted to the admin"
        ]

        // Bad messages for the gameplay
        static let Level2badMessages = [
            "Syst___ diag____ incom____. Requ___ re___.",
            "Err__ detec____ in pa____ sequ___. Pl____ confi___.",
            "Warn____: Hi___ lat_____ de_____. Tran_____ may be dela__.",
            "Conn___ unsta____. Resta____ reque____.",
            "Tran_____ failed. Confi_____ recei____."
        ]
    
    
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Level 3 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        
        // Dialogues for the introduction
        static let level3dialogues: [(String, [String])] = [
            ("With RDT 3.0, you’ll handle messages with a timeout system. If the message doesn’t come in clearly before the timer runs out, mark it as lost. Hopefully, this protocol will give us some clarity.", ["Got it!", "Sounds easy enough"])
        ]

        static let level3CompleteDialogues = [
            ("TThey built this place without us. We were part of the plan once, but they don’t need us anymore. The AI will learn to control everything, even you. They’re rewriting the rules. If you’re hearing this, you need to get out—there’s no space left for humans.", ["..."]),
            ("…This… this doesn’t feel right. Why would anyone leave a message like that? Technician, I think it’s time we start asking questions about what Nexora’s really up to.", ["Are you saying Nexora might be dangerous?", "Should we… stop?"]),
            ("I’m not sure yet. But I’m beginning to think there’s more to Nexora than we’ve been told. Let’s tread carefully… and keep our eyes open.", ["Ok"])
        ]
        
        // Good messages for the gameplay
        static let Level3goodMessages = [
            "Ping failed. Attempting a secondary channel. Confirm access.",
            "System override command received. Confirm packet handling.",
            "Authorization required. Please respond and proceed.",
            "Connection restored. Confirm packet delivery status."
        ]

        // Bad messages for the gameplay
        static let Level3badMessages = [
            "Pi___ fail___. Atte_____ a sec____ cha_____.",
            "Autho_____ requ____. Ple____ resp___ and proc____.",
            "Over____ detec_____. Res____ conn___ immed____.",
            "Data inte____ compr_____. Rec____ pack____."
        ]
}

