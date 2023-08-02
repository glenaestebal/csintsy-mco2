% type "start." to start
% always add a period after each answer: "glena."



:- dynamic preferred_activity/1.
:- dynamic preferred_size/1.
:- dynamic preferred_maintenance_level/1.
:- dynamic suitable_for_a_small_space/1.
:- dynamic child_friendly/1.
:- dynamic preferred_compatibility_with_other_pets/1.

% --- FACTS ---

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



get_activity_preference(Activity) :-
    write('enter your preferred activity level (moderately_active, active, highly_active): '),
    read(Activity).


get_size_preference(Size) :-
    write('enter your preferred size (small, medium, large, small_to_large, small_to_medium, medium_to_large): '),
    read(Size).


get_maintenance_preference(Maintenance) :-
    write('enter your preferred maintenance level (low_maintenance, moderate_maintenance, high_maintenance): '),
    read(Maintenance).


get_amount_of_children(Child_Friendly) :-
    write('do you have children (yes, no)?: '),
    read(Child_Friendly).


get_size_of_living_space(Small_Space) :-
    write('do you live in a small space (yes, no)?: '),
    read(Small_Space).


get_compatibility_preference(Compatibility) :-
    write('do you have other pets (yes, no)?: '),
    read(Compatibility).

% pet(animal, personality, temperament, activity_level, size, maintenance_level, suitable_for_a_small_space, child_friendly, compatibility).


filter_pets_by_activity(Activity, PetList) :-
    findall(Pet, (
        pet(Pet, _, _, Activity, _, _, _, _, _),
        preferred_activity(Activity)
    ), PetList).


filter_pets_by_size(Size, PetList) :-
    findall(Pet, (
        pet(Pet, _, _, _, Size, _, _, _, _),
        preferred_size(Size)
    ), PetList).

filter_pets_by_maintenance_level(Maintenance, PetList) :-
    findall(Pet, (
        pet(Pet, _, _, _, _, Maintenance, _, _, _),
        preferred_maintenance_level(Maintenance)
    ), PetList).

filter_pets_by_suitable_for_small_space(yes, PetList) :-
    findall(Pet, (
        pet(Pet, _, _, _, _, _, Small_Space, _, _),
        Small_Space = suitable ; Small_Space = slightly_suitable
    ), PetList).

filter_pets_by_suitable_for_small_space(no, PetList) :-
    findall(Pet, (
        pet(Pet, _, _, _, _, _, Small_Space, _, _),
        Small_Space = not_suitable
    ), PetList).

filter_pets_by_child_friendly(yes, PetList) :-
    findall(Pet, (
        pet(Pet, _, _, _, _, _, _, Child_Friendly, _),
        Child_Friendly = child_friendly
    ), PetList).

filter_pets_by_child_friendly(no, PetList) :-
    findall(Pet, (
        pet(Pet, _, _, _, _, _, _, Child_Friendly, _),
        Child_Friendly = not_child_friendly
    ), PetList).

filter_pets_by_other_pets_compatibility(yes, PetList) :-
    findall(Pet, (
        pet(Pet, _, _, _, _, _, _, _, Compatibility),
        Compatibility = compatible; Compatibility = slightly_compatible
    ), PetList).

filter_pets_by_other_pets_compatibility(no, PetList) :-
    findall(Pet, (
        pet(Pet, _, _, _, _, _, _, _, Compatibility),
        Compatibility = slightly_not_compatible
    ), PetList).


recommend_pet(PreferredPet, RecommendedPets) :-
    get_activity_preference(Activity),
    get_size_preference(Size),
    get_maintenance_preference(Maintenance),
    get_size_of_living_space(Small_Space),
    get_amount_of_children(Child_Friendly),
    get_compatibility_preference(Compatibility),

    assertz(preferred_activity(Activity)),
    assertz(preferred_size(Size)),
    assertz(preferred_maintenance_level(Maintenance)),
    assertz(suitable_for_a_small_space(Small_Space)),
    assertz(child_friendly(Child_Friendly)),
    assertz(preferred_compatibility_with_other_pets(Compatibility)),
    
    findall(Pet, (
        pet(Pet, _, _, _, _, _, _, _, _),
        (filter_pets_by_activity(Activity, PetList1), member(Pet, PetList1)) ,
        (filter_pets_by_size(Size, PetList2), member(Pet, PetList2)) ,
        (filter_pets_by_maintenance_level(Maintenance, PetList3), member(Pet, PetList3)) ,
        (filter_pets_by_suitable_for_small_space(Small_Space, PetList4), member(Pet, PetList4)) ,
        (filter_pets_by_child_friendly(Child_Friendly, PetList5), member(Pet, PetList5)) ,
        (filter_pets_by_other_pets_compatibility(Compatibility, PetList6), member(Pet, PetList6))
    ), RecommendedPets),

    retractall(preferred_activity(_)),
    retractall(preferred_size(_)),
    retractall(preferred_maintenance_level(_)),
    retractall(suitable_for_a_small_space(_)),
    retractall(child_friendly(_)),
    retractall(preferred_compatibility_with_other_pets(_)),

    
    % PreferredPet = RecommendedPets.
    random_member(PreferredPet, RecommendedPets).

% --- RULES ---

% activity level
preferred_activity(moderately_active).
preferred_activity(active).
preferred_activity(highly_active).

% size
preferred_size(small).
preferred_size(medium).
preferred_size(large).
preferred_size(small_to_medium).
preferred_size(medium_to_large).

% maintenance level
preferred_maintenance_level(low_maintenance).
preferred_maintenance_level(moderate_maintenace).
preferred_maintenance_level(high_maintenance).

% suitable for a small space
suitable_for_a_small_space(slightly_suitable).
suitable_for_a_small_space(suitable).
suitable_for_a_small_space(not_suitable).

% child_friendly
child_friendly(not_child_friendly).
child_friendly(child_friendly).

% compatibility
preferred_compatibility_with_other_pets(compatible).
preferred_compatibility_with_other_pets(slightly_compatible).
preferred_compatibility_with_other_pets(slightly_not_compatible).


start :- 
    writeln('Hello, I am an expert system'),
    getInfo(PreferredPet).



getInfo(PreferredPet) :-
    writeln('What is your name?'),
    read(Name),
    write('Hello '),
    write(Name),
    write(', '),
    assertz(hooman(Name)),

    recommend_pet(PreferredPet, RecommendedPets),
    % writeln('Sorry, no pets match your preferences.'),
    writeln('Your recommended pet is: '), 
    writeln(PreferredPet),

    retractall(hooman(_)).

getInfo(PreferredPet) :-
    writeln('Sorry, no pets match your preferences.').
