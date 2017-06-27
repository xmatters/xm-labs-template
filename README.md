# Instructions on creating the repo
[Create the repo](https://help.github.com/articles/create-a-repo/) using your own Github account.
When you create don't add a README or LICENSE. This will make sure to initialize an empty repo

*Note*: These instructions are for using git at the terminal. The github desktop client is rather limited and likely won't save you any headaches. 

Open a command line and do the following. Where `MY_NEW_REPO_NAME_HERE` is the name of your github repo and `MY_NEW_REPO_URL` is the url generated when you create the new repo. 

```bash
# Clone the template repo to the local file system. 
git clone https://github.com/xmatters/xm-labs-template.git
# Change the directory name to avoid confusion, then cd into it
mv xm-labs-template MY_NEW_REPO_NAME_HERE
cd MY_NEW_REPO_NAME_HERE
# Remove the template git history
rm -Rf .git/
# Initialize the new git repo
git init
# Point this repo to the one on github
git remote add origin https://github.com/MY_NEW_REPO_URL.git
# Add all files in the current directory and commit to staging
git add .
git commit -m "initial commit"
# Push to cloud!
git push origin master
```

Then, make the updates to the `README.md` file and add any other files necessary. `README.md` files are written in github flavored markdown, see [here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) for a quick reference. Periodically, do a `git commit` to stash the changes locally, then `git push origin master` to push the local changes to github.com. 

Once you are all finished, let Travis know and he will then fork it to the xMatters account and update the necessary links in the xM Labs main page. From there if you update your repo, those changes can be merged into the xMatters account repo and everything will be kept up to date!

# Template below:
---

# Product Name Goes Here
A note about what the product is and what this integration/scriptlet is all about. Check out the sweet video [here](media/mysweetvideo.mov). 

# Pre-Requisites
* Version 453 of App XYZ
* Account in Application ABC
* xMatters account - If you don't have one, [get one](https://www.xmatters.com)!

# Files
* [MySweetCommPlan.zip](MySweetCommPlan.zip) - The comm plan that has all the coold scripts and email format and such. If it doesn't make sense to have a full comm plan, then just use a couple js files like the one below. 
* [FileA.js](FileA.js) - The javascript file to be pasted into a Shared Library. It does xyz. 

# How it works
Add some info here detailing the overall architecture and how the integration works. I.e. An action happens in Application XYZ which triggers the thingamajig to fire a REST API call to the xMatters Inbound Integration. The integration script then parses out the payload and builds an event and passes that to xMatters. 

# Installation
Details of the installation go here. 

## Application ABC set up
Specific steps go here

Images are encouraged. Adding them is as easy as:
```
<kbd>
  <img src="media/cat-tax.png" width="200" height="400">
</kbd>
```

<kbd>
  <img src="media/cat-tax.png" width="200" height="400">
</kbd>


## xMatters set up
1. Steps to create a new Shared Library or (In|Out)bound integration or point them to the help to import a comm plan (link: http://help.xmatters.com/OnDemand/xmodwelcome/communicationplanbuilder/exportcommplan.htm)
2. Add this code here:
   ```
   var items = [];
   items.push( { "stuff": "value"} );
   console.log( 'Do stuff' );
   ```
   
# Testing
Be specific. What should happen to make sure this code works? What would a user expect to see?

# Troubleshooting
Optional section for how to troubleshoot. Especially anything in the source application that an xMatters developer might not know about. 
