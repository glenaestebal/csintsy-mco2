% -----------------------
% TO DO IN CODE
% [x] put the facts
% [x] put the rules
% [] define/map rules
%   [/] define the rules
%   [x] rules for size
%   [x] rules for activity
%   [x] rules for maintenance
%   [/] rules for suitable for a small space
%   [/] rules for suitable with children
%   [x] rules for compatiblity with other pets
% [] connect each other
% [/] user input

% TO DO IN REPORT
% [] explain temperament in report
%   [] compatibility is based on temperament kaya make sure to defend that
% [] suitable_for_a_small_space is based on size kaya make sure to defend that
% -----------------------



% --- FACTS ---

% pet characteristics 
% pet(animal, personality, temperament, activity_level, size, maintenance_level, suitable_for_a_small_space, child_friendly, compatibility).
pet(dog, loyal, choleric, highly_active, small_to_large, high_maintenance, slightly_suitable, child_friendly, slightly_not_compatible).
pet(cat, independent, sanguine, moderately_active, small_to_medium, moderate_maintenance, suitable, child_friendly, compatible).
pet(bird, curious, choleric, moderately_active, small, moderate_maintenace, suitable, child_friendly, slightly_not_compatible).
pet(fish, shy, phlegmatic, moderately_active, small_to_medium, low_maintenance, suitable, child_friendly, slightly_compatible).
pet(hamster, curious, sanguine, highly_active, small, low_maintenance, suitable, child_friendly, compatible).
pet(guinea_pig, lazy, sanguine, moderately_active, small, moderate_maintenance, suitable, child_friendly, compatible).
pet(gerbil, intelligent, phlegmatic, highly_active, small, moderate_maintenance, suitable, child_friendly, slightly_compatible).
pet(hedgehog, shy, phlegmatic, highly_active, small, moderate_maintenance, suitable, child_friendly, slightly_compatible).
pet(pig, compassionate, sanguine, moderately_active, small_to_large, high_maintenance, not_suitable, child_friendly, compatible).
pet(rabbit, energetic, choleric, moderately_active, small, moderate_maintenance, suitable, not_child_friendly, slightly_not_compatible).
pet(turtle_tortoise, shy, sanguine, moderately_active, small, moderate_maintenace, suitable, child_friendly, compatible).
pet(iguana, shy, phlegmatic, moderately_active, medium_to_large, moderate_maintenace, not_suitable, not_child_friendly, slightly_compatible).
pet(chameleon, shy, melancholic, moderately_active, small_to_medium, high_maintenance, slightly_suitable, not_child_friendly, slightly_not_compatible).
pet(gecko, calm, phlegmatic, moderately_active, small, moderate_maintenace, suitable, child_friendly, slightly_compatible).
pet(frogs, calm, phlegmatic, moderately_active, small, low_maintenance, suitable, child_friendly, slightly_compatible).
pet(snakes, calm, phlegmatic, moderately_active, small, low_maintenance, slightly_suitable, not_child_friendly, slightly_compatible).
pet(spiders, shy, melancholic, moderately_active, small, low_maintenance, suitable, not_child_friendly, slightly_not_compatible).
pet(ant_farm, intelligent, choleric, moderately_active, small, low_maintenance, suitable, not_child_friendly, slightly_not_compatible).
pet(ferret, loyal, choleric, highly_active, small, high_maintenance, suitable, not_child_friendly, slightly_not_compatible).
pet(hermit_crab, shy, phlegmatic, moderately_active, small, low_maintenance, suitable, child_friendly, slightly_compatible).


% User input 
% change the paramenters if you want another animal to show
% for example: ferret - highly_active, small, high_maintenance, slightly_not_compatible
preferred_activity(moderately_active).
preferred_size(small_to_medium).
preferred_maintenance(moderate_maintenance).
preferred_compatibility_with_other_pets(compatible).


% Attempt for user input, not sure if it makes sense and if working.

% Predicate to take user input for preferred activity level
get_activity_preference(Activity) :-
    write('Enter your preferred activity level (moderately_active, active, highly_active): '),
    read(Activity).

% Predicate to take user input for preferred size
get_size_preference(Size) :-
    write('Enter your preferred size (small, medium, large, small_to_large, small_to_medium, medium_to_large): '),
    read(Size).

