module Effect.Factory (..) where


import Effect exposing (Effect)


simpleEffect : String -> Effect
simpleEffect name =
  { name = name
  , amount = 0
  , suffix = ""
  , moreIsBetter = False
  }


alienSlaveryTolerance : Int -> Effect
alienSlaveryTolerance amount =
  { name = "Alien slavery tolerance"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


allianceCost : Int -> Effect
allianceCost amount =
  { name = "Alliance cost"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = False
  }


armyDamage : Int -> Effect
armyDamage amount =
  { name = "Army damage"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


armyUpkeep : Int -> Effect
armyUpkeep amount =
  { name = "Army upkeep"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = False
  }


bombardmentResistance : Int -> Effect
bombardmentResistance amount =
  { name = "Bombardment resistance"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


buildingCost : Int -> Effect
buildingCost amount =
  { name = "Building cost"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = False
  }


coreSectorPlanets : Int -> Effect
coreSectorPlanets amount =
  { name = "Core sector planets"
  , amount = amount
  , suffix = ""
  , moreIsBetter = True
  }


edictCost : Int -> Effect
edictCost amount =
  { name = "Edict cost"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = False
  }


energyCredits : Int -> Effect
energyCredits amount =
  { name = "Energy credits"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


engineeringOutput : Int -> Effect
engineeringOutput amount =
  { name = "Engineering output"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = False
  }


ethicsDivergence : Int -> Effect
ethicsDivergence amount =
  { name = "Ethics divergence"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = False
  }


fleetSizeLimit : Int -> Effect
fleetSizeLimit amount =
  { name = "Fleet size limit"
  , amount = amount
  , suffix = ""
  , moreIsBetter = True
  }


food : Int -> Effect
food amount =
  { name = "Food"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


foodOutput : Int -> Effect
foodOutput amount =
  { name = "Food output"
  , amount = amount
  , suffix = ""
  , moreIsBetter = True
  }


foodRequirement : Int -> Effect
foodRequirement amount =
  { name = "Food requirement"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = False
  }


growthTime : Int -> Effect
growthTime amount =
  { name = "Growth time"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = False
  }


habitability : Int -> Effect
habitability amount =
  { name = "Habitability"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


happiness : Int -> Effect
happiness amount =
  { name = "Happiness"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


leaderCapacity : Int -> Effect
leaderCapacity amount =
  { name = "Leader capacity"
  , amount = amount
  , suffix = ""
  , moreIsBetter = True
  }


leaderExperienceGain : Int -> Effect
leaderExperienceGain amount =
  { name = "Leader experience gain"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


leaderLifespan : Int -> Effect
leaderLifespan amount =
  { name = "Leader lifespan"
  , amount = amount
  , suffix = ""
  , moreIsBetter = True
  }


leaderRecruitmentCost : Int -> Effect
leaderRecruitmentCost amount =
  { name = "Leader recruitment cost"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = False
  }


leaderSkillLevels : Int -> Effect
leaderSkillLevels amount =
  { name = "Leader skill levels"
  , amount = amount
  , suffix = ""
  , moreIsBetter = True
  }


migrationTime : Int -> Effect
migrationTime amount =
  { name = "Migration time"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = False
  }


militiaHealth : Int -> Effect
militiaHealth amount =
  { name = "Militia health"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


minerals : Int -> Effect
minerals amount =
  { name = "Minerals"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


otherSpeciesHappinessPerPop : Int -> Effect
otherSpeciesHappinessPerPop amount =
  { name = "Other species happiness per POP"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


physicsOutput : Int -> Effect
physicsOutput amount =
  { name = "Physics output"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


planetaryEdictDuration : Int -> Effect
planetaryEdictDuration amount =
  { name = "Planetary edict duration"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


researchAlternative : Int -> Effect
researchAlternative amount =
  { name = "Research alternative"
  , amount = amount
  , suffix = ""
  , moreIsBetter = True
  }


researchSpeed : Int -> Effect
researchSpeed amount =
  { name = "Research speed"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


resourceOutputWithoutSlaves : Int -> Effect
resourceOutputWithoutSlaves amount =
  { name = "Resource output without slaves"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


rivalryInfluenceGain : Int -> Effect
rivalryInfluenceGain amount =
  { name = "Rivalry influence gain"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


shipCost : Int -> Effect
shipCost amount =
  { name = "Ship cost"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = False
  }


shipUpgradeCost : Int -> Effect
shipUpgradeCost amount =
  { name = "Ship upgrade cost"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = False
  }


shipUpkeep : Int -> Effect
shipUpkeep amount =
  { name = "Ship upkeep"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = False
  }


slaveFoodOutput : Int -> Effect
slaveFoodOutput amount =
  { name = "Slavery food output"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


slaveMineralOutput : Int -> Effect
slaveMineralOutput amount =
  { name = "Slavery mineral output"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


slaveryTolerance : Int -> Effect
slaveryTolerance amount =
  { name = "Slavery tolerance"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


societyOutput : Int -> Effect
societyOutput amount =
  { name = "Society output"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


surveySpeed : Int -> Effect
surveySpeed amount =
  { name = "Survey speed"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


warHappiness : Int -> Effect
warHappiness amount =
  { name = "War happiness"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


warTolerance : Int -> Effect
warTolerance amount =
  { name = "War tolerance"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = True
  }


xenophobia : Int -> Effect
xenophobia amount =
  { name = "Xenophobia"
  , amount = amount
  , suffix = "%"
  , moreIsBetter = False
  }
