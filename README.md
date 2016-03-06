Add-ons for SCoNEs - Google Summer of Code 2016
-----------------------------------------------

This repository is my submission for the C3G Montreal node's "Develop add-ons for SCoNEs" Google Summer of Code 2016 idea.

The task at hand was to implement a basic viewer function in R for logRatio signal (see attached .tsv). The solution in this repository is a Shiny application with a simple DataTable widget. With this interactive table, researchers can parse through the output of SCoNEs to find features of interest.

### Installation

``` r
install.packages(c("shiny", "DT"))
```

This Shiny application can be run in R with `shiny::runGitHub`.

``` r
shiny::runGitHub("gsoc-SCoNEs-addon", "taylo5jm")
```

If you would like to run the application with `Rscript` from a terminal:

``` r
Rscript -e "shiny::runGitHub('gsoc-SCoNEs-addon', 'taylo5jm')"
```

Finally, this application can be run from the source files. In a terminal:

``` r
git clone https://github.com/taylo5jm/gsoc-SCoNEs-addon
cd gsoc-SCoNEs-addon
Rscript -e "shiny::runApp()"
```

### Implementation Comments

Shiny is a web application framework for R that provides fast prototyping for tasks of this nature. With the R package DT, we are tapping in to popular DataTables Javascript library. Therefore, this application can be modified by those with experience in JavaScript, as well as R programmers with little experience in front-end web development. For example, a data analyst can easily add a new variable to the rendered table and a front-end developer can add HTML tags in the R source code to escape table content.

Second, this application can be easily modified to better suit the needs of a data analyst proficient in R, rather than an end-user. Suppose that a data analyst might want to subset this table in a graphical interface, but is primarily interested in applying operations to the data in R after subsetting. With a few small modifications, this application can return a subsetted data frame as a Shiny gadget.
