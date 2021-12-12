# [Legacy] Foswiki rss feed to Tasks

(note this is for historical purposes, this code is not functional anymore)

Keeping track of upstream changes: The [Foswiki](http://foswiki.org) way via RSS 

- **The problem**: [Foswiki](http://foswiki.org) is a fork of [TWiki](http://twiki.org) (for the history of this fork, see [TWiki forks](https://colas.nahaboo.net/Blog/TWiki_forks)), and needs to keep track of changes in the upstream (aka twiki) world,  but not in an automated way, as the 2 projects have different  principles, and may want to implement differently some changes.
- **The solution:** use a semi-automated approach: 
  -  **Monitor** all changes to the place where all changes to the code are discussed upstream, the Bugs web of the Development  site of TWiki, via its RSS feed
  -  for each new item in this feed, **create** a Task Item in a specialized "web" (aka "Folder", "Space") of foswiki, its [Input web](http://foswiki.org/bin/view/Input/WebHome)
  -  try to put automatically in this item as much useful **information** as possible:links to the original Bug report on TWiki, possible related existing Tasks in the foswiki [Tasks web](http://foswiki.org/bin/view/Tasks/WebHome) (by searching for the bug item name), existing Input items on the same upstream bug report
  -  have humans then **examine** the items and  decide what to do, closing the item once the decision is made (but not  necessarily acted upon yet), possibly creating or updating a proper  Tasks entry for this.

  This is based on the famous productivity method, [Getting Things Done](http://en.wikipedia.org/wiki/Getting_Things_Done) (aka: **GTD**) from David Allen, and more specifically, on its concept of [Input buckets](http://en.wikipedia.org/wiki/Getting_Things_Done#Collect), so to follow the method, you should go through the foswiki [Input web](http://foswiki.org/bin/view/Input/WebHome) and process and close each item in **less than 2 minutes**.

It is run by a hourly cron job by apache (user "www"): 
`57 * * * * cd $WEBSITE/data/Input && /usr/local/bin/input-feed-from-twikibugs`



-- [Colas Nahaboo](https://colas.nahaboo.net/Main/ColasNahaboo) - 2008-12-08

![overview](/home/colas/hg/Foswiki/FoswikiInput/overview.png)

