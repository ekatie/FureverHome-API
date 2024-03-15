# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
Dog.destroy_all
DogImage.destroy_all
Application.destroy_all

# Create a user as adopter
user_katie = User.create!(
  email: 'katie@adopt.com',
  user_type: 'adopter',
  name: 'Katie Kay',
  date_of_birth: '1988-04-05',
  phone: '123-456-7890',
  password: 'adopt'
)

# Create a user as admin
user_admin = User.create!(
  email: 'katie@admin.com',
  user_type: 'admin',
  name: 'Katie Nova',
  date_of_birth: '1988-04-05',
  phone: '987-654-3210',
  password: 'admin'
)

adopter_emails = ['barkley.james@example.com', 'chase.pawter@example.com', 'retriever.beth@example.com', 'russell.terri@example.com', 'collie.mckay@example.com']
adopter_users = adopter_emails.map do |email|
  name_parts = email.split('@').first.split('.').map(&:capitalize).join(' ')
  User.create!(
    email: email, 
    password: 'password', 
    user_type: 'adopter', 
    name: name_parts,
    date_of_birth: '1990-01-01', 
    phone: '555-555-5555'
  )
end


# Dog data
dogs_data = [
  { 
    name: "Acorn", 
    age: 3, 
    sex: "Female", 
    breed: "Chihuahua Mix", 
    size: 8, 
    description: "Say hello to this little lady, the queen of cozy spots and a nap pro who absolutely adores curling up on the back of the couch. She's got this cute underbite that just adds to her charm and makes you want to give her all the cuddles. A bit on the shy side and gets a tad anxious in new situations, she truly blossoms when she's got a doggy buddy to hang out with. Yep, she's all about having a pal to boost her confidence. And talk about a lap dog—she's happiest snuggled up in your lap, being your number one snuggle buddy. If you've got a soft spot for a sweet, slightly bashful pup with loads of love to give, she's your girl. Plus, having another furry friend around would just make her day!", 
    status: "Available", 
    energy_level: "Medium", 
    foster_location: "Toronto", 
    medical_conditions: "None", 
    adoption_fee: 750, 
    good_with_dogs: "Sometimes",
    good_with_cats: "No",
    good_with_kids: "Sometimes",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Acorn_1.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Acorn_2.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Acorn_3.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Acorn_4.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Acorn_5.jpg?raw=true"
    ]
  },
  { 
    name: "Belle", 
    age: 2, 
    sex: "Female", 
    breed: "Pitbull Lab Mix", 
    size: 45, 
    description: "Hiiiiiiii! If you're reading this, you must be a human, so I love you already! My name is Belfast, but everyone calls me Belle (or adorable, because that's what I am!) Everyone thinks I'm a puppy because I've got a puppy face, a big-dog sized head, and giant, clumsy, big-dog sized paws on a medium-sized body, but I'm actually TWO YEARS OLD (that's an adult in human years!) which means I'm as big as I'm gonna get!

    My foster mom says I'm a good girl because:
    - I don't whine in my crate (it's cozy, so it's great for napping!)
    - I do all my business outside (I peed inside a few times my first couple of days but, in my defense, I had just been on a long, confusing journey and I didn't know the rules yet! I'm a smarty pants though, so I figured it out real quick!)
    - I walk nicely beside her when I'm on leash, always on her right side (except when there is a human or another doggo to say hi to! I'm definitely not one to miss opportunities for friendship or pets!)
    - I'm quiet all the time! (I only borked ONCE and it was because the wind was making weird noises while I was trying to sleep - how rude!)
    - When she tells me to sit, I listen and that makes her very happy so I gets pets or treats!
    
    My foster mom gave me a few toys, but I think they are broken because they make weird squeaky sounds. Don't worry, I fixed them and removed all the squeakers! They are fun to chew. 
    I love all my toys! Every morning, when foster mom lets me out of my crate, I try to gather them all in my mouth to say hi and play with them because I missed them so much!
    
    I'm sooo excited to be a Torontonian! Foster mom says I will find my furever home very fast because I'm such a good girl - I can't wait to meet them!", 
    status: "Available", 
    energy_level: "Very High", 
    foster_location: "Mississauga", 
    medical_conditions: "None", 
    adoption_fee: 850,
    good_with_dogs: "Yes",
    good_with_cats: "Untested",
    good_with_kids: "Yes",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Belle_1.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Belle_2.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Belle_3.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Belle_4.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Belle_5.jpg?raw=true"
    ]
  },
  { 
    name: "Scotti", 
    age: 1.5, 
    sex: "Female", 
    breed: "Australian Cattle Dog (Blue Heeler) Mix", 
    size: 20, 
    description: "Scotti is full of loving puppy energy and is so curious about the world around her! She's also at home on the couch and is a total sucker for belly rubs.", 
    status: "Available", 
    energy_level: "High", 
    foster_location: "North York", 
    medical_conditions: "None", 
    adoption_fee: 850, 
    good_with_dogs: "Yes",
    good_with_cats: "Untested",
    good_with_kids: "Yes",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Scotti_4.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Scotti_1.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Scotti_2.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Scotti_3.jpg?raw=true"
    ]
  },
  { 
    name: "Krash", 
    age: 2, 
    sex: "Male", 
    breed: "Chihuahua Mix", 
    size: 12, 
    description: "Krash's small body contains the biggest heart ever - he a total sweetheart and just can't get enough pets, cuddles, lap-time, or kisses (and he won't hesitate to let you know if he's lacking in any of the above!). He would no doubt make a great companion for someone who is home most of the time (or can take him out and about with them) and has lots of affection to give!

    Krash is house-trained and has been doing all his business outdoors since day one.

    He is also crate-trained and settles down quickly - no whining, barking or protest of any kind!
    
    Krash is a bit timid with new people at first but warms up surprisingly quickly if he's given a chance to take things at his own pace. He seems to like people quite a bit actually and hasn't has any issues with anyone he's met so far! Too much enthusiasm or sudden movements toward him when he's meeting new people tend to make him a bit skittish, but if he's allowed to approach as he feels ready then everything goes smoothly. He seems to be learning with each interaction that people are friendly and nothing to be scared of, and he perks up quite a bit after each positive encounter!
    
    Krash avoided most dogs at first, but he's begun to show interest in saying hi over the past week. We're slowly starting to make introductions, and he's doing really well! He definitely feels more comfortable with smaller dogs (closer to his size) but hasn't had any issues with dogs of any size so far. We will continue to make introductions and hopefully his comfort level will grow with more positive interactions!
    
    Krash is a quiet dog most of the time - he barely made a peep the first few days! Once he found his voice, he expressed himself by whining when someone heads out without him for the day, and barking/growling at the mailperson dropping things through the mail slot (no surprise there!). He even showed that he knows how to play and have a good time, growling and tossing a soft toy around!", 
    status: "Available", 
    energy_level: "Medium", 
    foster_location: "Collingwood", 
    medical_conditions: "Eye issues - medication needed", 
    adoption_fee: 750, 
    good_with_dogs: "Sometimes",
    good_with_cats: "Untested",
    good_with_kids: "Yes",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Krash_2.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Krash_1.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Krash_4.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Krash_3.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Krash_5.jpg?raw=true"
    ]
  },
  { 
    name: "Charm", 
    age: 3, 
    sex: "Female", 
    breed: "Corgi, Labrador Mix ", 
    size: 25, 
    description: "Charmeuse is a super sweet, chill, and confident pup. She looooves belly rubs and pets, the squeaky toys and balls she's been given to play with, and sprawling out on the floor with froggy legs (so cute!). She's quite content to relax and nap, as long as she gets some lovin' every now and then.

    Charmeuse is quite brave too! She showed a bit of uncertainty with new things (elevators, automatic doors, etc.) at first, but approached with caution to check things out and has (so far) decided there's nothing scary going on. After less than 48 hours, she's already getting on the elevator first and showing confidence both indoors and out! (I expected her to bolt when I used our VERY loud blender, but after an initial jolt from surprise, she just stared at it curiously with her tail wagging. Wow!)
    She is for sure food motivated, and is always around when food is being prepared or eaten, but listens when she's told no.

    Charmeuse shows evidence of prior training and is housebroken. She's fully potty trained and will let us know if she needs to go out; she knows “Sit” and shows manners when in front of a door by sitting nicely to show she's ready to go.

    No issues with the crate at all! She goes in herself without prompting throughout the day. At night, she gets in easily, especially if motivated with a treat. No fuss, no whining. She settles in quickly.
    Leash manners are minimal - she gets excited and curious, zigzagging and pulling to check things out. She is also super intrigued by squirrels, birds and other wildlife, and really wants to chase them. We'll work on this for sure!

    Brief (distanced) encounters with other dogs and people went really well. She seems to be super friendly with both people and other dogs (even when they're being reactive/vocal). No reactions to bikes, joggers, etc. on walks. The only thing that made her a bit nervous was the garbage truck (noisy!) but she didn't let it bother her for long, especially after a soothing word or two.", 
    status: "Available", 
    energy_level: "Medium", 
    foster_location: "Scarborough", 
    medical_conditions: "None", 
    adoption_fee: 750, 
    good_with_dogs: "Sometimes",
    good_with_cats: "Untested",
    good_with_kids: "Untested",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Charm_4.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Charm_1.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Charm_2.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Charm_3.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Charm_5.jpg?raw=true"
    ]
  },
  { 
    name: "Piper", 
    age: 2, 
    sex: "Female", 
    breed: "Terrier, Chihuahua, Beagle Mix", 
    size: 15, 
    description: "Piper is a forever-puppy sized bundle of love, with all the ears!

    She is house-trained, crate-trained, behaves well in the car, and is quickly learning how to walk on leash (right now she's zigzagging a bit when a scent catches her attention, but otherwise she's lovely!). She's also super friendly to other dogs (and handles herself amazingly even if they don't feel the same, or if she's a tad overwhelmed by their size) and LOVES all the humans.
    
    Piper loves to be involved in everything that goes on around her and will stay close to her people indoors. She is a sucker for head scritches and belly rubs, seeking out any person nearby to “request” them throughout the day. When not much is going on, she will entertain herself with a squeaky toy or burrow into the pile of blankets in her crate and take a cozy nap.
    
    Piper's pretty quiet overall - she's only barked a handful of times and mostly in response to other dogs barking nearby. She whines quietly in protest when someone leaves the apartment or when she gets excited by a squirrel/dog outdoors, but only for a few seconds before settling down again.
    
    Overall, she's a dream doggo and would do well in just about any environment!", 
    status: "Available", 
    energy_level: "Medium", 
    foster_location: "Toronto", 
    medical_conditions: "None", 
    adoption_fee: 850, 
    good_with_dogs: "Yes",
    good_with_cats: "Yes",
    good_with_kids: "Sometimes",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Piper_2.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Piper_1.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Piper_3.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Piper_4.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Piper_5.jpg?raw=true"
    ]
  },
  { 
    name: "Ruby-Jo", 
    age: 1.5, 
    sex: "Female", 
    breed: "Catahoula Leopard Dog Mix", 
    size: 47, 
    description: "Ruby-Jo is the kind of dog that will steal your heart from the get-go (consider yourself warned!). As a catahoula mix, she's strong (REALLY strong!!) and muscular, but she is a total goofball and full of playful puppy energy. She's also very affectionate (hugs and licks for days!) and loves to be close to her human(s) (like, playing on top of your lap kinda close… :P). When she aims her loving gaze at you, you can't help but melt into a puddle.

    Ruby-Jo was clearly a street dog (at least for a while), but she came into our home with an open heart and mind and adjusted quite quicky! She's good with her crate and will go in with some treat-motivation. She whines for a little bit if things are still going on around her, but she settles down after a minute or two. Same for when she's left alone (so far for no more than an hour) - a bit of whining, then she settles and naps. It's only been a few days, and there's already been improvement, so no doubt she will adjust as she gets used to her new living arrangements!
    
    Potty-training is in progress - she's only gone #2 outdoors (yay!), but did have a few peeing accidents in the apartment. We've been working on it and it's happening less and less each day (no incidents in the past 24 hours!) - no doubt she will fully get the hang of it in just a few more days!
    
    Leash manners are also being worked on! As a (likely) former street dog, Ruby-Jo is not sure how to behave on a leash. At first, she was pulling and zig-zagging all over the place in her effort to explore everything (who can blame her for wanting to?!), but we've been slowly teaching her to walk beside us (we're supposed to be walking her after all, not the other way around!!). This is where her strength becomes very evident, because boy can she pull! Again, she's making progress and will be a pro on leash with some time and consistency - there is already noticeable progress after just a few days.
    
    Noise-wise, Ruby-Jo is pretty quiet overall. The only time she barks is when there are things going on in the hallway/outside the apartment door. This is likely breed-related guarding behaviour, as catahoula's want to make sure their people are safe and protected! We're working on settling her down, so it's possible she will do this less once she gets used to the noises of our environment.
    
    Ruby-Jo is super friendly to people and other dogs, though she's not too sure how to “dog” when it comes to meeting others of her kind (haha!). We're slowly introducing her to some other dogs in our neighbourhood, and she's already learning how to interact nicely! She will be a pro dog in no time! With other animals (squirrels, etc.) Ruby-Jo is definitely alert and curious, but doesn't seem to want to chase anything as of yet.
    
    In the apartment, Ruby-Jo loves to play with some of her favourite toys (she loooves squeakers and playing tug!) both by herself (yay for doggos who entertain themselves!) and with whomever is around. Other times, she’s a great napper and sleeps in all sorts of strange and amazing positions. :P
    
    Overall, Ruby-Jo is a dream dog! She's smart, energetic, playful and is super loving and affectionate towards her humans. <3", 
    status: "Available", 
    energy_level: "High", 
    foster_location: "North York", 
    medical_conditions: "None", 
    adoption_fee: 850, 
    good_with_dogs: "Yes",
    good_with_cats: "No",
    good_with_kids: "No",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Ruby-Jo_3.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Ruby-Jo_1.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Ruby-Jo_2.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Ruby-Jo_4.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Ruby-Jo_5.jpg?raw=true"
    ]
  },
  { 
    name: "Bella", 
    age: 6, 
    sex: "Female", 
    breed: "Labrador Hound Mix", 
    size: 38, 
    description: "Bella is beautiful and she knows it! But she doesn't care on ounce about that; all she wants to know is who will provide her with her next cuddles, and when. This sweet girl gets along well with other dogs, and really couldn't care less about friends of the feline variety. Her favourite thing is humans, especially those who will give her lots of love. Bella loves to cuddle!

    This darling dog will positively thrive if she's adopted by a person or family who will provide her with a tons of affection and attention. The more time spent with her human(s), the better, so if they're home a lot or can take her to work with them, life will be perfect. For everyone.", 
    status: "Available", 
    energy_level: "High", 
    foster_location: "East York", 
    medical_conditions: "Allergies", 
    adoption_fee: 700, 
    good_with_dogs: "Sometimes",
    good_with_cats: "No",
    good_with_kids: "Yes",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Bella_4.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Bella_3.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Bella_1.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Bella_2.jpg?raw=true",
      "https://github.com/ekatie/FureverHome/blob/main/src/assets/Bella_5.jpg?raw=true"
    ]
  },
  {
    name: "Luna",
    age: 4,
    sex: "Female",
    breed: "Siberian Husky",
    size: 50,
    description: "Luna is a spirited Husky with mesmerizing blue eyes. She loves long runs and is very vocal about her feelings. Luna is looking for a home that can provide her with lots of exercise and love.",
    status: "Available",
    energy_level: "High",
    foster_location: "Toronto",
    medical_conditions: "None",
    adoption_fee: 800,
    good_with_dogs: "Yes",
    good_with_cats: "No",
    good_with_kids: "Yes",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/gh-pages/src/assets/Luna.jpg?raw=true",
    ]
  },
  {
    name: "Max",
    age: 2,
    sex: "Male",
    breed: "Golden Retriever",
    size: 60,
    description: "Max is the epitome of a family dog. Friendly, loyal, and always ready for a game of fetch. He adores children and is excellent with other pets.",
    status: "Available",
    energy_level: "Medium",
    foster_location: "Mississauga",
    medical_conditions: "None",
    adoption_fee: 900,
    good_with_dogs: "Yes",
    good_with_cats: "Yes",
    good_with_kids: "Yes",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/gh-pages/src/assets/Max.jpeg?raw=true",
    ]
  },
  {
    name: "Buddy",
    age: 6,
    sex: "Male",
    breed: "Beagle",
    size: 22,
    description: "Buddy is a gentle soul with a nose for adventure. He's a bit of a Houdini when it comes to fences, so he'll need a secure yard. Loves sniffing trails and cuddling.",
    status: "Available",
    energy_level: "Low",
    foster_location: "Hamilton",
    medical_conditions: "None",
    adoption_fee: 700,
    good_with_dogs: "Yes",
    good_with_cats: "Sometimes",
    good_with_kids: "Yes",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/gh-pages/src/assets/Buddy.png?raw=true",
    ]
  },
  {
    name: "Sophie",
    age: 3,
    sex: "Female",
    breed: "Border Collie",
    size: 35,
    description: "Sophie is an intelligent and active Border Collie who thrives on mental and physical stimulation. She's a quick learner and would excel in agility or herding activities.",
    status: "Available",
    energy_level: "Very High",
    foster_location: "Brampton",
    medical_conditions: "None",
    adoption_fee: 850,
    good_with_dogs: "Yes",
    good_with_cats: "No",
    good_with_kids: "Yes",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/gh-pages/src/assets/Sophie.jpg?raw=true",
    ]
  },
  {
    name: "Rocky",
    age: 1,
    sex: "Male",
    breed: "Boxer",
    size: 45,
    description: "Rocky is a bundle of energy with a heart of gold. He loves to play and would do well in an active household where he can get plenty of exercise and training.",
    status: "Available",
    energy_level: "High",
    foster_location: "Ottawa",
    medical_conditions: "None",
    adoption_fee: 800,
    good_with_dogs: "Yes",
    good_with_cats: "Sometimes",
    good_with_kids: "Yes",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/gh-pages/src/assets/Rocky.jpg?raw=true",
    ]
  },
  {
    name: "Molly",
    age: 5,
    sex: "Female",
    breed: "Dachshund",
    size: 12,
    description: "Molly is a charming little lady with a penchant for sunbathing and lap naps. She's a bit shy at first but warms up quickly to become a loyal companion.",
    status: "Available",
    energy_level: "Medium",
    foster_location: "London",
    medical_conditions: "None",
    adoption_fee: 700,
    good_with_dogs: "Yes",
    good_with_cats: "Yes",
    good_with_kids: "Yes",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/gh-pages/src/assets/Molly.png?raw=true",
    ]
  },
  {
    name: "Charlie",
    age: 4,
    sex: "Male",
    breed: "Labradoodle",
    size: 55,
    description: "Charlie is a friendly and fluffy Labradoodle who adores human companionship. He's great with kids and other pets, making him the perfect family dog.",
    status: "Available",
    energy_level: "Medium",
    foster_location: "Guelph",
    medical_conditions: "Allergies",
    adoption_fee: 900,
    good_with_dogs: "Yes",
    good_with_cats: "Yes",
    good_with_kids: "Yes",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/gh-pages/src/assets/Charlie.png?raw=true",
    ]
  },
  {
    name: "Daisy",
    age: 8,
    sex: "Female",
    breed: "Cocker Spaniel",
    size: 28,
    description: "Daisy is a gentle soul with a loving nature. She enjoys peaceful walks and quiet evenings. Ideal for a senior companion looking for a loyal friend.",
    status: "Available",
    energy_level: "Low",
    foster_location: "Barrie",
    medical_conditions: "Hearing loss",
    adoption_fee: 500,
    good_with_dogs: "Yes",
    good_with_cats: "Yes",
    good_with_kids: "Yes",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/gh-pages/src/assets/Daisy.jpg?raw=true",
    ]
  },
  {
    name: "Rex",
    age: 3,
    sex: "Male",
    breed: "German Shepherd",
    size: 60,
    description: "Rex is a loyal and protective German Shepherd with a keen sense of duty. He's intelligent and trainable, ideal for an experienced dog owner.",
    status: "Available",
    energy_level: "High",
    foster_location: "Toronto",
    medical_conditions: "None",
    adoption_fee: 850,
    good_with_dogs: "Sometimes",
    good_with_cats: "No",
    good_with_kids: "Yes",
    social_media_link: "https://www.instagram.com/fosteringkatie",
    images: [
      "https://github.com/ekatie/FureverHome/blob/gh-pages/src/assets/Rex.jpg?raw=true",
    ]
  }
]

