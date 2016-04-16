module Government.Data (all) where


import Effect.Factory exposing (..)
import Government exposing (Government)


all : List Government
all =
  [
    -- Autocracies
    { name = "Military Dictatorship"
    , description = "This government is a militaristic form of autocracy, with the ruler serving as the undisputed head of the military which is firmly in control of the state apparatus."
    , rulerTitle = "Grand Marshal"
    , unlockedIf = ["Militarist", "Fanatic Militarist"]
    , lockedIf = ["Individualist", "Fanatic Individualist"]
    , effects =
        [ fleetSizeLimit 10
        , shipUpkeep -10
        , simpleEffect "Can build an oversized ship"
        , simpleEffect "Admirals/generals are eligible for rulership"
        ]
    }
  , { name = "Divine Mandate"
    , description = "This government is a spiritualistic form of autocracy, where the ruler is treated as a divine symbol. Organized religion is widely employed in support of the state apparatus."
    , rulerTitle = "Archprophet"
    , unlockedIf = ["Spiritualist", "Fanatic Spiritualist"]
    , lockedIf = ["Individualist", "Fanatic Individualist"]
    , effects =
        [ slaveryTolerance 50
        , warTolerance 50
        , simpleEffect "Can build a mausoleum, which grants -10% ethics divergence on the planet on which it is built"
        ]
    }
  , { name = "Despotic Hegemony"
    , description = "This government is a materialistic form of autocracy, where citizens are viewed as little more than cogs in the state machinery. Efficiency and technological progress are valued above all things."
    , rulerTitle = "Overseer"
    , unlockedIf = ["Materialist", "Fanatic Materialist"]
    , lockedIf = ["Individualist", "Fanatic Individualist"]
    , effects =
        [ researchSpeed 5
        , surveySpeed 10
        , simpleEffect "Can build an elite assault army"
        ]
    }
  , { name = "Enlightened Monarchy"
    , description = ""
    , rulerTitle = ""
    , unlockedIf = ["Pacifist", "Fanatic Pacifist"]
    , lockedIf = ["Individualist", "Fanatic Individualist"]
    , effects =
        [ edictCost -25
        , planetaryEdictDuration 25
        , coreSectorPlanets 1
        , simpleEffect "Can build a special park building"
        ]
    }
  , { name = "Despotic Empire"
    , description = "This government is a relatively pure form of autocracy, with an absolute ruler that governs the state with an iron gripping appendage."
    , rulerTitle = "Emperor"
    , unlockedIf = []
    , lockedIf = ["Individualist", "Fanatic Individualist"]
    , effects =
        [ buildingCost -15
        , slaveMineralOutput 10
        , slaveFoodOutput 10
        , simpleEffect "Can build an oversized military station"
        ]
    }


    -- Oligarchies
  , { name = "Military Junta"
    , description = "This government is a militaristic form of oligarchy, where power rests with a council of high-ranking military officers who oversee all matters of state."
    , rulerTitle = "Archon"
    , unlockedIf = ["Militarist", "Fanatic Militarist"]
    , lockedIf = ["Fanatic Collectivist", "Fanatic Individualist"]
    , effects =
        [ shipCost -10
        , shipUpgradeCost -25
        , simpleEffect "Admirals/generals are eligible for rulership"
        ]
    }
  , { name = "Theocratic Oligarchy"
    , description = ""
    , rulerTitle = "Inquisitor"
    , unlockedIf = ["Spiritualist", "Fanatic Spiritualist"]
    , lockedIf = ["Fanatic Collectivist", "Fanatic Individualist"]
    , effects =
        [ ethicsDivergence -10
        ]
    }
  , { name = "Science Directorate"
    , description = "This government is a materialist form of oligarchy, where a committee of scientists supervises the government apparatus for maximum efficiency."
    , rulerTitle = "Director"
    , unlockedIf = ["Materialist", "Fanatic Materialist"]
    , lockedIf = ["Fanatic Collectivist", "Fanatic Individualist"]
    , effects =
        [ researchAlternative 1
        , simpleEffect "Scientists are eligible for Leadership"
        ]
    }
  , { name = "Peaceful Bureaucracy"
    , description = "This government is a pacifist form of oligarchy, where a complicated system of bureaucracy governs all aspects of society to ensure the safety of the citizenry."
    , rulerTitle = "Coordinator"
    , unlockedIf = ["Pacifist", "Fanatic Pacifist"]
    , lockedIf = ["Fanatic Collectivist", "Fanatic Individualist"]
    , effects =
        [ leaderCapacity 4
        , leaderRecruitmentCost -15
        ]
    }
  , { name = "Plutocratic Oligarchy"
    , description = "This is a plutocratic form of oligarchy, ruled by a wealthy elite. A citizen's personal wealth translates directly into political power."
    , rulerTitle = "Executive"
    , unlockedIf = []
    , lockedIf = ["Fanatic Collectivist", "Fanatic Individualist"]
    , effects =
        [ energyCredits 5
        , minerals 5
        ]
    }


    -- Democracies
  , { name = "Military Republic"
    , description = ""
    , rulerTitle = "Consul"
    , unlockedIf = ["Militarist", "Fanatic Militarist"]
    , lockedIf = ["Collectivist", "Fanatic Collectivist"]
    , effects =
        [ armyUpkeep -15
        , shipUpkeep -15
        , warTolerance 25
        , simpleEffect "Admirals/generals are eligible for rulership"
        ]
    }
  , { name = "Theocratic Republic"
    , description = ""
    , rulerTitle = ""
    , unlockedIf = ["Spiritualist", "Fanatic Spiritualist"]
    , lockedIf = ["Collectivist", "Fanatic Collectivist"]
    , effects =
        [ ethicsDivergence -10
        ]
    }
  , { name = "Direct Democracy"
    , description = "This government is a materialistic form of democracy, where citizens use computer networks to vote directly on most matters regarding the state."
    , rulerTitle = "Chancellor"
    , unlockedIf = ["Materialist", "Fanatic Materialist"]
    , lockedIf = ["Collectivist", "Fanatic Collectivist"]
    , effects =
        [ coreSectorPlanets 4
        ]
    }
  , { name = "Moral Democracy"
    , description = "This government is a pacifistic form of democracy, firmly guided by moralist principles and non-violence."
    , rulerTitle = ""
    , unlockedIf = ["Pacifist", "Fanatic Pacifist"]
    , lockedIf = ["Collectivist", "Fanatic Collectivist"]
    , effects =
        [ happiness 10
        ]
    }
  , { name = "Indirect Democracy"
    , description = "This government is an indirect democracy, where citizens vote on officials who are elected to represent them."
    , rulerTitle = "President"
    , unlockedIf = []
    , lockedIf = ["Collectivist", "Fanatic Collectivist"]
    , effects =
        [ leaderSkillLevels 1
        , leaderRecruitmentCost -10
        ]
    }
  ]