% Predicate to take user input for preferred maintenance level
get_maintenance_preference(Maintenance) :-
    write('Enter your preferred maintenance level (low_maintenance, moderate_maintenance, high_maintenance): '),
    read(Maintenance).

% Predicate to take user input for preferred compatibility with other pets
get_compatibility_preference(Compatibility) :-
    write('Enter your preferred compatibility with other pets (compatible, slightly_compatible, slightly_not_compatible): '),
    read(Compatibility).

% Predicate to recommend a pet based on user preferences
recommend_pet(Pet) :-
    suitable_for_a_small_space(Pet),
    child_friendly(Pet),
    compatibility_with_other_pets(Pet),
    pet(Pet, _, _, Activity, Size, Maintenance, Compatibility),
    preferred_activity(Activity),
    preferred_size(Size),
    preferred_maintenance(Maintenance),
    preferred_compatibility_with_other_pets(Compatibility).

% Predicate to take all user preferences and recommend a suitable pet
recommend_pet_based_on_user_input(Pet) :-
    get_activity_preference(Activity),
    get_size_preference(Size),
    get_maintenance_preference(Maintenance),
    get_compatibility_preference(Compatibility),
    assert(preferred_activity(Activity)),
    assert(preferred_size(Size)),
    assert(preferred_maintenance(Maintenance)),
    assert(preferred_compatibility_with_other_pets(Compatibility)),
    recommend_pet(Pet),
    retract(preferred_activity(Activity)),
    retract(preferred_size(Size)),
    retract(preferred_maintenance(Maintenance)),
    retract(preferred_compatibility_with_other_pets(Compatibility)).

% --- RULES ---

% rule to recommend a pet based on user preferences

% Recommended pets
recommend_pet(Pet) :-
    recommend_pet(Pet) :-
    suitable_for_a_small_space(Pet),
    child_friendly(Pet),
    compatibility_with_other_pets(Pet),
    pet(Pet, _, _, Activity, Size, Maintenance, Compatibility),
    preferred_activity(Activity),
    preferred_size(Size),
    preferred_maintenance(Maintenance),
    preferred_compatibility_with_other_pets(Compatibility).

% Suitable pets
suitable_pet(Pet) :-
    suitable_for_a_small_space(Pet),
    child_friendly(Pet),
    compatibility_with_other_pets(Pet),
    pet(Pet, _, _, Activity, Size, Maintenance, Compatibility),
    preferred_activity(Activity),
    preferred_size(Size),
    preferred_maintenance(Maintenance),
    preferred_compatibility_with_other_pets(Compatibility).

% do suitable_for_a_small_space(Pet) :-
    suitable_for_a_small_space(Pet) :-
    pet(Pet, _, _, _, Size, _, _, _, _),
    (Size = small; Size = small_to_medium).
    
% do child_friendly(Pet) :-
    child_friendly(Pet) :-
    pet(Pet, _, _, _, _, _, _, child_friendly, _).
    
% add suitable_for_a_small_space and child_friendly here
compatibility_with_other_pets(Pet) :-
    suitable_for_a_small_space(Pet),
    child_friendly(Pet),
    compatibility_with_other_pets(Pet),
    pet(Pet, _, _, Activity, Size, Maintenance, Compatibility),
    preferred_activity(Activity),
    preferred_size(Size),
    preferred_maintenance(Maintenance),
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
suitable_for_a_small_space(dog).
suitable_for_a_small_space(cat).
suitable_for_a_small_space(bird).
suitable_for_a_small_space(fish).
suitable_for_a_small_space(hamster).
suitable_for_a_small_space(guinea_pig).
suitable_for_a_small_space(gerbil).
suitable_for_a_small_space(hedgehog).
suitable_for_a_small_space(gecko).
suitable_for_a_small_space(frogs).
suitable_for_a_small_space(snakes).
suitable_for_a_small_space(spiders).
suitable_for_a_small_space(ant_farm).
suitable_for_a_small_space(hermit_crab).

% defines Child Friendly
child_friendly(cat).
child_friendly(bird).
child_friendly(fish).
child_friendly(hamster).
child_friendly(guinea_pig).
child_friendly(gerbil).
child_friendly(hedgehog).
child_friendly(turtle_tortoise).
child_friendly(gecko).
child_friendly(frogs).
child_friendly(hermit_crab).

% defines Compatibility
compatibility_preference(compatible).
compatibility_preference(slightly_compatible).
compatibility_preference(slightly_not_compatible).