dogs = dogs_data.map do |dog_data|
  dog = Dog.create!(dog_data.except(:images))
  dog_data[:images].each do |image_url|
    DogImage.create!(dog_id: dog.id, url: image_url, is_default: dog_data[:images].first == image_url)
  end
  dog
end

# dogs_data.each do |dog_data|
#   dog = Dog.create!(
#     name: dog_data[:name], 
#     age: dog_data[:age], 
#     sex: dog_data[:sex], 
#     breed: dog_data[:breed], 
#     size: dog_data[:size], 
#     description: dog_data[:description], 
#     status: dog_data[:status], 
#     energy_level: dog_data[:energy_level], 
#     foster_location: dog_data[:foster_location], 
#     medical_conditions: dog_data[:medical_conditions], 
#     adoption_fee: dog_data[:adoption_fee],
#     good_with_dogs: dog_data[:good_with_dogs],
#     good_with_cats: dog_data[:good_with_cats],
#     good_with_kids: dog_data[:good_with_kids],
#     social_media_link: dog_data[:social_media_link],
#   )

#   dog_data[:images].each_with_index do |image_url, index|
#     DogImage.create!(
#       dog_id: dog.id, 
#       url: image_url, 
#       is_default: index.zero? # Mark the first image as default
#     )
#   end
# end

