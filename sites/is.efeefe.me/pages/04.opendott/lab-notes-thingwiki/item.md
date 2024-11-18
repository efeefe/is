---
title: 'lab notes - thingwiki'
date: '11:58 14-06-2021'
show_sidebar: false
feed:
    limit: 10
hero_classes: 'parallax text-dark overlay-light hero-fullscreen'
hero_image: thingwiki-inkscape.png
---

From [this lab documentation log](https://github.com/reuse-city/lab/blob/main/prototypes/universal-registry/README.md). I summarise: planning for a data commons that welcomes contributions from humans as well as non-human (more-than-human?) systems.

---

(...) in at least one occasion during the reuse city workshop in April, we have discussed ways to balance the diverse interests involved in maintaining an open and distributed database of things and their reuse. Suggestions were made about adopting an appproach inspired by [wikipedia](https://wikipedia.org). I do understand that direction, with some observations.

People usually associate wikipedia with a sense of collective construction of knowledge, which is fine. But I also think wikipedia's perspective is too focused on individual discrete contributions. The very association with the history of the encyclopaedia speaks to the spirit of the author, that renaissance man (gender bias intentional here). And while I do have I high respect for the role of individual contributions to build an universal registry of things composed of many discrete parts, I do also see room to accept contributions from institutions/organisations as well as automated and more-than-human systems. Those are usually not well seen under wikipedia rules.

Naturally, disclaimers and accountability must be built into the universal registry of things. But I had to point to that essential difference to the way the wikipedia community organises and sees its collective efforts taking shape. The world of open/collective collaboration must have more nuanced examples of hybrid commons emergence. In our calls during the lab, I offered the GNU/Linux Kernel as one such example, accepting contributions both from lone late-night unpaid kernel geeks (yes they exist) as well as from employees of international corporations. That reference is likely not enough, for as far as I'm aware there are no automated contributions to the kernel (or are there?). In any case, point made.

It is only ironic that I decided to return to that very metaphor last week. I'm working on what was supposed to be a very simple implementation of web pages to display in the screen of my evaluation interface. Instead of setting up something simple with [bootstrap](https://getbootstrap.com/), I went a little further. I was also trying to find an easier, quicker way to refer to the "[universal registry of things](https://is.efeefe.me/concepts/universal-registry-things)", already giving up on another name I have considered for being too cryptic ("valudata"). In browsing some websites that I see as references ([instructables](https://www.instructables.com/), the [ifixit guide](https://www.ifixit.com/Guide), the somewhat outdated [thinkwiki](http://thinkwiki.org/wiki/), [thingiverse](https://www.thingiverse.com/), the [open repair data standard](https://openrepair.org/open-data/open-standard/), [Open3R](https://github.com/DsposalTom/Open3R)), I felt like looking for the name "thingwiki". It turns out there's not much in that space, and the domain name thingwiki.cc was available. Done.

I'm always grinding my teeth when I see websites that call themselves wikis but are not really wikis (yes, those exist too), so I would insist on that point. I'm not a web developer or anything, but I'm skilled enough to set up and administer websites using free/open source scripts. I have used [mediawiki](https://www.mediawiki.org/) in the past and was always disappointed (sorry, friends). The same with other wiki engines, many of which do not exist anymore. [Dokuwiki](https://www.dokuwiki.org/dokuwiki) is limited, but I still maintain a legacy one and like the idea of flatfile storage. I went out looking for more contemporary wiki engines. One condition I had was the ability to back contents up to a git repository, a practice I have happily adopted with my simple websites using [GRAV](https://getgrav.org/). But that's no wiki.

I eventually found [wiki.js](https://js.wiki/) and [installed it](https://thingwiki.herokuapp.com/) on [heroku](https://www.heroku.com/). Still trying to get a grip, but I'm already excited with its apparent extensibility which would hopefully allow to harmonise human and automated contributions.

Next I'll have a look at those reference websites, and come up with templates for entries on the thingwiki. I'll keep updating my [lab notes](https://github.com/reuse-city/lab/tree/main/prototypes/universal-registry).
