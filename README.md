# SugarscapePensions

## WHAT IS IT?

This model extends Epstein & Axtell's Sugarscape Wealth Distribution model,  described in chapter 2 of their book Growing Artificial Societies: Social Science from the Bottom Up. More specifically, Uri Wilensky NetLogo implementation, licensed under a creative common license in 2009, is used as base for this implementation.

The model extension allows pension laws and social services effects to be studied.

The original simulation provides a ground-up simulation of inequality in wealth. Only a minority of the population have above average wealth, while most agents have wealth near the same level as the initial endowment. The inequity of the resulting distribution can be described graphically by the Lorenz curve and quantitatively by the Gini coefficient.

The new graphical descriptions include among others: working and retired agents, savings in a pension piggy bank, working agents and retired agents in socially excluded, and agents who used social services.


## HOW IT WORKS

### Original simulation

As in the original simulation, each patch contains some sugar, the maximum amount of which is predetermined. At each tick, each patch regains one unit of sugar, until it reaches the maximum amount.

The amount of sugar a patch currently contains is indicated by its color; the darker the yellow, the more sugar.

At setup, agents are placed at random within the world. Each agent can only see a certain distance horizontally and vertically. At each tick, each agent will move to the nearest unoccupied location within their vision range with the most sugar, and collect all the sugar there.  If its current location has as much or more sugar than any unoccupied location it can see, it will stay put.

Agents also use (and thus lose) a certain amount of sugar each tick, based on their metabolism rates. If an agent runs out of sugar, it dies.

Each agent also has a maximum age, which is assigned randomly from the range 60 to 100 ticks.  When the agent reaches an age beyond its maximum age, it dies.

Whenever an agent dies (either from starvation or old age), a new randomly initialized agent is created somewhere in the world; hence, in this model the global population count stays constant.

### Extended simulation 

In the simulation extension, agents can retired at certain age and they are displayed in blue in the environment. At that point: (1) they stop moving and collecting sugar, (2) the sugar they consume based on their metabolism is taken from the pension piggy bank, (3) they consume sugar from their savings if the piggy bank is empty. Depending on the RESOURCES-OCUPPATION parameter, working agents can move to the positions where retired agents stay and collect the sugar.

Before being retired, agents are taxed a percentage of the sugar retrieved in each tick that go to the pension piggy bank. Moreover, if the SOCIAL- SERVICES parameter is activated,  working agents can get sugar from the piggy bank to avoid dying but, unlike retired agents, after moving and collecting sugar.

Other parameters include:

* RANDOM-INITIAL-AGE, it gives a random age to the first population of agents to avoid a first massive wave of retirements when reaching the retirement-age. 
* PRODUCTIVITY-DECAY, it makes agents to be able to recollect only part of the sugar in a patch based on a productivity-decay rate that depends on the age.  These values have been obtained using a univariate Akima interpolation over productivity values per age given in “Does Mental Productivity Decline with Age? Evidence from Chess Players” (2013) by Bertoni et al.


## HOW TO USE IT

### Original simulation

The INITIAL-POPULATION slider sets how many agents are in the world.

The MINIMUM-SUGAR-ENDOWMENT and MAXIMUM-SUGAR-ENDOWMENT sliders set the initial amount of sugar ("wealth") each agent has when it hatches. The actual value is randomly chosen from the given range.

Press SETUP to populate the world with agents and import the sugar map data. GO will run the simulation continuously, while GO ONCE will run one tick.

The VISUALIZATION chooser gives different visualization options and may be changed while the GO button is pressed. When NO-VISUALIZATION is selected all the agents will be red. When COLOR-AGENTS-BY-VISION is selected the agents with the longest vision will be darkest and, similarly, when COLOR-AGENTS-BY-METABOLISM is selected the agents with the lowest metabolism will be darkest.

The WEALTH-DISTRIBUTION histogram on the right shows the distribution of wealth.

The LORENZ CURVE plot shows what percent of the wealth is held by what percent of the population, and the the GINI-INDEX V. TIME plot shows a measure of the inequity of the distribution over time.  A GINI-INDEX of 0 equates to everyone having the exact same amount of wealth (collected sugar), and a GINI-INDEX of 1 equates to the most skewed wealth distribution possible, where a single person has all the sugar, and no one else has any.

### Extended simulation 

