---
title: "Build An AI Second Brain Knowledge Base (Step-By-Step)"
source: "https://www.youtube.com/watch?v=yke4fLQUsh4&list=PLf-bJpKeji6T054DPLgMEgAj8rySAwFWJ"
author:
  - "[[Matt Wolfe]]"
published: 2026-05-06
created: 2026-07-04
description: "Here's how to build an AI second brain. Launch your own AI agents with OpenClaw at http://hostinger.com/mattopenclaw and get 10% off with code MATTWOLFEDiscover More:🛠️ Explore AI Tools & News: ht"
tags:
  - "webclip"
---
![](https://www.youtube.com/watch?v=yke4fLQUsh4)

Here's how to build an AI second brain. Launch your own AI agents with OpenClaw at http://hostinger.com/mattopenclaw and get 10% off with code MATTWOLFE  
  
Discover More:  
🛠️ Explore AI Tools & News: https://futuretools.io/  
📰 Weekly Newsletter: https://futuretools.io/newsletter  
  
Socials:  
❌ Twiter/X: https://x.com/mreflow  
🖼️ Instagram: https://instagram.com/mr.eflow  
🧵 Threads: https://www.threads.net/@mr.eflow  
🟦 LinkedIn: https://www.linkedin.com/in/matt-wolfe-30841712/  
👍 Facebook: https://www.facebook.com/mattrwolfe  
  
Resources From Today's Video:  
Karpathy Tweet: https://x.com/karpathy/status/2039805659525644595  
Karpathy GitHub Page: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f  
Obsidian: https://obsidian.md/  
Obsidian Web Clipper: https://obsidian.md/clipper  
Codex App: https://chatgpt.com/codex/  
  
Let’s work together!  
\- Brand, sponsorship & business inquiries: mattwolfe@smoothmedia.co  
  
#AINews #AITools #ArtificialIntelligence  
  
Time Stamps:  
0:00 Intro  
1:07 The System Overview  
6:14 OpenClaw on Hostinger  
8:03 Karpathy LLM Wiki Concept  
8:27 Tools Needed  
9:41 The Buildout  
18:19 Querying the Wiki  
19:28 Manually Updating the Agent  
21:25 Letting AI Update the Agent & Building Journal / CRM  
24:46 Testing the CRM  
26:01 Testing the Journal  
29:11 Automating The Wiki Linking  
30:30 Backing it all up to GitHub  
31:41 Recap and Final Thoughts

## Transcript

### Intro

**0:00** · So, I just built a second brain knowledge management system that has an entire wiki built in that I can chat with. It will pull any information from that second brain when I chat. It's got a built-in CRM. I can journal, and it will actually look at my wiki knowledge base and try to help me with whatever issues I'm going through from my journal by looking inside of the wiki.

**0:18** · And of course, it's got all of the content that I've saved from around the web, including YouTube videos and articles and tweets and podcasts and just tons of stuff that I've injected into this that is all accessible directly from a chat or from journaling. It is really, really sweet, and I'm going to break down how the whole thing works and how you can build one for yourself right now. Most second brain systems are just like storage, right?

**0:42** · You dump your YouTube transcripts and your articles and your blog posts and your podcasts and just everything that you're interested in, you just dump it all into one place.

**0:53** · Problem is, that's kind of where the information just goes to die. Unless you're like actively going back through and reviewing the notes all the time and searching through your second brain, it's just a dumping ground for information that I never go back and look at later. So, for the knowledge management system that I'm going to build, there's three core pillars that I want to build for mine. Number one is the wiki/knowledge base. This is where I'm going to store like everything from around the web that I find.

### The System Overview

**1:17** · YouTube transcripts, articles, podcast transcripts, tweets, you name it, it all goes into this wiki knowledge base section. Number two is my CRM. So, whenever I go to a events and I meet people or I jump on Zoom calls with people, I want to remember those conversations and I want to be able to recall them in the future. I also want to store details about those people, how I met them, where I met them, some of the discussions we had, any sort of contact details I got from them, email, phone number, address, whatever.

**1:46** · They can all live in this sort of CRM element of this bigger second brain that I'm building. And the third element is where this all gets pulled together, and And the journal. Now, I'm a big journaler. I journal pretty much every single day.

**1:59** · When I have good days, I journal about what went right, the things I'm excited about, gratitude, that sort of stuff.

**2:04** · When I have rough days, I journal about the things that are bothering me. My videos not performing as well as I want them to, having a creative block and not knowing what to make videos about. I do a lot of travel and I debate a lot about whether the travel's going to be worth it or not. I journal about pretty much everything in my business. So, these are my three ideal inputs. For you, it might be clients or workouts, research papers, recipes, sales calls, classroom notes.

**2:30** · The point is, the knowledge base sits at the center and then everything else sort of connects to it. The two elements that I think are probably the most useful to the most amount of people are going to be the wiki and the journal. Maybe the CRM isn't what you need. Again, maybe it's your classroom notes, your workouts, your recipes, et cetera. So, here's a rough drawing of what I have in mind. So, you've got your knowledge base that lives at the center of all of this.

**2:53** · All of this knowledge is going to live in Obsidian. I'll get into the whole building process in a second. You're going to save articles from around the web, YouTube videos, you know, podcast notes, whatever you find around the web that's relevant to you, you're going to save it with a simple Chrome web clipper and it's going to save into your knowledge base. The CRM that I just mentioned, notes about people you met and where you met them and all that kind of stuff gets saved to the knowledge base. Meeting notes, I personally use Granola to record my meetings and take notes for me. Those meeting notes can automatically be injected into the knowledge base.

**3:24** · And then you have journal entries. This is the layer where you actually interact with your knowledge base. You journal on what you're dealing with right now and ideally it's going to pull from the knowledge base that has all of this other information in it to ground the responses to your journal entries. This will make more sense as I go. Please excuse the PowerPoint style slide here, but I really want to explain what I'm trying to build. So, here's the system I imagine. You save your articles, your transcripts, et cetera, into this system. We'll do that using a web clipper.

**3:53** · The AI layer in the background that we're going to build then summarizes this stuff for us. So, it's not just a giant transcript, it's actually sort of the bullets and just the information we need to know. The AI is also going to extract people, companies, tools, ideas, and themes, and sort of break those off. That's where it becomes kind of like a wiki. You could click into the tools page and it will list off all the tools that have been mentioned across everything that we've saved. You can click into one of the tools and it will mention where and what video that came from. And that goes for all of these little categories here. I also wanted to auto-link related notes.

**4:27** · So, if I have multiple videos about how to build something with OpenClaw, they all get cross-referenced to each other and I can click around and sort of jump into others. If you're familiar with other second brain systems or like the Zettelkasten system, it's essentially that same concept of interlinking. I'm then going to let the journal directly into the system. So, when I do write journals, it responds like ChatGPT, but it's actually grounded in my own saved knowledge. So, it's not going to just respond with what ChatGPT would have responded with.

**4:56** · It's going to respond with something like, "I see you're struggling with ideas for videos. Well, you saved this video 3 days ago that says you should do this, this, and this.

**5:05** · You also saved this video 2 weeks ago that gave this advice when you're struggling with video ideas." And it will actually pull from the knowledge that I've saved, making it more tailored to exactly what interested me and what I found valuable over time as I save stuff into the system. It's also going to use AI to find patterns from past journal entries. So, if I'm constantly journaling on the same thing over and over again, the same struggle, it's going to see that as a pattern and take that into account when it's responding to my next journal entries.

**5:31** · It should resurface relevant ideas when I need them, and it should also let me save notes about people and connect those people to ideas, companies, events, and conversations. So, the CRM and the meeting notes that I'm constantly saving, that should also be connected to ideas and journal entries and all of it sort of pulled together in this big mashup of like here's the conversations I've had, here's what I'm journaling on, here's what I've saved that I found interesting, and it's all in this big old soup of content that I'm saving, but

**5:59** · that big old soup of content that I'm saving is the grounded information that is getting pulled when I write my journal entries and then get a chat response based on those journal entries.

**6:08** · All right, now that I've completely over explained this, let's just jump into the process I'm going through to build this.

### OpenClaw on Hostinger

**6:14** · There's a cool new feature from Hostinger that's made for deploying AI agents at home. So, if you've ever wanted to run something like OpenClaw, but don't know where to start or find it really complicated, this is going to make the process a lot easier. I actually use OpenClaw myself, so I can attest that the setup can get pretty technical. Right now, it's deployed on my DGX Spark and my favorite thing it built is simple CRM that when I meet people at events, I can save quick notes in Slack and then later ask it to remind me what we talked about.

**6:42** · So, it's great for automating everyday things like that to full-on businesses and these huge agentic systems, which I've also seen people do. And this new feature from Hostinger makes it a lot easier to set up. You can either pick a managed OpenClaw plan or a VPS option. The managed version is honestly the easiest.

**7:02** · It's a one-click deployment that includes built-in AI credits, web scraping already connected, and they handle the updates, backups, and security for you. You just go to the OpenClaw landing page on Hostinger, click get OpenClaw, choose your plan, and by the way, if you do the 12- or 24-month option, it's even cheaper per month. Then, during setup, you choose your AI provider, pick your communication channel like Telegram or WhatsApp, and launch. And then, once it's live, your agent runs 24/7. AI agents like this used to feel very gatekept.

**7:34** · Like, only the really technical people or big enterprises were able to use them, but now it's pretty cool how easy it's become to set it up and use it for yourself at home. So, if you've wanted your own AI assistant without the headache of managing servers manually, this is probably the easiest way I've seen to do it. Check it out at the link in the description box, and to save even more money, use my code Matt Wolfe for an additional 10% off. And thank you so much to Hostinger for supporting my channel and sponsoring this portion of today's video. Now, before I go any further on this, I do want to give credit where credit is due.

### Karpathy LLM Wiki Concept

**8:06** · This whole LLM knowledge base idea came straight from Andrej Karpathy. I specifically took the idea of using Obsidian as the front end. Obsidian sort of helps organize and easily read markdown files. I'm just sort of extrapolating off of this idea and adding my journaling element and my CRM element to the wiki concept that Andre laid out here. Now, in order to build this, you're going to need a couple tools. I'm going to build this in Codex here. This has been sort of my IDE of choice lately to do coding and projects like this.

### Tools Needed

**8:35** · This is free to download, and you get a certain amount of usage on the free ChatGPT plan, but you're going to get the most out of it if you do end up upgrading. I'm also using Obsidian here. Again, this is just a giant markdown organizer and reader. This is totally free to get. You can find it over at obsidian.md.

**8:52** · You're also going to want the Obsidian web clipper. So, if you're on the obsidian.md website, I can scroll all the way to the bottom here, and you can see there's a link for web clipper.

**9:01** · Click in there, click add to Chrome, and you'll get this little Obsidian web clipper that you can see here in my Chrome. And if I click this, this is what automatically creates a new markdown file, a new note for whatever page you're on. And the cool thing that I really like about this Obsidian web clipper is that it automatically pulls the transcripts from any YouTube video.

**9:20** · So, if I come over here to YouTube and click on one of my recent YouTube videos, and then I come up to the Obsidian web clipper, it'll take a second to load, but it will eventually load the entire transcript for this whole video straight into Obsidian, and that makes it really easy to inject any YouTube video or any article you find around the web directly into your Obsidian vault. So, once you have Obsidian installed on your computer, create a brand new vault, and I'm going to call it second brain, and I'm going to save it in a folder on my computer called second brain.

### The Buildout

**9:49** · Now, I'll open that, and we'll create this new vault, and you can see I have a fresh blank vault with nothing in it yet except for a little welcome message. Now, it's important to remember where on your computer you just saved this vault, cuz that's going to be necessary in the next step here. I'm going to delete this welcome message. It's not going to be necessary, and now we have a purely empty clean vault. So, for the next step, I'm going to jump into Codex, and we're going to actually build the dang thing.

**10:16** · So, over on the left here inside of Codex, I'm going to click on add new project, and then I'm going to select use an existing folder. It's going to open up my browser here to pick the folder, and I'm going to go to the exact folder that we just set our Obsidian vault up with. So, for me, it's this second brain folder that I created here, and we'll go ahead and open that, and then you can see I now have a project over here called second brain. So, to start this off, we're going to build the basic bones of our wiki. And luckily, Andre Karpathy generously gave us this GitHub page that explains exactly how the wiki architecture works.

**10:49** · So, the initial sort of hard part of building the wiki is already figured out for us.

**10:56** · We can just take this URL to this GitHub post here, open up Codex, make sure we're in our second brain project folder here, and giving it the prompt build out architecture based on Karpathy's LLM wiki here. I'm linking to that page on GitHub that we were just looking at, and then I said the current second brain folder is the folder that Obsidian is connected to. It is currently empty, so we're building from scratch. And let's go ahead and let it build out the sort of architecture bones for us based on what Karpathy's already figured out. All right, so it worked for about 5 minutes.

**11:26** · It actually built out a whole bunch of extra files that it didn't need to build. I don't know why it created 51 files. The architecture is actually supposed to be pretty small for this.

**11:37** · So, I literally prompted it, "Please remove all the extra crap and just build what's explicitly called for in Carpathy's game plan." And it says, "Done. I pruned it back to the minimal Carpathy game plan." And now we just have these files built in. If we pop open Obsidian here, you could see we've got just the folders we need. We have the raw folder, we have the wiki folder, we have our agents.md file, our index.md file, and our log.md file. We can see here exactly what each of these is for.

**12:05** · The raw folder is for the immutable source material. This is where the original stuff goes. Raw/assets, this is for optional local Obsidian attachments.

**12:13** · You got the wiki. This is the AI-generated markdown files that it's pulling from the raw content that we're inputting. You have the agents.md file, which basically explains how this whole thing works. So, we can see it's got the operations. When the user adds a source and asks LLM to process it, it does all these things. When the user asks a question, it queries it this way. So, it basically tells it how this agent should operate. You have the index.md file.

**12:39** · This is basically the catalog of everything that's in the wiki. And then you have the log file, where whenever you make updates or changes or add things, it updates the log file. Super, super simple. We're starting bare-bones here. If I look directly in the folder, we just have what you see inside of Obsidian. So, now I'm going to make sure that my Obsidian web clipper is dialed in. So, I'll go ahead and click on this.

**13:00** · We'll click on settings. Make sure you add the name of your vault right here under the vault list. If you're in Obsidian down in the very bottom left corner down here, you can see this is the name of the vault. So, make sure it's the same name exactly. And then over under default, you've got the templates over here. Click on the default template and make sure that you select that Second Brain vault or whatever you titled it. And then I'm having mine pull in these properties.

**13:23** · The source title, the source URL, the date that it was created. That's the date that I'm saving it in the web clipper, not the date that the article was actually written, and it's adding an automatic web clip tag to it. And then for the note content, it's just pulling in the content. A lot of this might actually be set for you by default, but if it's not, this is what it should look like. Under note location, we're going to change this to just say raw, because that is the folder inside of our Obsidian vault that we want it to dump it inside of.

**13:49** · All right, so I can close out of this, and for the very first thing I'm going to ingest, might as well ingest the instructions for how to build one of these wikis. I know it's very meta, but I want it inside of my wiki.

**14:01** · I'll click on my little Obsidian clipper button, and you can see the source title, LLM Wiki, we've got our source URL, the date I'm pulling this in, and the tags for web clip. And then here is all of the content of this page here.

**14:12** · We'll go ahead and click add to Obsidian, and we can see it added it directly inside of the raw folder here inside of Obsidian. Now, nothing's going to happen automatically. We actually need it to tell it to process the files inside of raw for anything to actually happen. But let's add a few more things.

**14:28** · I'm going to look through my YouTube history and ingest some of the recent videos that I've watched, like this video called how to trick your brain into becoming so disciplined your friends will be shocked by your success.

**14:38** · I love a lot of psychology and mindset type videos, so if I want to ingest this, I come up to my web clipper, and you can see it's going to pull in the entire transcript here. So I'm going to go ahead and click add to Obsidian, and once again, we've got another file here under raw. Now, there's one issue that's going to pop up when I pull in YouTube videos, is it's not going to properly know the channel name, because it's not automatically pulling it in into any of these properties. But I can go to codex here and give it some additional instructions.

**15:04** · When I save a video from YouTube using the Obsidian web clipper, and then you go and process the files, make sure it also pulls the channel name from YouTube and adds it as one of the front matter fields. All right, so let's go ahead and do that. So now let's go ahead and do a quick test. We've got two source files in here. So I'm going to jump into Codex and go ahead and tell it to process the files inside the raw folder. Let's see how well it does right now.

**15:32** · All right, so it took about 3 minutes to process and it created a few new sections. So let's just go ahead and pull open Obsidian here and we can see it left the original source material here, but then it started to build out the wiki of everything else. So we've got our compounding knowledge base which was clearly pulled from the explanation from Andre, discipline without willpower. This was pulled from this channel, Aaron Miller study. Let me just double check that it got the channel name correct. Yep, Aaron Merrill study, environment design.

**16:03** · We can see this was from the source discipline without willpower, which was one of the concepts that it saved, which came from this original video that we saved. Identity led goals, LLM wiki, temporal discounting, and temptation bundling. So we can see our wiki is starting to get built out we have our index here, our various sources, the LLM wiki and the discipline without willpower. It actually renamed it cuz it was originally called how to trick your brain into becoming so disciplined your friends will be shocked by your success, but it decided discipline without willpower was a better name for it.

**16:33** · We can see the concepts here and it's starting to build out. And if we look in our log, we can see what it registered in our log so far since we started building this. One thing that I actually like to do as this gets bigger and bigger is you've got this graph view here that starts really small when you first build it and over time you'll see this build out and build out and things get more interconnected with each other and it just gets really cool over time.

**16:58** · Now, I'm going to go seed this with some more content. I'm going to go through my watch history and pull in some of the other videos that I watched recently, using your money to be happier, the art of tripod filmmaking, how to become addicted to doing hard things, if you think you're too busy watch this, how to become a lucky person, and then build your own self-improving AI wiki in 11 minutes. I know that's very meta, but let's go ahead and import that. So, I'm just going to go through and inject every single one of these like we just saw.

**17:23** · I'm going to let it process them all, and then they'll all be in the Wiki, and then we'll move on to the next steps, which are building out the journal and the CRM elements that I mentioned earlier. Okay, so it's done injecting all of those videos that I just saved. It took about 6 minutes here, and this is what my Obsidian looks like now. You can see all of the assets of stuff that I ingested into it, and the Wiki is getting built out quite a bit more. We've got our index here, and as you can see, the index is also getting built out more as well.

**17:50** · If I click into like Hermes agent here, we can see we've got key ideas from this original video plus related content inside of our Wiki. So, Codex capabilities, I click on this one, and it jumps to the video from Riley Brown and the details around that one. Again, this is the very, very simple, basic setup of Carpathys' LLM Wiki. Now, if I come into Codex again, we can essentially chat with the Wiki. So, I come to my second brain folder, click on new chat, and I can ask questions.

### Querying the Wiki

**18:19** · Like, what are some tips for motivation when I don't feel like doing the hard task today? I know I saved a couple videos about this exact topic, and we can see it's already saying, "I'll treat this as a Wiki query. First, I'm checking the vault index, then I'll answer from anything already captured and add the reusable bit back into the Wiki if it isn't there yet." Here's our final response. When you don't feel like doing the hard task, don't wait for motivation to arrive first. Treat it as a task design problem. Make the first few minutes smaller, easier, and more rewarding. Try this.

**18:47** · Gives me a handful of tips, and this was all pulled and grounded from the Wiki, but it also updated the Wiki based on the question that I asked. You can see that it changed the index.md file, the log.md file, and the Wiki motivation for hard tasks. So, opening up my Obsidian vault here again, looking in my log, we can see that it actually logged this query, motivation when avoiding a hard task, answer to query about motivation, and it even updated the index with it.

**19:13** · And it created motivation for hard tasks and linked back to the original sources that it found this information from. So, as you ask questions, the wiki further and further and further builds out based on the questions you were asking. Now, there's a few things that I want to do to clean this up a little bit and make it slightly more useful for me cuz right now, once it processes something, it just leaves it in this raw folder, and this is just going to build up and build up. And so, what I want to do is under this raw folder here, I'm going to go ahead and create a new folder, and I'm going to call it processed.

### Manually Updating the Agent

**19:44** · Whenever it processes one of these files and adds it to the wiki, I want it to move it to the processed folder, so I know that that has already been ingested. So, now that I've got this processed folder, I can simply come down to my agents file here and then tweak what happens when the file is processed. So, if I come down here, we've got operations ingest when the user adds a source and asks the LLM to process it, read the source from raw, create or update wiki pages, update relevant entity concept topic overview synthesis or comparison pages, update index.md, append an entry to log.md.

**20:18** · Well, now I can just add a number six and say move the source file from the root raw directory to raw/processed.

**20:27** · By adding that extra bit to the little prompt here, now it's going to go through all these steps, but then move it into the processed folder. It also misunderstood me when I said to add the channel name. It thought I wanted it to add the channel name to the actual wiki generated page, but I wanted it to add the channel name to the original source. That's what makes the most sense to me.

**20:46** · So, I'm going to come to my agents section here and just tweak that as well. So, right now it says for YouTube videos clipped with Obsidian Web Clipper, also open or inspect the YouTube source URL and add the channel name to the generated wiki page front matter. But instead of that, I'm going to say add the channel name to the original source page front matter. I I want it to link back to the original source. So, I'm going to add a step right after step three here and say cross-link any wiki pages generated or updated to the original source page.

**21:15** · Basically, I don't want these pages orphaned. If there's a new wiki page here, I want it to link to the original page here. So, that's the manual way to update the agents.md file, but you can also do it by prompting it inside of Codex. So, if I come to my second brain project, create a new chat here, I can give it instructions on additional things that I want to happen. So, I mentioned my journal and I mentioned my CRM. So, let me go ahead and build the bones for that here. I will close these folders to clean everything up. I will create a new folder called journal and a new folder called CRM.

### Letting AI Update the Agent & Building Journal / CRM

**21:46** · Now, I can come to Codex and say update the agents.md file to handle these items. Number one, if I start a chat with journal, add the text of that chat and subsequent conversation as a new md file within the journal folder. The entire conversation should be added to the markdown file.

**22:05** · Create an index file in the journal folder that's similar to the wiki index file. Each new journal entry gets added to the index file. Decide on a short title for the journal entry based on the contents of the journal and use the date and the title as the journal entry file name. Add the date and title to the index and link to the entry. Also, log the journal entry title and short summary in the log.md file. Your response to my journal entry should be grounded in content from the wiki in the same way you view the index and respond to my chat questions based on what's in the wiki.

**22:34** · Provide advice and insights to my journal entries based on what's available in the wiki, as well as your own LLM knowledge. Provide helpful advice, insights, guidance, tactics, and ideas using what you know, along with what's available from the wiki, past journal entries, and the CRM. So, when I journal, I want it to look in the wiki, find information that's helpful to what I just journaled on. I want it to look in past journal entries to see if there's anything relevant I've journaled on in the past, and I want it to look at my CRM and see if there's conversations I've had with people about what I'm journaling about, too, for the CRM.

**23:03** · If I tell you I'm giving you information for the CRM, either update the person in the CRM or add the person to the CRM. CRM file should always be a person's name. I will share details about a person, their name, contact details I have for them, details about where or how we met, things that I know about them, etc.

**23:21** · Creator, update the contact record in the CRM with whatever details I give you. In the CRM folder, create an index file similar to our other index files with the name of the people in the CRM listed in alphabetical order and a short bio of what information I have about that person. This will allow me to ask questions about contacts that are inside the CRM.

**23:38** · I want it to update these two things in our agents.md file, which will make it so that whenever I chat with my second brain project here in Codex, it's either one going to answer the question that I asked it using the sort of query task that's already built into the agent, it's going to handle it as a journal if I preempt it with journal here, or if I tell the chatbot that it's for the CRM, it will update the CRM section.

**24:02** · So, I'm going to let it go ahead and update our agents.md file, create the various index files, and that should build out the system for these elements. Okay, so we can see that it updated the agents.md file with our journal rules, our CRM rules, and if we open up Obsidian once again, I can open my journal folder and you can see we've got an index with date entry and summary, and if I open up my CRM, we've got our index with the person and the summary, and where most of the updates happened was this agents.md file. So, now below the wiki section, we have a journal section.

**24:34** · It built all the rules that I just asked it to build for me, and then we also have our CRM section.

**24:40** · So, it created all the rules for the CRM section now. Let's jump into Codex one more time and let's test this out. I'm just going to say add to CRM, and then I'll put Matthew Berman, and then I'll just put met at Qualcomm event in 2024, hung out at CES in 2025, got lunch during TechCrunch disrupt in 2025, and then I would obviously add whatever sort of contact details I have about him, but no point in doing that on camera.

### Testing the CRM

**25:12** · I'll just tell it to add that to the CRM, and we can see updating the CRM record for Matthew Berman, creating a new record, and it says, "Great, I created that." If I look in my Obsidian here, we can see under CRM, we now have a Matthew Berman in CRM here with our summary, no contact details provided, how we met, relationship context, and you know, other stuff that's still empty right now. And then if I look at my index, we can see it added the person, Matthew Berman, and a quick summary there. It also added it to the log down here that the CRM was updated.

**25:40** · But the idea being is, let's say I'm going to a conference, and I bump into somebody, and I'm like, "Oh, shoot, where did we meet?" I can jump into my second brain and say, "Where did I meet Matthew Berman again?" I'll check the vault and CRM records. You met Matthew Berman at Qualcomm event in 2024 according to your CRM notes. So, a really good way to reference information later. I'm going to go ahead and make a pretend journal.

### Testing the Journal

**26:03** · So, what I'll do is I'll click on a new chat inside of my second brain project here, and I'll start it with journal, and then I'll go to another line, and I'll just brain dump some thoughts. So, this is just a simple demo journal entry, but you know, it's got some reality to it. I have a ton of ideas for videos, but I decide not to make them because I'm worried they won't get a good view count.

**26:22** · I also talk about how I know how to write titles that will get a lot of clicks, but I also hate the whole clickbait thing, so I end up making titles that I know will get less clicks because they're more literal to what the video is about, and I constantly grapple with making videos that will get a lot of clicks, but knowing I'll get hate in the comments because they're too click-baity versus making videos that the title is very literal, so I won't get the hate comments, but I'll also get a lot of less views.

**26:50** · And that's something that I grapple with, and I know pretty much every YouTuber grapples with. And so, that's my short journal entry. So, let's go ahead and submit that and see what happens. I'll treat this as a journal entry and grab the response in the vault first. Going to read the indexes, look for relevant prior notes around creating video attention, then I'll write the journal file before answering. The vault has several creator strategy pages. I'm pulling those in rather than answering from a blank slate. There aren't prior journal entries yet, and the CRM doesn't appear relevant to this one. So, it's just pulling from the wiki. Okay, and check out this journal response here.

**27:20** · I think there are two fears braided together here, creative integrity and channel safety. One part of you does not want to betray the video with a title that feels gross. Another part is afraid that a few underperformers will teach YouTube not to trust you. The creator notes in the vault push back on the second fear. YouTube value of death and creator persistence both frame visible metrics as lagging indicators. A few lower view videos are not a downward spiral, blah blah blah. So, it is actually grounding the response to my journal in what is existing in the wiki.

**27:49** · And then it actually goes on to just give a response that ChatGPT would normally give, but it's pulling from both the knowledge built into the LLM as well as the knowledge in the wiki. So, that's all working exactly as intended. And then if I want to pop open Obsidian here, I can open my journal folder, and we can see here is my journal entry. Here is what the assistant replied with.

**28:10** · Here's some synthesis, and here's some related content about what I'm journaling about. If I look at my index here, it automatically logged the date, the entry title, and a quick like one paragraph summary of what my journal entry is about. Now, I want some of this to happen on autopilot. I don't want to have to jump into Codex constantly and tell it to process everything that I saved in here. And there's an easy solution for that. Before I show you, I'm going to do one thing.

**28:34** · I'm going to go ahead and clean up my existing Obsidian wiki because, remember, I want these to all get moved into processed, and I also want it to save the YouTube channel name up here in the front matter. So, I'm going to tell it, "Please reprocess all of the files in the raw directory following the recent updated instructions on how to process them." So, I'm going to let that process. It's going to clean up my wiki real quick.

**29:01** · All right, now that that's finished and my Obsidian vault is cleaned up and we can see all of my videos have been moved to process and it added the channel name to the original videos here. Let's automate some of this. So, in Codex here, you've got a feature called automations. This is where you can set it up to do recurring tasks. So, if I click into automations here, select new automation. For automation title, we'll call it process second brain raw files. For work tree, I'm going to set it on local so it runs directly in the selected project. For our project, we're going to select second brain. Here, we'll select when we want it to run.

### Automating The Wiki Linking

**29:33** · I'm going to go ahead and set mine to hourly, but you can do it at whatever cadence you want. And I'm just going to say if there are any unprocessed files inside the raw directory, please process them now. For the model, I'm going to set it as a GPT-5.5.

**29:49** · I recommend just using the strongest model you have available. I'm going to set it on high reasoning and I will create this automation. Now, it's going to run every hour, see if there's anything in my raw folder that's unprocessed, and then it will process it. And that's it. That's the whole process now. Whenever I come across stuff I want to save, I just use the Obsidian web clipper and clip it into my raw folder automatically. And every hour, it's going to ingest that and turn it into one of the wiki pages. If I want to add somebody to my CRM, I just open up Codex, create a new chat inside of this project, and add the CRM details.

**30:21** · If I feel like journaling right now, I can journal straight into my second brain, and it will ground the response in what's available in my wiki, past journals, and within my CRM. If you want an extra layer of backup, you can also go to GitHub, create a new repository on GitHub. I'm going to go ahead and call this one second brain. I'm going to set this to private, so it's only available to me, and I'll create the repository.

### Backing it all up to GitHub

**30:43** · Now, if I copy this URL, jump back over to Codex here, I can say commit this current version to my private GitHub repo here. Pasting the URL of the private GitHub repo I just created, and then go ahead and submit it. Now, I've previously attached the GitHub plugin, so it should just work out of the box.

**31:02** · You can see I'm already synced with GitHub, but if you haven't done that already, just add the GitHub plugin and go through the motions to get that set up, and you should be good to go. And it went ahead and pushed it to GitHub, so if I open my browser here and refresh, we can see everything I've created is all saved on GitHub now. If I jump back into Codex, I can go to my automation and edit this automation and say if there are any unprocessed files in the raw directory, please process them now.

**31:28** · Once everything is processed, please commit and push the current version of the directory to the main branch on GitHub. So, now it's going to process everything in the raw directory, and then once it's done processing, it's going to update GitHub so that backup is constantly happening every hour. And there you have it. There's the whole second brain process. Not only do you have a wiki of all of the information you're finding and saving from around the internet, but now you have a journal and a CRM that's built on top of it as well.

### Recap and Final Thoughts

**31:51** · And if you ever want to tweak how it operates, you just open up Obsidian, which is your visibility layer to see how everything is built, and you go into agents.md, and you just tweak the instructions. This is all just prompts at the end of the day. You just change how it gets prompted. And in the short amount of time that we've been working on it, this is what our graph view looks like now, and we can start to see all of these things interconnect with each other a little bit more. Do this for a few days and a few weeks, and the next thing you know, you have a vault that looks like this.

**32:19** · Uh yeah, pretty insane, crazy vault that just has a ton of information saved inside of it. So, I know that video was long. There was a lot of details. I wanted to make sure it was very clear and you got the whole process, and I didn't skip any steps, but I want to show you how I've been building this sort of second brain concept that I can journal on top of that I have a CRM on top of where all of the wiki elements are interconnected.

**32:42** · You can even dial it in more by building in separate folders and telling it to break out people from different pieces of content and break out companies from different pieces of content and really, really dial in that wiki more and more and more. But really, really cool concept. All you really need is Obsidian and Codex. Anthropic's co-work or Claude code also works. Whatever your sort of front-end chat platform of choice is.

**33:07** · I've been really liking Codex lately, so that's what I've been using. But yeah, go build it. It's really, really cool and a lot simpler than you think and over time it just gets smarter and smarter and smarter and more and more powerful. So, that's what I got for you.

**33:20** · This isn't like my normal videos. I normally make end of week news breakdowns where every single Friday I break down all of the news that happened in the AI world for the week. I drink from the fire hose all week, keep up with all of the news, keep myself completely looped in so that other people don't have to feel overwhelmed.

**33:37** · I'll take on the overwhelm and just report what I think is the most interesting. I put those videos out every single Friday. If stuff like that, as well as tutorials like this, are something that interest you, maybe consider liking this video and subscribing to this channel. It really, really helps me out a lot. But again, that's what I got. Thanks for hanging out with me, nerding out with me. Hopefully, I'll see you in the next one.

**33:55** · Bye-bye.