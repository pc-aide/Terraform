# Lab05 - templateFile + type object

---

## Diagram

---

## terraform.tfvars
0. words
   * nouns = army, panther, walnuts, sandwich, zeus, banana, cat, jellyfish, jigsaw, violin, milk, sun
   * adjectives = bitter, sticky, thundering, abundant, chubby, grumpy
   * verbs = run, dance, love, respect, kicked, baked
   * adverbs = delicately, beatifully, quickly, truhfully, wearily
   * numbers = 42, 27, 101, 73, -5, 0
   
----

## alice.txt
1. folder : templates
````txt
ALICES'S UPSIDE-DOWN WORLD

Lewis Carroll's classic, "Allice's Adventures in Wonderland", as well
as its ${adjectives[0]} sequel, "Through the looking ${nouns[0]}",
have enchanted both the young & old ${nouns[1]}s for the last 
${numbers[0]} years, Alice's ${adjectives[1]} adventures begin
when she ${verbs[0]}s down a/an ${adjectives[2]} hole & lands
in a strange & topsy-turvy ${nouns[2]}. There she discovers she 
can become a tall ${nouns[3]} or a samll ${nouns[5]}. In her travels
through Winderlan, Alice ${verbs[1]}s such remarkable characters as the White ${nouns[6]}, the ${adjectives[3]} Hatter,
the Cheshire ${nouns[7]}, & even the Queen of ${nouns[8]}s,
Unfortunately, Alice's adventures come to an/an ${adjectives[4]} end when Alice awakens from her ${nouns[8]}
````

---

## madlibs.tf
1. main.tf = madlibs.tf
2. provider = random_shuffle
3. variables: all list string execpt for number (list number)
4. outputs: in alice.txt can populate our terraform.tfvars for new text
   * eg: 
   
````md
ALICES'S UPSIDE-DOWN WORLD

Lewis Carroll's classic, "Allice's Adventures in Wonderland", as well
as its **abundant** sequel, "Through the looking **violin**",
have enchanted both the young & old milks for the last
42 years, Alice's grumpy adventures begin
when she dances down a/an sticky hole & lands
in a strange & topsy-turvy cat. There she discovers she
can become a tall Zeus or a samll sun. In her travels
through Winderlan, Alice runs such remarkable characters as the White sandwich, the bitter Hatter,
the Cheshire jellyfish, & even the Queen of armys,
Unfortunately, Alice's adventures come to an/an thundering end when Alice awakens from her army
EOT
````