applications_data = [
  {
    user_id: adopter_users[0].id,
    dog_id: dogs[0].id, # Acorn
    status: 'Pending',
    created_at: '2024-02-28',
    updated_at: '2024-03-02',
    read_profile: true,
    address: "123 Bark Street, Toronto, ON",
    current_pets: false,
    felony_conviction: false,
    pet_prohibition: false,
    previous_adoption: false,
    residence_type: "Rent",
    landlord_permission: true,
    occupation: "Software Developer",
    adoption_reason: "Looking for a companion",
    dog_experience: "Grew up with dogs",
    stimulation_plan: "Daily walks and playtime",
    household_children: false,
    household_allergies: false,
    household_agreement: true,
    sleeping_arrangement: "Dog bed in my bedroom",
    vet_frequency: "Yearly checkups",
    dog_age: ["Young", "Adult"],
    dog_size: ["Small"],
    dog_energy_level: "Medium",
    dog_medical_conditions: "No"
  },
  {
    user_id: adopter_users[1].id,
    dog_id: dogs[6].id, # Luna
    status: 'Pending Dog Selection',
    created_at: '2024-03-01',
    updated_at: '2024-03-01',
    read_profile: true,
    address: "345 Moonlight Road, Toronto, ON",
    current_pets: true,
    current_pets_details: "An old cat who prefers to keep to herself",
    felony_conviction: false,
    pet_prohibition: false,
    previous_adoption: false,
    residence_type: "Own",
    landlord_permission: nil,
    occupation: "Astronomer",
    adoption_reason: "Seeking a lively companion for night walks",
    dog_experience: "Owned Huskies in the past",
    stimulation_plan: "Nightly walks under the stars, plenty of playtime",
    household_children: false,
    household_allergies: false,
    household_agreement: true,
    sleeping_arrangement: "Own dog bed, but welcome in bed",
    vet_frequency: "Yearly check-ups and as needed",
    dog_age: ["Adult"],
    dog_size: ["Medium"],
    dog_energy_level: "High",
    dog_medical_conditions: "Maybe"
  },
  {
    user_id: adopter_users[2].id,
    dog_id: dogs[7].id, # Max
    status: 'Submitted',
    created_at: '2024-02-20',
    updated_at: '2024-02-23',
    read_profile: true,
    address: "678 Fetch Ave, Mississauga, ON",
    current_pets: false,
    felony_conviction: false,
    pet_prohibition: false,
    previous_adoption: true,
    adoption_details: "Adopted a senior dog two years ago",
    residence_type: "Rent",
    landlord_permission: true,
    occupation: "School Teacher",
    adoption_reason: "Wish to provide a loving home to another dog",
    dog_experience: "Grew up with dogs, previous experience with adoption",
    stimulation_plan: "Daily walks, playtime in the park, regular training sessions",
    household_children: true,
    household_allergies: false,
    household_agreement: true,
    sleeping_arrangement: "Dog bed in the bedroom",
    vet_frequency: "Yearly vaccinations and check-ups, as needed",
    dog_age: ["Young"],
    dog_size: ["Large"],
    dog_energy_level: "Medium",
    dog_medical_conditions: "No"
  },
  {
    user_id: adopter_users[3].id,
    dog_id: dogs[8].id, # Buddy
    status: 'Submitted',
    created_at: '2024-03-05',
    updated_at: '2024-03-06',
    read_profile: true,
    address: "910 Trail Sniffer Ln, Hamilton, ON",
    current_pets: true,
    current_pets_details: "A playful terrier who loves making new friends",
    felony_conviction: false,
    pet_prohibition: false,
    previous_adoption: false,
    residence_type: "Own",
    landlord_permission: nil,
    occupation: "Wildlife Photographer",
    adoption_reason: "Looking for an adventurous companion for nature walks",
    dog_experience: "Grew up in a household with several dogs, familiar with training",
    stimulation_plan: "Daily hikes and exploration in nature reserves",
    household_children: false,
    household_allergies: false,
    household_agreement: true,
    sleeping_arrangement: "A cozy dog bed next to my own",
    vet_frequency: "Annual checkups and vaccinations, immediate care if needed",
    dog_age: ["Adult"],
    dog_size: ["Medium"],
    dog_energy_level: "Low",
    dog_medical_conditions: "No"
  },
  {
    user_id: adopter_users[4].id,
    dog_id: dogs[9].id, # Molly
    status: 'Submitted',
    created_at: '2024-03-10',
    updated_at: '2024-03-11',
    read_profile: true,
    address: "1122 Dachshund Dr, London, ON",
    current_pets: false,
    felony_conviction: false,
    pet_prohibition: false,
    previous_adoption: true,
    adoption_details: "Previously adopted a senior dog who passed away from natural causes",
    residence_type: "Rent",
    landlord_permission: true,
    occupation: "Retired Librarian",
    adoption_reason: "Seeking a gentle companion to share peaceful days with",
    dog_experience: "Decades of dog ownership, experience with small breeds",
    stimulation_plan: "Short daily walks, plenty of indoor play and cuddles",
    household_children: false,
    household_allergies: false,
    household_agreement: true,
    sleeping_arrangement: "Dog bed in my bedroom, but welcome in my bed",
    vet_frequency: "Regular checkups, as needed for any health concerns",
    dog_age: ["Adult"],
    dog_size: ["Small"],
    dog_energy_level: "Medium",
    dog_medical_conditions: "No"
  }
]

applications = applications_data.map do |application_data|
  Application.create!(application_data)
end