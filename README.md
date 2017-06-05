# Instructions on creating the repo
[Create the repo](https://help.github.com/articles/create-a-repo/) using your own Github account.
When you create don't add a README or LICENSE. This will make sure to initialize an empty repo

Open a command line and do the following. Where `MY_NEW_REPO_NAME_HERE` is the name of your github repo and `MY_NEW_REPO_URL` is the url generated when you create the new repo. 

```bash
# Clone the template repo to the local file system
git clone https://github.com/xmatters/xm-labs-template.git
# Change the directory name to avoid confusion and then cd into it
mv xm-labs-template MY_NEW_REPO_NAME_HERE  
cd MY_NEW_REPO_NAME_HERE
# We have to tell git that the place it needs to push is not where it came from
git remote set-url origin https://MY_NEW_REPO_URL.git
# Pust to the remote repo
git push -u origin master
```

Then, edit all your files and drop any new ones into the `MY_NEW_REPO_NAME_HERE` directory. Once you are finished, let Travis know and he will then fork it to the xMatters account and update the necessary links in the xM Labs main page. From there if you update your repo, those changes can be merged into the xMatters account repo and everything will be kept up to date!

# Template below:
---

# Product Name Goes Here
A note about what the product is and what this integration/scriptlet is all about. Check out the sweet video [here](media/mysweetvideo.mov). 

# Pre-Requisites
* Version 453 of App XYZ
* Account in Application ABC
* xMatters account - If you don't have one, [get one](https://www.xmatters.com)!

# Files
* [FileA.js](FileA.js) - The javascript file to be pasted into a Shared Library. It generally does xyz. 
* [MySweetCommPlan.zip](MySweetCommPlan.zip) - The comm plan (if needed) that has all the coold scripts and email format and such. 

# Installation
Details of the installation go here. 

## Application ABC set up
Specific steps go here

## xMatters set up
1. Create a new Shared Library or (In|Out)bound integration
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
