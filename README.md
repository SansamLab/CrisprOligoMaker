# CrisprOligoMaker

![Release](https://img.shields.io/github/v/release/SansamLab/Cut_And_Run_Analysis_SnakeMake?include_prereleases)
![ReleaseDate](https://img.shields.io/github/release-date/SansamLab/CrisprOligoMaker)
![Size](https://img.shields.io/github/repo-size/SansamLab/CrisprOligoMaker)
![License](https://img.shields.io/github/license/SansamLab/CrisprOligoMaker)
![LastCommit](https://img.shields.io/github/last-commit/SansamLab/CrisprOligoMaker)
![Downloads](https://img.shields.io/github/downloads/SansamLab/CrisprOligoMaker/total)
![OpenIssues](https://img.shields.io/github/issues-raw/SansamLab/CrisprOligoMaker)
[![DOI](https://zenodo.org/badge/468099411.svg)](https://zenodo.org/badge/latestdoi/468099411)

<figure>
<img src="graphic.png" alt="Trulli" style="width:60%">
<figcaption align = "bottom" style=" text-align : right">image made in BioRender.com</figcaption>
</figure>


---

This Shiny app converts a Cas9 single guide RNA (sgRNA) sequence, without the NGG PAM, into upper and lower oligo sequences for cloning into Zhang Lab CRISPR plasmids that have undergone digestion with BbsI restriction enzyme. The app includes a text box with a description of what it does and a link to the instructions for cloning sgRNA oligos into pX330 plasmids. In addition to displaying the upper and lower oligo sequences, the app also outputs the complementary top and bottom strands, and displays them in a visually informative manner.

This app is built using the R Shiny package and can be run locally on a computer. To get started, open the app in R and enter a Cas9 sgRNA sequence (without the NGG PAM) in the text box. Then, click the "Submit" button to convert the sequence into upper and lower oligo sequences and complementary strands.

To Run in R Studio:
```
library(shiny)
library(magritrr)

# Run the app from the Github repository
shiny::runGitHub("SansamLab/CrisprOligoMaker")
```
