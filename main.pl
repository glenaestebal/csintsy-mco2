% -----------------------
% TO DO IN CODE
% [x] put the facts
% [x] put the rules
% [] define/map rules
%   [/] define the rules
%   [x] rules for size
%   [x] rules for activity
%   [x] rules for maintenance
%   [] rules for suitable for a small space
%   [] rules for suitable with childre
%   [x] rules for compatiblity with other pets
% [] connect each other
% [] user input

% TO DO IN REPORT
% [] explain temperament in report
%   [] compatibility is based on temperament kaya make sure to defend that
% [] suitable_for_a_small_space is based on size kaya make sure to defend that
% -----------------------



% --- FACTS ---

% pet characteristics 
% pet(animal, personality, temperament, activity_level, size, maintenance_level, suitable_for_a_small_space, child_friendly, compatibility).
pet(dog, loyal, choleric, highly_active, small_to_large, high_maintenance, slightly_not_compatible).
pet(cat, independent, sanguine, moderately_active, small_to_medium, moderate_maintenance, compatible).
pet(bird, curious, choleric, moderately_active, small, moderate_maintenace, slightly_not_compatible).
pet(fish, shy, phlegmatic, moderately_active, small_to_medium, low_maintenance, slightly_compatible).
pet(hamster, curious, sanguine, highly_active, small, low_maintenance, compatible).
pet(guinea_pig, lazy, sanguine, moderately_active, small, moderate_maintenance, compatible).
pet(gerbil, intelligent, phlegmatic, highly_active, small, moderate_maintenance, slightly_compatible).
pet(hedgehog, shy, phlegmatic, highly_active, small, moderate_maintenance, slightly_compatible).
pet(pig, compassionate, sanguine, moderately_active, small_to_large, high_maintenance, compatible).
pet(rabbit, energetic, choleric, moderately_active, small, moderate_maintenance, slightly_not_compatible).
pet(turtle_tortoise, shy, sanguine, moderately_active, small, moderate_maintenace, compatible).
pet(iguana, shy, phlegmatic, moderately_active, medium_to_large, moderate_maintenace, slightly_compatible).
pet(chameleon, shy, melancholic, moderately_active, small_to_medium, high_maintenance, slightly_not_compatible).
pet(gecko, calm, phlegmatic, moderately_active, small, moderate_maintenace, slightly_compatible).
pet(frogs, calm, phlegmatic, moderately_active, small, low_maintenance, slightly_compatible).
pet(snakes, calm, phlegmatic, moderately_active, small, low_maintenance, slightly_compatible).
pet(spiders, shy, melancholic, moderately_active, small, low_maintenance, slightly_not_compatible).
pet(ant_farm, intelligent, choleric, moderately_active, small, low_maintenance, slightly_not_compatible).
pet(ferret, loyal, choleric, highly_active, small, high_maintenance, slightly_not_compatible).
pet(hermit_crab, shy, phlegmatic, moderately_active, small, low_maintenance, slightly_compatible).


% User input 
% change the paramenters if you want another animal to show
% for example: ferret - highly_active, small, high_maintenance, slightly_not_compatible
preferred_activity(moderately_active).
preferred_size(small_to_medium).
preferred_maintenance(moderate_maintenance).
preferred_compatibility_with_other_pets(compatible).


% --- RULES ---

% rule to recommend a pet based on user preferences

% add suitable_for_a_small_space and child_friendly here
recommend_pet(Pet) :-
    pet(Pet, _, _, Activity, Size, Maintenance, Compatibility),
    preferred_activity(Activity),
    preferred_size(Size),
    preferred_maintenance(Maintenance),
    preferred_compatibility_with_other_pets(Compatibility).

% add suitable_for_a_small_space and child_friendly here
suitable_pet(Pet) :-
    compatibility_with_other_pets(Pet),
    pet(Pet, _, _, Activity, Size, Maintenance, Compatibility),
    preferred_activity(Activity),
    preferred_size(Size),
    preferred_maintenance(Maintenance),
    preferred_compatibility_with_other_pets(Compatibility).

% do suitable_for_a_small_space(Pet) :-

% do child_friendly(Pet) :-

% add suitable_for_a_small_space and child_friendly here
compatibility_with_other_pets(Pet) :-
    pet(Pet, _, _, Activity, Size, Maintenance, Compatibility),
    preferred_activity(Activity),
    preferred_size(Size),
    preffered_maintenance(Maintenance),
    preferred_compatibility_with_other_pets(Compatibility).


% defines Activity
activity_level_preference(moderately_active).
activity_level_preference(active).
activity_level_preference(highly_active).

% defines Size
size_preference(small).
size_preference(medium).
size_preference(large).
size_preference(small_to_large).
size_preference(small_to_medium).
size_preference(medium_to_large).

% defines Maintenance
maintenance_preference(low_maintenance).
maintenance_preference(moderate_maintenace).
maintenance_preference(high_maintenance).

% defines Suitable for a Small Space

% defines Child Friendly

% defines Compatibility
compatibility_preference(compatible).
compatibility_preference(slightly_compatible).
compatibility_preference(slightly_not_compatible).