#### Parameters
* The RETIREMENT-AGE slider states the age of retirement for agents.
* The  PENSION-TAXES slider states the percentage of sugar collected that goes to the pension piggy bank in each tick.
* FIXED-FEE slider states a fixed fee of sugar to be paid in every tick to contribute to the pension piggy bank.
* RANDOM-INITIAL-AGE switch gives a random age to the first population of agents to avoid a first massive wave of retirements when reaching the retirement-age. 
* PRODUCTIVITY-DECAY switch makes agents to be able to recollect only part of the sugar in a patch based on a productivity-decay rate that depends on the age.  
* RESOURCES-OCUPPATION switch allows working agents to move to the positions where retired agents stay and collect the sugar.
* SOCIAL-SERVICES switch allows working agents can get sugar from the piggy bank to avoid dying but, unlike retired agents, after moving and collecting sugar.


#### Outputs:

* RETIREES VS WORKERS, plots the number of working agents per time in red and the number of retired agents in blue per time.
* PENSIONS PIGGY BANK, plots the amount of sugar per time in the pensions piggy bank.
* SOCIAL EXCLUSION, plots the working agents who run out of sugar in red, the retired agents who run out of sugar in blue.

## THINGS TO NOTICE

### Original simulation

After running the model for a while, the wealth distribution histogram shows that there are many more agents with low wealth than agents with high wealth.

Some agents will have less than the minimum initial wealth (MINIMUM-SUGAR-ENDOWMENT), if the minimum initial wealth was greater than 0.

### Extended simulation 

Work in progress

## THINGS TO TRY

### Original simulation

How does the initial population affect the wealth distribution? How long does it take for the skewed distribution to emerge?

How is the wealth distribution affected when you change the initial endowments of wealth?

### Extended simulation 

Work in progress.

## NETLOGO FEATURES

All of the Sugarscape models create the world by using `file-read` to import data from an external file, `sugar-map.txt`. This file defines both the initial and the maximum sugar value for each patch in the world.

Since agents cannot see diagonally we cannot use `in-radius` to find the patches in the agents' vision.  Instead, we use `at-points`.

## RELATED MODELS

Other models in the NetLogo Sugarscape suite include:

* Sugarscape 1 Immediate Growback
* Sugarscape 2 Constant Growback
* Sugarscape 3 Wealth distribution

For more explanation of the Lorenz curve and the Gini index, see the Info tab of the Wealth Distribution model.  (That model is also based on Epstein and Axtell's Sugarscape model, but more loosely.)

## CREDITS AND REFERENCES

* Epstein, J. and Axtell, R. (1996). Growing Artificial Societies: Social Science from the Bottom Up.  Washington, D.C.: Brookings Institution Press.
*  Li, J. and Wilensky, U. (2009).  NetLogo Sugarscape 3 Wealth Distribution model.  http://ccl.northwestern.edu/netlogo/models/Sugarscape3WealthDistribution.  Center for Connected Learning and Computer-Based Modeling, Northwestern University, Evanston, IL.
* Wilensky, U. (1999). NetLogo. http://ccl.northwestern.edu/netlogo/. Center for Connected Learning and Computer-Based Modeling, Northwestern University, Evanston, IL.


## HOW TO CITE
Authors: 

*  Emilio Serrano from the Ontology Engineering Group, Deparment of Artificial Intelligence, Universidad Politécnica de Madrid, Spain.
*  Ken Satoh from Principles of Informatics Research Division, NII(National Institute of Informatics), and Sokendai (The Graduate University of Advanced Studies), Japan.
 
<p align="center"> 
<img src="https://www.upm.es/sfs/Rectorado/Gabinete%20del%20Rector/Logos/UPM/Escudo%20con%20Leyenda/ESCUDO%20leyenda%20color%20JPG.jpg" width="200">
<br />
<img src="https://www.realwire.com/writeitfiles/01_nii_logo_A.jpg" width="200">
</p>

We are working in a paper, until then, the github repository containing the code can be cited:  https://github.com/emilioserra/SugarscapePensions 

## COPYRIGHT AND LICENSE

Copyright 2019 Emilio Serrano and Ken Satoh.

![CC BY-NC-SA 3.0](http://ccl.northwestern.edu/images/creativecommons/byncsa.png)

This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 License.  To view a copy of this license, visit https://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter to Creative Commons, 559 Nathan Abbott Way, Stanford, California 94305, USA.

Commercial licenses are also available. To inquire about commercial licenses, please contact Emilio Serrano  at https://emilioserra.oeg-upm.net/

