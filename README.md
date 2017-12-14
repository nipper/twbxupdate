#twbxupdate

twbxupdate is a small R package for updating the data inside a Tableau .twbx file.

## Install

To install it you need to use devtools. If you don't have that installed you can install it use 

`install.packages("devtools")`

Then you can install it:

`devtools::install_github("nipper/twbxupdate")`

## Using

To use just call the update_twbx() function. You pass it a vector of files and workbook to update. An example:

`update_twbx("fancy_data.xlsx","cool viz.twbx")`

Thats it. It'll probably break. If it does open an issue.
