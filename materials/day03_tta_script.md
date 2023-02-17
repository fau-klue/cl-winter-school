# Case Study: The Trump Twitter Archive

## CQPweb

- [CQPweb](https://cwb.sourceforge.io/cqpweb.php) is a Web-based user interface to the [IMS Corpus Workbench](https://cwb.sourceforge.io/)
- we will use the local server of the CCL group at https://corpora.linguistik.uni-erlangen.de/cqpweb/

## Worked example

- goal: understand Donald Trump's terminology, rhetoric and phraseology (in case he comes back …)

- take a look at a corpus of Trump's tweets from 2009 – Jan 2021 (when he was finally banned from Twitter) to illustrate corpus linguistic research

- **simplest use:** search `make america great again`, then explain kwic and context displays

- **step 1:** select a suitable subcorpus (only original tweets, no retweets etc.)

- **step 2:** lemma frequency list for selection of relevant terms ➞ not very interesting
  - option: look at hashtags (prefix `#`)
  - option: use POS-disambiguated lemmatisation (not available for all corpora) to filter by part of speech (suffix `_N`, `_Z`, `_J`, `_V`)
  - results are still very general high-frequency words and often not particularly characteristic

- **step 3:** keyword analysis = frequency comparison against reference corpus (➞ English tweets)
  - use default settings, but change keyness measure to _Log-Likelihood_ (or _Log Ratio (conservative estimate)_) and show positive keywords only (too many negative ones!)
  - compare tabular view with visualisation options, click on _thank_ to display concordance
  - focus on salient _fake_ and very frequent _great_

- **step 4:** click concordance for _great_, randomised, context view
  - sort + frequency breakdown on 1R ➞ used quite generally with different nouns

- **step 5:** click on concordance for _fake_
  - suspicion that it's mostly _fake news_ confirmed by frequency breakdown on 1R (fake news 75%)
  - conclusion: _fake news_ as a salient unit of meaning

- **step 6:** query `fake news` (subcorpus: Originals)
  - quick look at concordance ➞ more than 900 hits
  - still need quantitative analysis to get overview

- **step 7:** distribution analysis for _fake news_ (esp. distribution across years is interesting)

- **step 8:** collocation analysis for _fake news_ reveals usage and phraseology
