# creating a chatbot from scratch

- AI powered chatbot
- custom conversations, live support, and insights
  - restaurant reservation (by manual call)

# agggregate trends / insights on what conversations are happening

- e.g. where o find breakfast (and their hotel has a buffet)
  - they would ask "what do you wanna eat?" and their suggestions will be given as insights to the client

## initial image

docker run -p 8888:8888 jupyter/scipy-notebook:17aba6048f44

## this image

docker start -a a1aebbf3764d

## refs

https://www.one-tab.com/page/7xKKp-mcSeKEt0F0Gvu9Jw

## to check all images

docker ps -a



# chatbot architecture

## options 1 : humans

- support team that answers your questions
- no development effort needed
- the team gets a good feel of how people interact with chatbots
  - e.g. keep it short
  - use emojis
- development keypoints
  - typo, very grammatically wrong (abt 50% of words)

# option 2: rule-based

- a lot of if statements
- a lot of regex
- you can get really far using if statements and regular expresisons

# option 3: predictive chatbots / retrieval based chatbots

- understanding what the user is seeking
- getting the answer once you know the question, is the easy part of the equation

# options 4: generative chatbots

- uses markov chain modelling

# training a predictive chatbot

- question mapping

```js
// key is "class"
// value is "intent"
where_is_my_hotel: {
  "where is my hotel?", "hotel location?", "whow do i get to a hotel?";
}
```

train a classifier to predict intent classes

# prediction

"ohi how get 2 hotel kthx" -> classifier -> where_is_my_hotel

- give variations to the answers
  - so when the user asks multiple times, rng the answers

# training + prediction

- break questions into feature vectors

## accuracy

- precision
- recall

controlling for precision and recall

1. customize to diferent needs
   - make_reservation
     - high precision low recall
   - call_hospital
     - low precision high recall

# bebot's number of intents

- ~ 6000 intents
- generally might be 2000 ish intents

## chatbots get similar intents quite wrong

- "when is check out time?"
- "when is check in time?"
  - simplest way to deal with it is to combine intents (return both check out and check in time)

# bebot does not have japanes

- mixes between hiragana and kanji is hard
- very difficult to tokenize

# conversation state is handles by

- defining what pieces of information is needed, and prompt for more knowledge
- for each time of thing, you define another sentence
  - called prompts

# scratchpad notes

```


training_phrases = {

	'when_is_check_in' : [
		'when is check-in?',
		...
],

'where_is_the_front_desk' : [
	'Where is the front desk?',
	...
]

}


answers = {
'when_is_check_in' : 'Check in is at 3pm! :)',
'where_is_the_front_desk' : 'The front desk is located on the 2nd floor.'
}





# Imports
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.metrics import precision_recall_fscore_support

```
