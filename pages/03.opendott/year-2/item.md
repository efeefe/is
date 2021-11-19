---
title: 'Year 2'
published: true
date: '18-11-2021 09:00'
taxonomy:
    tag:
        - research
        - 'Berlin'
        - 'prototyping'
jscomments:
    provider: discourse
hero_classes: 'parallax text-fardk overlay-light hero-fullscreen'
show_sidebar: false
feed:
    limit: 10
---

The overall structure of OpenDoTT was designed around an expected sequence of events: each of us [fellows](https://opendott.org/team/) would spend the first year in Dundee using design research to explore and scope our research focus and questions. Then we would move to Berlin to spend 18 months working as a group at the Mozilla Foundation. The first 12 of those months - our second year - would focus on prototyping, with focal points on open hardware, internet health and privacy by design. And the final year would be split in half, the first 6 months focusing on policy and later giving us time to return to work individually on our theses.

It is commonplace nowadays to note a disconnection between planned estimates and the actual pace of activities as time passes. One could just as well argue that things have always been like that, we're only paying more attention now. In any case, my individual reiteration is here. Plans have changed a bit. This month I am turning in the deliverables of my second year at OpenDoTT, even though the calendar accuses me of being well into the third year. The deadline extension was negotiated with the funder and properly documented by the project management, but I felt like making a note of it here as well. Amid these busy and odd-paced times, this research blog has not been that active. What follows is an overview of what my second year was like.

## Open*

We started the year with a training module on internet health and open leadership. It reached me as an opportunity to revisit and refresh my perspective on open design, particular that branch influenced by digital technologies. I tend to lean towards a critical take. I still use open licenses in all of my projects, naturally. But I don't see them as revolutionary, only minimally sustainable. We should discuss different levels of openness, taking into account intentionality and externalities. It shouldn't be only about releasing outputs in the open for any takers, but in fact creating caring ecosystems in which the common can thrive. It is not a typo to use "common" instead of "commons" here. While the idea of a pre-capitalist commons can obviously inspire us in seeking generous systems, their finite nature can lead to distortions in understanding. Antonio Lafuente uses "common" quite ambiguously between the sense of commons and one of ordinary. I expect to reflect a bit more in that direction in the future. For now, I'll just point to the open-ended discussion I started with the blog post "[A spiral of openness](../spiral-of-openness)" as an outcome of the training module on open leadership. The image of a spiral (instead or a line, or even a circle) was an element I carried forward in this year's activities, as I'll mention later in this post.

## Co-design and prototyping

As the project moved on to the prototyping phase, I had the chance in a sense to embody my research. I recombined some of the [concept ideas](https://is.efeefe.me/concepts) created in the first year, and could examine them from different perspectives.

I was not a total newcomer to the ideas of open hardware and iteractive methodologies, but taking the time to apply them purposefully was indeed a novelty. On the other hand, I come from a background treating [gambiarra](https://web.archive.org/web/20100615153750/http://medialab-prado.es/article/gambiarra) as a critical take on prototyping: the physical assemblage that is not a rehearsal of a future product, but rather a situated solution in itself.

Through a design study originally called "technology for reuse" I wanted to engage with people who were already involved or interested in practices of reuse through repair, upcycling or re-circulation of second-hand goods. In adapting to COVID-19 times, the study would be conducted exclusively online, and that opened the possibility of inviting people from virtually anywhere in the world.

In order to make explicit my expectation to frame the discussion in connection with an urban setting, I adopted a different public name (and a newly registered URL) for the study: reuse.city. The starting phase of reuse.city took the shape of a 4-week online co-design lab. I wanted mainly to discuss two new assemblages of my original concept ideas: an universal registry of things offering information about goods and materials and how to reuse them; and a machine to access that information easily.

As the goal of my research is not to create new products whose deployment must be feasible immediately, I had the freedom to adopt a more speculative approach. I had the chance to discuss ideas and experiment with open conversations ahead of the study when conducting a discussion session about the universal registry of things during the Mozilla Festival in March. I was then already starting to recruit participants for the study.

Almost 29 people registered to participate in the study by filling the consent form. They were coming from 10 different countries, and had mixed backgrounds and levels of experience with reuse and repair. During four weeks in April (and an extra week in May) we had a series of activities. Not everyone attended the sessions, but the ones who did were indeed a quite diverse sample.

Two or three times a week I would send conversation triggers, share references and contents, and organise online meetings. We decided collectively on the preferred ways to maintain the conversation in parallel to the calls (an e-mail discussion list and a group in Telegram). Participants were invited not only to contribute to guided discussions but also to present their own work.

We ended with a rich [collection of experiences and discussions](https://github.com/opendott-smartcities/II/tree/main/D13_deployment-datasets/reuse-city/meetings). In addition to getting situated feedback that helped me refine the concept ideas of the universal registry of things and the machine (now called E-I, or evaluation interface), the conversations have shown me it was important also to work on another of the original concepts that I had intended to keep to a later stage of research: the transformation labs. These are a mix of community repair workshops and makerspaces. In the end I had [three updated concepts](https://github.com/opendott-smartcities/II/tree/main/D11_co-designed-concepts) with which to inspire my prototyping.

About in the same period I was conducting the study, we had a training module on open hardware. With the support of Davide Gomba of Officine Innesto, I worked on a simple way to demonstrate how [E-I](https://github.com/opendott-smartcities/II/tree/main/D12_documentation-of-prototypes/e-i) would work: the concept was about a machine that would recognize objects and retrieve information about them. In my prototype, that was accomplished with a NFC reader that identifies predefined objects added of a NFC tag, and displays different HTML pages based on what object was presented.

I was also experimenting with different ways to display information stored locally on E-I. When discussing the universal registry of things, one participant suggested it should be governed the same way Wikipedia is. I understood the point, but disagree on some particular aspects. Summarising as much as possible: Wikipedia is too centralised; and it is based on the contribution of individual authors. I would prefer a distributed governance model, and one that would also welcome collective and institutional contributions. That's something to be inspired by one of the templates of [community rule](https://communityrule.info/). The point of including collective contributions is not only counting on well-intentioned companies willing to provide information about their products, but also allowing data to come from consumer's associations, repairspeople coops and public agencies (even more relevant under the background of legislation on the right to repair).

The imaginary of a wiki is yet ellusive of what I intend to do, and I have chosen to prototype an implementation of the Universal Registry of Things under the name ThingWiki. It took the shape of a small website featuring information about objects I have collected in the course of my research. The website is based on [wiki.js](https://js.wiki), an easy to use wiki engine that allows information to be stored as markdown files on a git repository (in fact this feature is not yet perfect, but will hopefully improve in the near future).

In addition to E-I and ThingWiki, I consider the community around reuse.city to be a third prototype in itself, connecting back to the aforementioned point of the spiral of openness and making things in an open-ended way. I expect to return to this group of people in coming phases of research.

## Contexts and cooperation

Besides a noted difficulty of situating my research into a particular academic discipline, I was happy to find like-minded people and organisations doing interesting work on fields such as zero waste. I also found I'm not the only one trying to [walk on the borders of circular economy](https://is.efeefe.me/opendott/waste-value-and-reuse) and doughnut economics without adopting them as gospel.

Weeks after I moved to Berlin, I had the chance to conduct a workshop during the [Data Cities](https://www.disruptionlab.org/data-cities) conference, which brought me a good overview of second-hand, reuse, zero waste and circular economy in the city. I am still learning about the immense amount of initiatives active in those sectors, and hope to work closer to some of them in the near future. I was also happy to collaborate with international projects such as [Tales of Care and Repair](https://tales.repairacts.net/), through which not only could I learn about important projects and research active today, but had also the opportunity to connect back to the Brazilian context and plant some more seeds there.

The next phase of OpenDoTT will focus on policy and legislation, and I hope to strengthen my research, possibly along the lines of recommending transformation labs to be offered to city dwellers as places where they can learn how to reuse second-hand things. I hope also to turn my observations on the availability of second-hand materials in different contexts into an essay about "generous cities". More on that soon (ish) on this blog.
