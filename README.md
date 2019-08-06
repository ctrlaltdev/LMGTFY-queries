[![license](https://img.shields.io/github/license/ctrlaltdev/LMGTFY-queries.svg?style=for-the-badge)](https://github.com/ctrlaltdev/LMGTFY-queries/blob/master/LICENSE)
![Python](https://img.shields.io/badge/_-Python-4B8BBE.svg?style=for-the-badge)
![Bash](https://img.shields.io/badge/_-SH-4EAA25.svg?style=for-the-badge)

You might be familiar with the website Let Me Google That For You - which allow someone to send a passive aggressive link to someone too lazy to seach online by themself - well LMGTFY allow you to shorten this link and it appears that the URLs created are sequencial!

So, naturally, someone had to poll those URLs to obtain all the queries.

### Wait, wut?

The idea popped up in ##security on Freenode in GH0S1's mind and mine (ctrlaltdev aka \void) after we sent LMGTFY links at almost the same time.

#### More about us

- GH0S1: [https://gh0s1.com/](https://gh0s1.com/)
- \void: [https://ctrlalt.dev/](https://ctrlalt.dev/)

### The Hash

So, the sequencial part of the URL is alphanumeric and ranges from 0 to 9 then A to Z then a to z - which sums up to 62 possibilities. At the time, the hash had grown only to 4 characters (which allows 62^4 different hashes + the 62^3 different hashes for the 3 characters hashes, etc.).

This stack up to 62 + 62^2 + 62^3 + 62^4 = 15 018 570 hashes.

### Curling

So in order to *not* accidentally make a DOS attack on the URL shortener server, we used a script polling one URL at a time, on which we could have control on timing.

Not knowing the size of the remoter server, we assumed 3 requests / sec were acceptable to not overload the server and not dying of old age before the end of the polling.

So the polling script loops 60 times (sleeping a bit between earch curl), and was initiated via a cron running every minute.
The script use curl to get the headers of the shorten URL, and parse the redirection URL to get the query.

The whole polling phase lasted 15018570 hashes / 86400 sec a day / 3 servers polling = 57 days 22 hours 36 minutes 30 seconds.

### The Queries

The queries retrieved were urlencoded, so we decoded them to make them available in plain text.
The current queries file stacks up to 107MB.

### Download

You can download the tar.gz of the queries file : [queries.tar.gz (54MB)](https://github.com/ctrlaltdev/LMGTFY-queries/raw/master/archives/queries.tar.gz)

### What now?

We urldecoded the queries, to allow future text analysis.

Now, we need to figure out the best way to detect the language of each query.

Feel free to play with the queries, try things, open issues, make pull request, buy us a beer.

### TO DO

- [x] urldecode the queries
- [ ] split file per languages
- [ ] perform text analysis of some sort
- [ ] I don't know yet
.

### Structure

- The polling scripts are in fetch/
- The urldecoding scripts are in urldecode/
- The tar.gz are in archives/
- And the queries files are in src/

### Contributing

If you plan on cloning or forking this repo, use git LFS [(more info)](https://git-lfs.github.com/).

