## Resubmission
This is a resubmission. In this version I have:

* Converted the DESCRIPTION title to title case.
* More clearly identified the roles in the DESCRIPTION
* Put the cran-comments.md in .Rbuildignore
* And add \dontrun{} to the examples for the elapsed time notes
* Verified that the errors in ubuntu and fedora correspond to external libraries of the sf package, documented in DESCRIPTION in the SystemRequirements section, in addition to what was already included in the README file

## Test enviroments
* Ubuntu Linux 18.04, R-release
* Windows 7 Professional (x64), R 3.4.3
* Rhub
  * Ubuntu Linux 16.04 LTS, R-release, GCC
  * Fedora Linux, R-devel, clang, gfortran
* win-builder (devel)

## R CMD check results

0 ERRORs | 0 WARNINGs | 0 NOTES.