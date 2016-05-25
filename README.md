# Shenandoah Index

To use these files as a template for another index:

* First *fork* the files to your github account by replicating the steps under "Fork an example repository" [here](https://help.github.com/articles/fork-a-repo/). This will give you a fresh copy of the site - you can make changes and they will not affect this original copy.
* Now you have the files copied to your account, but they're not actually on your computer just yet. To get the files so that you can edit them, you will *[clone](https://help.github.com/articles/cloning-a-repository/)* them to your computer. If you have never used the command line before, follow the steps under "Cloning a repository to GitHub Desktop." You will need to download and install [GitHub Desktop](https://help.github.com/desktop/guides/getting-started/installing-github-desktop/) to do so.
* Now that you have copies of everything on your computer, replace the relevant content in the subtitle section of index.html and of about.html with the content relevant to your own site.
* Contact your web administrator to set up the domain for your index. You will also need a database and ASPX files to enable dynamic searching of your index.
* Upload the files onto your server.
* Modify the path in the embedded iframe to point to the ASPX file that loads the database (this ASPX file must be on the same server). You're looking in index.html to replace something that looks like this:

'''<iframe name="search-frame" src="http://MData1.ad.wlu.edu/ShenandoahExplorerApp/Explore.aspx"></iframe>'''

with

'''<iframe name="search-frame" src="path_to_your_aspx_files"></iframe>'''