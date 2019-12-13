# Use cases for S-ENDA
Use case descriptions for the S-ENDA project

# Conventions


We adopt the following system for branching and merging:

* master branch: 
  * only for complete use case descriptions (corrections/changes are handled in hotfix branches)
  * numbered releases of the code
  * Never edited
  * Merged from issue and hotfix branches
  * Long living
* `issue<NNN>_<short-heading>`
  * ideas for new use cases should be described in regular issues (at
      https://github.com/metno/use-cases-for-S-ENDA/issues). They can be simple one line, or more
      elaborate, descriptions
  * for each issue, we create issue branches in which the respective issue is solved and reviewed
  * an issue branch is an issue specific branch (NNN = issue number)
  * Main working area
  * Short living
  * Branched from, and merged back into master
* `hotfix<NNN>_<short-heading>`
  * branches that are specific to an existing use case, i.e., deals with changes on complete use cases that are present in the master branch


Note:

* Never edit code in the master branch. Always make a new branch for your edits.
* A new branch should be very specific to only one problem. It should be short living.
* Commit often.
* Branch often.
* Branch only from master.
* Create pull requests for your branches and always assign a reviewer to merge, delete the branch, and close the issue (this is easy in github)



The master branch will be linked from readthedocs (and/or similar), and shall be complete, nice and
understandable - i.e., so it does not give the impression that it is half-done work...

    Please use English language for the use case descriptions
