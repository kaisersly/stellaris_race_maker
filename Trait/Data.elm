module Trait.Data (all) where


import Effect.Factory exposing (..)
import Trait exposing (Trait, Family(..))


all : List Trait
all =
  [
    -- Positive
    { family = ExtremelyNonAdaptive
    , name = "Adaptive"
    , description = "This species is highly adaptive when it comes to foreign environments."
    , points = 2
    , effects =
        [ habitability 10
        ]
    }
  , { family = None
    , name = "Agrarian"
    , description = "This species has a deep connection to the land and make expert farmers and gardeners."
    , points = 2
    , effects =
        [ foodOutput 1
        ]
    }
  , { family = CharismaticRepugnant
    , name = "Charismatic"
    , description = "Members of this species have a special charisma and are generally considered pleasant to be around."
    , points = 1
    , effects =
        [ otherSpeciesHappinessPerPop 1
        ]
    }
  , { family = CommunalSolitary
    , name = "Communal"
    , description = "Members of this species are highly communal and quite used to living in close proximity to others."
    , points = 1
    , effects =
        [ happiness 1
        ]
    }
  , { family = None
    , name = "Conformists"
    , description = "These people always seek consensus and are more likely to conform to the governing ethics."
    , points = 2
    , effects =
        [ ethicsDivergence -20
        ]
    }
  , { family = EnduringVenerable
    , name = "Enduring"
    , description = "Lifespans in this species are unusually long."
    , points = 1
    , effects =
        [ leaderLifespan 30
        ]
    }
  , { family = ExtremelyNonAdaptive
    , name = "Extremely Adaptive"
    , description = "This species is remarkably adept at adopting to any foreign environments."
    , points = 5
    , effects =
        [ habitability 20
        ]
    }
  , { family = None
    , name = "Industrious"
    , description = "Members of this species are known for their diligence and hard-working nature, always going above and beyond."
    , points = 2
    , effects =
        [ minerals 15
        ]
    }
  , { family = None
    , name = "Intelligent"
    , description = "This species is highly intelligent and enjoys faster technological progress."
    , points = 2
    , effects =
        [ engineeringOutput 10
        , physicsOutput 10
        , societyOutput 10
        ]
    }
  , { family = NaturalEngineersPhysicistsSociologists
    , name = "Natural Engineers"
    , description = "Members of this species have a natural inclination towards engineering and the material sciences."
    , points = 1
    , effects =
        [ engineeringOutput 15
        ]
    }
  , { family = NaturalEngineersPhysicistsSociologists
    , name = "Natural Physicists"
    , description = "Members of this species have a natural inclination towards theoretical physics and astral phenomena."
    , points = 1
    , effects =
        [ physicsOutput 15
        ]
    }
  , { family = NaturalEngineersPhysicistsSociologists
    , name = "Natural Sociologists"
    , description = "Members of this species have a natural inclination towards sociology and biological studies."
    , points = 1
    , effects =
        [ societyOutput 15
        ]
    }
  , { family = NomadicSedentary
    , name = "Nomadic"
    , description = "This species has a nomadic past, and its members often think nothing when relocation to another world."
    , points = 1
    , effects =
        [ migrationTime -50
        ]
    }
  , { family = QuickSlowLearners
    , name = "Quick Learners"
    , description = "Members of this species are quick to learn from experiences."
    , points = 1
    , effects =
        [ leaderExperienceGain 25
        ]
    }
  , { family = RapidSlowBreeders
    , name = "Rapid Breeders"
    , description = "This species reproduces at a very rapid rate, increasing population growth."
    , points = 1
    , effects =
        [ growthTime -10
        ]
    }
  , { family = None
    , name = "Resilient"
    , description = "Members of this species are physiologically resilient and will fight like enraged brood mothers to defend their worlds."
    , points = 1
    , effects =
        [ militiaHealth 100
        , bombardmentResistance 200
        ]
    }
  , { family = VeryStrongWeak
    , name = "Strong"
    , description = "Members of this species possess great physical strength, making them formidable fighters on the ground."
    , points = 1
    , effects =
        [ armyDamage 20
        , minerals 5
        ]
    }
  , { family = None
    , name = "Talented"
    , description = "Members of this species are born with a natural aptitude."
    , points = 2
    , effects =
        [ leaderSkillLevels 1
        ]
    }
  , { family = None
    , name = "Thrifty"
    , description = "Members of this species are instinctively economical and are always looking to make a good profit, whatever corners need cutting."
    , points = 2
    , effects =
        [ energyCredits 15
        ]
    }
  , { family = EnduringVenerable
    , name = "Venerable"
    , description = "This species can grow to an age that commands dignity and respect."
    , points = 4
    , effects =
        [ leaderLifespan 120
        ]
    }
  , { family = VeryStrongWeak
    , name = "Very Strong"
    , description = "Members of this species possess a strength that almost defies the laws of physics."
    , points = 4
    , effects =
        [ armyDamage 40
        , minerals 10
        ]
    }

    -- Negative
    , { family = None
    , name = "Decadent"
    , description = "This species requires slaves or servants to feel content."
    , points = -1
    , effects =
      [ resourceOutputWithoutSlaves -10
      ]
    }
    , { family = ExtremelyNonAdaptive
    , name = "Nonadaptive"
    , description = "This species does not adapt well to foreign environments."
    , points = -1
    , effects =
      [ habitability -10
      ]
    }
    , { family = CharismaticRepugnant
    , name = "Repugnant"
    , description = "The physical appearance and customs of this species are considered offensive to most others and few appreciate them as neighbors."
    , points = -1
    , effects =
      [ otherSpeciesHappinessPerPop -1
      ]
    }
    , { family = NomadicSedentary
    , name = "Sedentary"
    , description = "This species has a sedentary past, and its members are reluctant to migrate away from where they grew up."
    , points = -1
    , effects =
      [ migrationTime 50
      ]
    }
    , { family = RapidSlowBreeders
    , name = "Slow Breeders"
    , description = "This species reproduces at a slow rate, lowering population growth."
    , points = -1
    , effects =
      [ growthTime 15
      ]
    }
    , { family = QuickSlowLearners
    , name = "Slow Learners"
    , description = "Members of this species are slow to learn from their experiences."
    , points = -1
    , effects =
      [ leaderExperienceGain -25
      ]
    }
    , { family = CommunalSolitary
    , name = "Solitary"
    , description = "Members of this species tend to be solitary and territorial, often becoming agitated in crowded conditions."
    , points = -1
    , effects =
      [ happiness -5
      ]
    }
    , { family = VeryStrongWeak
    , name = "Weak"
    , description = "Members of this species are physically weaker than average, making them poor fighters on the ground."
    , points = -1
    , effects =
      [ armyDamage -20
      ]
    }
  ]
