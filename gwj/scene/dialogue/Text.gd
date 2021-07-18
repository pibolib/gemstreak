extends Node

#This is the container file for all of the dialogue in the game.
#Dialogue is stored as an array, like the following example string.
#\n is not required between strings. The dialogue handler automatically handles it.

var exampledialogue = [
	"This is an example dialogue array.",
	"Automatic line breaks are inserted like this.",
	"For consistency, dialogue between characters should look something like this:",
	"CHARACTER 1: text text text",
	"text text text (continued)",
	"CHARACTER 2: text text text",
	"so on and so forth."
]

var prologue = [
	"LEFT CLICK TO PROCEED. RIGHT CLICK TO SKIP.\n\nYOU FIND A STRANGE MACHINE IN THE WOODS. IT IS CONSTRUCTED FROM AN OTHERWORLDLY MATERIAL THE LIKES OF WHICH YOU HAVE NEVER SEEN. ITS EDGES GLOW WITH A FAINT BLUE, AND THE WALLS HAVE THE COLOR OF CLAY. A VOICE COMES FROM WITHIN.\n\n???: Who are you? Why have you come here?\n",
	"A CALM BREEZE FLOWS FROM THE MYSTERIOUS MACHINE.\nYOU BEGIN TO HEAR FOOTSTEPS FOLLOWING THE BREEZE.\nA GREY-HAIRED, BEARDED MAN WALKS TOWARDS YOU.\n\nOLD MAN: I beg of you, do not come in.\n\nA VOICE ENTERS YOUR BRAIN, COMMANDING YOU TO ENTER.\nDREAD FILLS YOUR BODY, AND 'YOU' COMMAND YOUR BODY TO ENTER THE MACHINE.\nTHE OLD MAN'S EXPRESSION DEGRADES.\nTHE MACHINE'S DOOR SHUTS CLOSED WITH A CLICK.\n\nOLD MAN: I am so sorry, my child, but I must welcome you to this here time machine, for it may be a while until we are set free from its curse.\n\n",
	"YOU LOOK AROUND THE INSIDES OF THE MACHINE. \nIT APPEARS TO COME FROM SEVERAL PERIODS IN TIME, SOMEHOW CONSTRUCTED IN A WAY THAT MAKES IT LOOK LIKE IT WAS MADE 2000 YEARS AGO AND 2000 YEARS IN THE FUTURE.\n\nIT SEEMS THAT THE OLD MAN IS RIGHT, IT MAY BE A WHILE UNTIL YOU'RE FREE FROM THE CURSE OF THE TIME MACHINE."
]
var tutorial = [
	"OLD MAN: Now listen here, my child, this machine will only let us go if we return it to its proper time. \nThis machine hasn't been fueled since the dawn of humanity, and so we cannot use its normal functions. \nHowever, there is an emergency option we can use.\n\nTHE OLD MAN GROANS AS HE STRUGGLES TO MOTION YOU OVER TO A SMALL BOX. \nYOU STRUGGLE TO BREATHE AS YOU MOVE TOWARDS THE BOX. \nTHE BOX CONTAINS A SMALL TERMINAL, WHICH FLASHES WITH LIFE AS IT OPENS BY ITSELF.\n\nOLD MAN: You, child, are worthy of bringing us back to our homes. The Box will teach you how to do so.",
	"PLEASE PAY ATTENTION TO THE TOP OF THE SCREEN AS IT GIVES YOU INSTRUCTIONS.\nYOU CAN EXPERIMENT WITH WHAT YOU LEARN IN THE PLAYFIELD."
]
var level1before = [
	"OLD MAN: My child, lead us to 1900, that is the farthest we can go until we have to refuel.\nThis box allows you to fuel up this machine. Choose your placements wisely.\nDid you know, my child, that a mother and a father divorced and fought over child custody during this era? \nIndeed, the whole world got dragged into this family feud of sorts and many lost their lives.\nAnyways, Godspeed, child.",
]
var level1after = [
	"OLD MAN: Excellent job, my child. We are 100 years closer to bringing us home.\n\nHE PUTS HIS HAND ON HIS NECK.\n\nOLD MAN: I apologize for my error, what I said earlier is not accurate to historical facts.\nWhat actually happened is as follows:\nTwo deadly World Wars occurred, between many great states, such as Russia, Germany, the United States, the United Kingdom, and many others.\n\nI suppose I should introduce myself. My name is Gunderson, but you may call me Gundy. \nNow, let's get on with the 19th century!"
]
var level2before = [
	"GUNDY: So, here we are at the cusp of travelling through the 1800's.\nMy child, never underestimate short people. \nWhy not? Well, one short stack managed to take control of over half a continent at one point.\nNow, let's get on with it! I want to get home already."
]
var level2after = [
	"GUNDY: Ah! Now I remember. \nA ‘short' man named Napoleon came into power in France, and his actions drew the ire of many different nations in Europe, and as such formed many coalitions against him and his French government.\nThis is going to be a long travel with me around, huh. . .\n\nYOU COMFORT HIM WITH A PAT ON THE BACK.\n\nGUNDY: Thank you, child. Now, let's get on with it!"
]
var level3before = [
	"GUNDY: Hey, you love your parents, right?\nWell, regardless, you shouldn't be like some 13 kids in this era, they rebelled, abandoned their parents home and spilled all of their precious tea!\nJust like me. . .\nAnyways, c'mon! Save us from being stuck in time!"
]
var level3after = [
	"GUNDY: Well, shit. Here we go again. I apologize, my memory seems to be failing me.\nAt least my memory isn't as bad as my first wife, who ‘forgot' she was married to me.\nAnyways, I think I know what actually happened. \nAre you ready for a history lesson with your old man?\n\n13 colonies, located in North America, rebelled against the Great British Empire, and won. The 13 colonies went on to become a global powerhouse in later centuries. Oh, and the tea was no joke. Tea was actually spilled in a harbor at one point."
]
var level4before = [
	"GUNDY: Okay, hm, what do I remember from this era. . .\n\nOh, I remember a baguette and some tea shook up their uh. . . tables?\n\nYeah, that's right the baguette got bigger and the tea became sweeter, that's right.\nDo you like tea? I like tea. I want to go back home to get tea. . ."
]
var level4after = [
	"GUNDY: Okay. . . I'll stop complaining, you whippersnappers!\n\nYOU HAVE NO CLUE WHOM HE IS REFERRING TO.\n\nGUNDY: This will be a history lesson for you, okay? \n\nThe French became an absolute monarchy and expanded their territory, while over in the great tea land of England, their Parliament became dominant in politics rather than their King."
]
var level5before = [
	"MACHINE: WARNING. WARNING. CORRUPTION IN CLOCK COMPARTMENT DETECTED.\n\nSPEND  YOUR  TIME  WISELY.\n\nGUNDY: Shit. . . Godspeed my child. \nUnder these circumstances, the time you see at the start is all you'll have.\nI'll see what I can do about that.\nIn the meantime, I remember that a family split in two in this time period, I think."
]
var level5after = [
	"GUNDY: Okay so, this is how it actually went, the political climate in Europe revolved mostly religious conflicts setting the foundation for the Thirty Years War.\nHow it got to that point was the split between the Protestants and the Catholics in the Christian religion.",
	"Hmm. . . this is a tough cookie to bite.\n\nYOU SEE GUNDY ADJUSTING WIRES AND SWITCHES IN A CONTROL PANEL.\n\nGUNDY: Huh. . . it has been a while since I've touched these wires.\nSay. . . can you help me?\n\nYOUR HEART TAKES CONTROL AND REFUSES WITH A POLITE NOD.\n\nGUNDY: Fair enough, please continue to save us, my child."
]
var level6before = [
	"GUNDY: Honestly, I do not know where I am from.\nI do not know how I came to be. \nAll I know is that I am cursed to be here until someone comes into a machine.\nI hope you can be the machine's and my savior.\n\nIf only my friend Roman was here. . ."
]
var level6after = [
	"GUNDY: The Byzantine Empire, also known as the Eastern Roman Empire, more or less fell to the Ottomans, and the Renaissance took Europe by storm.\nThat makes me wonder what happened to the people I presumably knew.\nPerhaps after I was brought here, they were taken care for?\nI certainly hope so. . .",
	"YOU COMFORT GUNDY, TELLING STORIES OF YOUR OWN CHILDHOOD.\n\nGUNDY: Hmm. . . you must've had a lovely life thus far. . .\n\nYOU SEE GUNDY LOST IN THOUGHT, GEARS RUNNING IN HIS HEAD.\nYOU ASK IF HE IS ALRIGHT.\n\nGUNDY: I am fine, my child. Now, let's move on, shall we?"
]
var level7before = [
	"GUNDY: Hey, my child, please satisfy my curiosity, will you?\nWhat is the only thing that you would be truly persistent in?\n\nYOU ANSWER.\n\nGUNDY: Oh. . . I see. Well, mine would be to see my wife, my children, and their children once again.\n\nI remember two cousins fighting for a long time, and a dark-clothed doctor killing the both of them. . . I hope they were not of my family."
]
var level7after = [
	"GUNDY: Uh. . . I'm sorry, I don't remember anything about this era.\nMachine, could you give an explanation?\n\nMACHINE: WHAT MAKES YOU THINK YOU CAN JUST-\n\nWHATEVER.\nTHE KINGDOMS OF ENGLAND AND FRANCE DUKED IT OUT IN THE WEIRDLY NAMED HUNDRED YEARS' WAR, AND THE SCOURGE THAT WAS THE BLACK DEATH TOOK HOLD IN EUROPE FOR A LITTLE WHILE.\n\nGUNDY: Well, it was not exactly how I described it, but at least I was in the ballpark, right? Heheh.\n\nYOU DO NOT LAUGH IN RETURN.\nAN AWKWARD SILENCE TAKES HOLD.",
	"GUNDY: Anyways. . . what century is up next?"
]
var level8before = [
	"GUNDY: You know, I never expected to be where you found me.\nI never expected you to come in the first place.\nThis may be a time machine, but my memory is human, after all.\nNo one expects people to enter their lives, for better or for worse.\nBut, life goes on, and we must go on through time and space to get back home.\nNo matter how great we build up our creations here, all of it will be washed away in the beaches of time. . ."
]
var level8after = [
	"MACHINE: THE MONGOL EMPIRE FOUND THEIR RISE IN POWER IN THIS CENTURY, WHICH SPANNED FROM EASTERN ASIA AND EASTERN EUROPE AT THE HEIGHT OF THEIR ERA. \n\nGUNDY: Hm, did they even last long? With how great and expansive they were, surely there were regional rivals. . .\n\nMACHINE: THEY LASTED 162 YEARS.\n\nGUNDY: Huh. . . not bad. Not bad at all.\nUnfortunately, I think people would forget about me and the dead in less time than that."
]
var level9before = [
	"GUNDY: Once when I was a boy, my parents pushed me to get lost in books.\nYou know, of fiction and non-fiction. \nI personally loved books that told of tales of old, the time of fairy tales.\nBut, deep down I know that it is fiction, and it saddens me.\nHowever, at least fiction will always live on in the hearts of peoples' imaginations."
]
var level9after = [
	"YOU SEE GUNDY GET EXCITED.\n\nGUNDY: Oh! I know about this! Literacy began to spread throughout Europe separate from the Christian Church, and a lot of churchmen took up secular jobs. As a side note, Gothic architecture began to spring up in France, and by the end of this century the House of Anjou and Capetian Dynasty began to rely on mercenaries and paid soldiers year round.\n\nYOU GET SUDDENLY WEIRDED OUT ABOUT HIS SPECIFIC KNOWLEDGE OF THIS ERA.\n\nGUNDY: What? Can't a man have his interests?\n\nYOU ROLL YOUR EYES.\n\nGUNDY: Just do your job and get us out of here, whippersnapper!"
]
var level10before = [
	"MACHINE: ERROR. ERROR. CLOCK SET TO OVERDRIVE. \nPLEASE RESET THE CLOCK ACCORDING TO THE MANUAL.\n\nGUNDY: Shit. . . I fucked something up didn't I. . .\nI just made your job a lot worse. . . sorry about that.\n\nGUNDY RETURNS TO THE CONTROL PANEL.",
	"GUNDY: Hmm. . . if you love somebody, you should let them be free right?\nWell, not for these people. \nThis person desperately wanted another to be their partner, and could not let them go.\nThey fought and killed for them for years to come.\n\nAs for another incident, a couple split up after irreconcilable differences arose.\n\nAs for another, a rivalry of three for the heart of someone ended after a person named Will defeated the other two and took the heart of their now partner for himself.\n\nI hope nothing poor to this degree ever happens to you."
]
var level10after = [
	"GUNDY: The Christian Crusades began from this century on, however the Great Schism separated the Church in twain, between the Western Latin Church and the Eastern Church.\nThe Holy Roman Empire ascended in this time period, Scotland became more of a singular kingdom, and William the Conqueror came out of a dispute between three claimants to the English throne as king. \n\nYOU COMMENT ON HOW HE LIKES TO TALK ABOUT WESTERN HISTORY.\n\nGUNDY: Well, that's all my monkey brain can store!\nI wish I could know with immediate memory recall all of the events of history in my head, but I am not a robot!",
	"MACHINE: WELL I AM.\n\nGUNDY: Shut up you dumb machine!\n\nMACHINE: ERROR. ERROR.\n\nGUNDY: WHAT NOW??\n\nMACHINE: JUST WANTED TO SCARE YOU. :) CLOCK IS STILL BROKEN, THOUGH.\n\nGUNDY: Ugh. "
]
var level11before = [
	"GUNDY: You know, the people love to see an Emperor being powerful.\nIt lets them know that a country is prospering, and that in turn they themselves will prosper.\nThat's not always the case of course, but I wonder if it happens in the time you originally come from.\nI remember many boats coming from the north to find baguettes, and two great powers arising in the east of Europa."
]
var level11after = [
	"GUNDY: Ah, now the image seems much more clear now. The Byzantine Empire sees its height of power and strength, as does the Muslim nations. China becomes reunited under the Song dynasty, and Vikings begin to settle in northern France.\nHmm. . . I remember when my family was led by my father and mother. Those were the good days.\nI miss them to this day, even if it's been decades since I last spoke to them."
]
var level12before = [
	"GUNDY: Sometimes, whenever I am in here, I see visions.\nVisions of warriors, visions of scribes, visions of great people, those sorts of things.\nEarlier, while you were powering the machine, I saw great warriors coming from the north, and I had a crown on my head.\nI was afraid to lose my kingdom and was terrified of the many boats that came onto my shores.\nAll I see is a helmet of horns, burned in my memory.\nPlease, help me get my mind off of things by bringing us home."
]
var level12after = [
	"GUNDY: Ah! My father told me of the story of the Great Britain during this time period! How could I have forget about this?\n\nYOU CHUCKLE AS YOU OBSERVE GUNDY'S APPARENT AGE.\n\nGUNDY: Shut up, I know what you are thinking.\n\nYOU IMMEDIATELY SNAP TO ATTENTION.\n\nGUNDY: Anyways, the Viking Age lived on in this century following the previous, and multiple petty kingdoms of England were conquered by the Danish Great Heathen Army. \nWessex, located in the south of England, remained the only full and whole Anglo-Saxon kingdom left. Alfred the Great of Wessex pushed back the Viking threat, and created the border between Anglo-Saxon kingdoms and the Danelaw after the Battle of Ethandun in 878.",
	"GUNDY IMMEDIATELY AFTERWARDS RUNS OUT OF BREATH, GASPING FOR AIR.\nYOU RUSH OVER TO GUNDY WITH THE TERMINAL TO ASSIST HIM.\nGUNDY UNDERGOES A FIT OF COUGHS BEFORE RETURNING TO NORMAL.\n\nGUNDY: Thank you for helping me. . . I am fine now.\n\nYOU SIGH OF RELIEF, NOT WANTING THIS OLD MAN TO DIE BEFORE YOU HEAD BACK HOME.\n\nGUNDY: Now, we are over half way there! I can almost see my family and us returning to our homes once again!"
]
var level13before = [
	"GUNDY: It never feels right to see your story being corrupted and made to fit another person's story, right?\nI remember a person, who used to be my best friend, lie and twist and do all sorts of things to fit his narrative.\nHe took my job, he made me pay for his luxury.\nPerhaps that is why I found myself lost in a forest.\nThat day is clear in my mind now."
]
var level13after = [
	"MACHINE: THE BYZANTINE EMPIRE BEGAN TO PAY TRIBUTES TO BULGARIA, ALONG WITH JUSTINIAN II GIVING THE TITLE OF CAESAR OF BYZANTIUM TO BULGARIA'S EMPEROR. BUDDHA'S LIFE WAS TRANSLATED INTO GREEK IN THIS TIME PERIOD, AND CHRISTIANS BEGAN TO READ IT AS THE STORY OF BARLAAM AND JOSAPHAT.\n\nGUNDY: Ah. . . I wonder why the Emperor had to give up all those things to another Emperor. Hm, perhaps politics got in the way of his greatness. . .\nI never really got into politics, I just like watching and observing.\nHell, my relatives called me the “Silent Watcher”, heh.\n\nYOU ROLL YOUR EYES AT THE NAME.\nLUCKILY, GUNDY WAS DISTRACTED WITH TRYING TO REPAIR THE MACHINE.\n\nGundy: Ahh. . . I should be almost done, why don't you try to travel a few more hundred years? I think I'll have it done by then. . ."
]
var level14before = [
	"GUNDY: You know, I remember six other people taking control of my job along with that ‘friend'.\nIt is similar in this time period as well. \nSeven friends took power in their own separate real estate property.\nBut, another person outside of this seven were losing their property to a rival from the east."
]
var level14after = [
	"GUNDY: Ahh. . . I wonder how those 7 people are doing.\n\nI sincerely hope they burn in hell.",
	"AN AWKWARD SILENCE ONCE AGAIN SETS.\nGUNDY SEES YOUR UNCOMFORTABLENESS.\n\nGUNDY: Anyways. . . Machine, may you please explain what happened in this era?\n\nMACHINE: OF COURSE. THE SEVEN ANGLO-SAXON KINGDOMS ROSE TO BE THE POWERS OF ENGLAND. THE BYZANTINE EMPIRE WERE SETBACK BY THE EVER-EXPANDING ISLAMIC INFLUENCE. POPE BONIFACE III ENSURED BY AGREEMENT WITH A BYZANTINE EMPEROR THAT THE TITLE OF 'UNIVERSAL BISHOP' BELONGED ONLY TO THE BISHOP OF ROME."
]
var level15before = [
	"YOU DISSOCIATE, SEEING A VISION OF PEOPLE CELEBRATING IN A WORLD OF PREVALENT MACHINERY.\nBEFORE LONG, YOU SNAP BACK TO REALITY.\nGUNDY BECOMES BURNT BY THE WIRES OF THE MACHINE.\n\nGUNDY: Shit!\n\nMACHINE: WARNING. WARNING. \nTIMELINE DISRUPTED. \nFUEL USAGE AT UNSUSTAINABLE EXTREME.\nBE CAUTIOUS. MACHINE MAY FAIL AT ANY TIME.\n\nGUNDY: Please. . . please save us, child. I will be fine. We need to bring YOU home, however. \nI must not and will not die failing in this cause.\nYou must become our leader, for our sake."
]
var level15after = [
	"GUNDY: Ah shit. . . I don't think I can fix this.\nI am sorry, you are on your own.\nOnly you can work under these conditions.\nPlease succeed. . . for our sakes.\n\nMACHINE: AFTER THE WESTERN ROMAN EMPIRE FELL, THE SITUATION IN EUROPE BECAME WAR-TORN, WITH MANY SMALL KINGDOMS VYING FOR WEALTH AND POWER. THE EASTERN ROMAN EMPIRE CONTINUING TO SURVIVE AND THRIVE UNDER EMPEROR JUSTINIAN. SILK REACHES THE BYZANTINE EMPIRE VIA CHINA AND BECOMES A PROTECTED INDUSTRY IN ITS PALACES. "
]
var level16before = [
	"GUNDY: Listen to me, if you ever come across my people, please be sensitive.\nLike the people of this time period, we almost fell to many invading forces.\nThe people of this time period died, leaving their spiritual relatives to live on without them.\n\nDo not fall to people undeserving of the chance to kill you."
]
var level16after = [
	"GUNDY: Thank you for being so kind to me. . .\nWhen we go back to our homes, I will be sure to tell my family and friends and town to honor you.\n\nYOU BLUSH AT THE IDEA OF BEING HONORED.\n\nGUNDY: Don't be shy, my child. You deserve all of the honor for the valor you displayed here.\nHmm, but I am curious what we just traveled through. Machine, please explain.\n\nMACHINE: THE WESTERN ROMAN EMPIRE FINALLY COLLAPSES TO MANY DIFFERENT KINGDOMS DUE TO INSTABILITY IN THE EMPIRE AND ONE WEAK EMPEROR AFTER ANOTHER. THE VISIGOTHS RANSACKED ROME, THE VANDALS OCCUPIED CARTHAGE IN AFRICA, AND THE HUNS INVADED THE EMPIRE."
]
var level17before = [
	"GUNDY: Perhaps you can follow the example of this popular fellow.\n\nYOU SEE OUT A SMALL WINDOW A MAN WITH A CROWN.\n\nGUNDY: They stabilized an empire, and allowed it to prosper for eternity.\n\nYOU FEEL SOMETHING WRONG WITH THAT DESCRIPTION.\n\nGUNDY: I can tell you are skeptical, but it's true! This man took the reins of an empire and it lived on forever!\nBut that's not here or there, I do not want to be in this blasted machine forever!"
]
var level17after = [
	"GUNDY: Time really is the best medicine. \n. . .\n\nI am surprised I actually said that, given that we are traveling back in time. . .\nLuckily time healed me after what my wife did. . .\nMy family also heealed from it, which was great.\n\nYOU WONDER HOW MANY TIMES THIS MAN HAS EXPERIENCED DOMESTIC VIOLENCE.\n\nGUNDY: Anyways, Machine, please tell us what happened here.\n\nMACHINE: THE LAST TRUE EMPEROR OF ALL OF THE ROMAN EMPIRE WAS THEODOSIUS I, AND AFTER HIS DEATH THE EMPIRE FORMALLY SPLIT BETWEEN THE EAST AND THE WEST. CONSTANTINE EARLIER IN THE CENTURY SELECTED THE AREA NOW KNOWN AS CONSTANTINOPLE AS THE IMPERIAL CAPITAL OF THE EMPIRE. CHRISTIANITY BECAME THE OFFICIAL STATE RELIGION, WITH EARLIER ROMAN PAGAN RELIGIONS DISAPPEARING."
]
var level18before = [
	"GUNDY: You know how a family feud can split up family members for a long period of time?\nWell, this family split into three until a father figure stepped up and got everyone's shit together.\nYeah, that's right, I put my family back together again, well until my aforementioned job dispute.\nI wonder what is happening to them now. . ."
]
var level18after = [
	"GUNDY: Tell me, were there any social upheavals during your time?\n\nYOU EXPLAIN TO HIM ALL OF THE ‘CURRENT EVENTS' OF YOUR LIFE BEFORE YOU ENTERED THE MACHINE.\nYOU SEE GUNDY WITH A FACE OF DISBELIEF.\n\nGUNDY: Oh. . . oh, I see. \nSo nothing's changed, hm?\nHumanity is still selfish and only works for their self-interest. \nWonderful. Just great.\nMachine, distract us from this, please.\n\nMACHINE: THE ROMAN EMPIRE EXPERIENCED A CRISIS IN IT WAS SPLIT IN THREE DUE TO CIVIL WARS AND UPHEAVALS, UNTIL EMPEROR AURELIAN RECONQUERED THE REBELLING TERRITORIES AND EMPEROR DIOCLETIAN STABILIZED THE EMPIRE WITH DIVIDING IT BETWEEN THE TETRARCHS THAT THE CRISIS WAS ENDED."
]
var level19before = [
	"GUNDY: A great empire's time was almost coming to an end here, and they are about to find their fall soon.\nHuh. . . just like my family. . .\nOh well, at the very least they had five wonderful people leading my family until I went away."
]
var level19after = [
	"GUNDY: Wow. . . I cannot believe it. We are almost there!!\nWe have traveled 1900 years. . . 100 more to go.\nGodspeed, my child. Godspeed.\n\nMACHINE: THE ROMAN EMPIRE SAW ITS GREATEST EXPANSE UNDER EMPEROR TRAJAN, AND IN THIS ERA PAX ROMANA ENDED AFTER THE DEATH OF THE LAST OF THE FIVE GOOD EMPERORS. IN CHINA, THE HAN DYNASTY TOOK ITS PLACE OF POWER AND HAD INFLUENCE IN CENTRAL ASIA, BUT WAS HIGHLY CORRUPTED AND STRUGGLED AGAINST REBELLION."
]
var level20before = [
	"GUNDY: Alright. . . we are almost there. C'mon, we must go to the Mediterranean and get back to my family!\nThis time was an unstable time, but I am sure my family is safe. \nAfter all, after many years of studying your time's books, they never wrote of the place I come from.\nI remember a person named Roman being strange for a time, being erratic, but soon he was well again.\nI miss that guy.\nAlright, c'mon! Save us!"
]
var level20after = [
	"MACHINE: EUROPE, NORTH AFRICA, AND THE NEAR EAST BECAME DOMINATED BY THE ROMAN EMPIRE, AND WAS STABILIZED FOR A LITTLE WHILE UNDER AUGUSTUS AFTER THE LAST BCE CENTURY. HOWEVER, AFTER NERO'S DEATH, THE YEAR OF FOUR EMPERORS AND MORE CIVIL WARS AND INSTABILITY OCCURRED, UNTIL THE REIGN OF EMPEROR VESPASIAN, UNDER WHOM ROME PROSPERED. THIS CENTURY ALSO SAW THE BEGINNINGS OF CHRISTIANITY.",
	"GUNDY: Well done, my child.\n\nGUNDY GROANS AS HE SLOWLY WALKS TO THE DOOR.\n\nGUNDY: C'mon, let me bring you home.\n\nYOU AGREE TO GUIDE HIM OPEN THE DOOR.\nYOU TWO STRUGGLE TO TWIST OPEN THE DOOR LOCKS.\nTHE DOOR OPENS, LETTING IN FRESH AIR.\nYOU HAVE NEVER SMELLED SUCH CLEAN AIR BEFORE.\n\nGUNDY: Welcome home, my lost true child.",
	"A SOMEWHAT FAMILIAR PLACE IS REVEALED BEFORE YOUR EYES.\nLOUD CELEBRATION RINGS THROUGHOUT THE WORLD.\nTHE MACHINERY HELPS TO AMPLIFY THE NOISE.\n\nGUNDY: Now, what will you do, my child?"
]
