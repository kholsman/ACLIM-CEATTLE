ACLIM Repo: [**github.com/kholsman/ACLIM**](https://github.com/kholsman/ACLIM "ACLIM Repo")

``` r
 #source("R/make.R")       # loads packages, data, setup, etc.
 thisYr <- format(Sys.time(), "%Y")
 today  <- format(Sys.time(), "%b %d, %Y")
```

#### Repo and data files maintained by:

-   Kirstin Holsman
    Alaska Fisheries Science Center
    NOAA Fisheries, Seattle WA
    **<kirstin.holsman@noaa.gov>**
    *Last updated: 2020*

1 Overview
----------

This document summaries the CEATTLE multispecies stock assessment model simulations conducted as part of the Alaska Climate Integrated Modeling (ACLIM) project multimodel comparison. The simulations included in this evaluation are available for download and use with permission from <kirstin.holsman@noaa.gov>.

With permission, please also cite this data as:

\[ TO ADD \]

1.1 ACLM Overview
-----------------

Various simulation outputs were made available for use in this analysis through the interdisciplinary [Alaska Climate Integrated Modeling (ACLIM) project](%22https://www.fisheries.noaa.gov/alaska/ecosystems/alaska-climate-integrated-modeling-project%22). An overview of the project and simulation experiments can be found in [Hollowed et al. 2020](%22https://www.frontiersin.org/articles/10.3389/fmars.2019.00775/full%22).

1.2 Climate scenarios
---------------------

The simulations include the model fit to data from 1979 - 2017 and projections derived from ACLIM suite of CMIP5 downscaled projections under various representative concentration pathways:

| CMIPx ARx | GCM     | Scenario     | Def             | Years       | Model | Source     |
|-----------|---------|--------------|-----------------|-------------|-------|------------|
| na        | CORECFS | hindcast     | ACLIM Hindcast  | 1970 - 2017 | H16   | ACLIM/RTAP |
| na        | CORECFS | Persistence  | Avg. 10 y hind. | 2018 - 2100 | H16   | ACLIM      |
| CMIP3 AR4 | MIROC   | A1B          | Med baseline    | 2006 - 2048 | H16   | BSIERP     |
| CMIP3 AR4 | ECHOG   | A1B          | Med baseline    | 2006 - 2048 | H16   | BSIERP     |
| CMIP3 AR4 | CCCMA   | A1B          | Med baseline    | 2006 - 2048 | H16   | BSIERP     |
| CMIP5 AR5 | GFDL    | RCP 4.5      | Med. mitigation | 2006 - 2100 | H16   | ACLIM/FATE |
| CMIP5 AR5 | MIROC   | RCP 4.5      | Med. mitigation | 2006 - 2100 | H16   | ACLIM/FATE |
| CMIP5 AR5 | CESM    | RCP 4.5      | Med. mitigation | 2006 - 2100 | H16   | ACLIM/FATE |
| CMIP5 AR5 | GFDL    | RCP 8.5      | High baseline   | 2006 - 2100 | H16   | ACLIM/FATE |
| CMIP5 AR5 | GFDL    | RCP 8.5bio\* | High baseline   | 2006 - 2100 | H16   | ACLIM/FATE |
| CMIP5 AR5 | MIROC   | RCP 8.5      | High baseline   | 2006 - 2100 | H16   | ACLIM/FATE |
| CMIP5 AR5 | CESM    | RCP 8.5      | High baseline   | 2006 - 2080 | H16   | ACLIM/FATE |
| CMIP5 AR5 | CESM    | RCP 8.5bio\* | High baseline   | 2006 - 2080 | H16   | ACLIM/FATE |

For more information about the downscaling models underpinning these simulations see Hermann et al. 2016,2019 and Kearney et al. 2020.

1.3 CEATTLE trophic and harvest scenarios:
------------------------------------------

| simulation | Trophic | HCR              | Catch   | Recruitment  | Model   | Source     |
|------------|---------|------------------|---------|--------------|---------|------------|
| xxx        | Yes     | CE-B40,CNaive B0 | C = ABC | ricker + SST | CEATTLE | ACLIM/RTAP |

2 Getting started:
==================

2.1. Download the code from the github repository:
--------------------------------------------------

``` r
    # download the code:
    main_nm       <- "EBM_Holsman_NatComm-master"
    download_path <- path.expand("~/desktop")
    main          <- file.path(download_path,main_nm)
   
    # download the code:
    dest_file     <- file.path(download_path,paste0(main_nm,".zip"))
    url           <-"https://github.com/kholsman/EBM_Holsman_NatComm/archive/master.zip"
    download.file(url=url, destfile=dest_file)
    
    # unzip the .zip file
    setwd(download_path)
    unzip (dest_file, exdir = "./",overwrite = T)
    setwd(main)
```

2.2. Download data from figshare:
---------------------------------

To run the analyses or create the paper figures you will now need to download the large zipped data folder here: <https://figshare.com/s/bc27693d6b9002425bff> (DOI: ) and copy - paste the contents (folders "in" and "out"") it in the directory: '\[your local directory path\]/EBM\_Holsman\_NatComm/data' or simply run the following script to download and place the data in the correct sub-folders:

``` r
    cat("The download takes a few mins (large data files)...\n")

    url <-  "https://ndownloader.figshare.com/files/23442137?private_link=81007e2dd5edee0a5a7a"
    dest_path  <-  file.path(main,"data.zip")
    download.file(url=url, destfile=dest_path,method="libcurl")
    
    cat("\nDownload complete...\n")
    
    unzip (file.path(main,"data.zip"), exdir = "./",overwrite=T)
    cat("\nFiles unzipped successfully...\n")
```

3.1. Set things up:
-------------------

The first step is to run the make.R script to load the data, packages, and setup (where various options are specified). Note that the scripts depend on a number of packages that will be installed the first time through running make.R if they are not already included. *A list of those packages can be found in 'EBM\_Holsman\_NatComm/R/packages.R'.*

``` r
    # set your local path:
    # main        <-  file.path(download_path,"EBM_Holsman_NatComm/")
    # e.g., main  <-  getwd()
    setwd(main)
    
    # load data, packages, setup, etc.
    source("R/make.R")
```

4 Primary and Intermediate Data sources and models
==================================================

Various simulation outputs were made available for use in this analysis through the interdisciplinary [Alaska Climate Integrated Modeling (ACLIM) project](%22https://www.fisheries.noaa.gov/alaska/ecosystems/alaska-climate-integrated-modeling-project%22). An overview of the project and simulation experiments can be found in [Hollowed et al. 2020](%22https://www.frontiersin.org/articles/10.3389/fmars.2019.00775/full%22).

4.1. Bering10K ROMSNPZ
----------------------

ACLIM indices used in this analysis can be viewed interactively online at: <https://kholsman.shinyapps.io/aclim>. The indices were produced for the ACLIM project and derived from the outputs of the Bering10K ROMSNPZ model. Downscaled hindcasts and CMIP5 projections of oceanographic and lower trophic conditions from the Bering10K model were developed as part of the ACLIM project. An overview of these projections and the Bering10K ROMSNPZ model can be found in [Hermann et al. 2019](%22https://academic.oup.com/icesjms/article/76/5/1280/5477847%22), [Kearney et al. 2020](%22https://gmd.copernicus.org/articles/13/597/2020/%22), and [Hollowed et al. 2020](%22https://www.frontiersin.org/articles/10.3389/fmars.2019.00775/full%22). An overview of the Bering10K ROMSNPZ model can be found [here](%22https://beringnpz.github.io/roms-bering-sea/intro/%22).

Kearney K, Hermann A, Cheng W, Ortiz I, Aydin K (2020) A coupled pelagic-benthic-sympagic biogeochemical model for the Bering Sea: documentation and validation of the BESTNPZ model (v2019.08.23) within a high-resolution regional ocean model. Geosci Model Dev 13:597-650. <DOI:10.5194/gmd-13-597-2020>.

4.2. CEATTLE
------------

CEATTLE is a climate-enhanced multispecies stock assessment model for walleye pollock, Pacific cod, and arrowtooth flounder ([Holsman et al. 2016](%22https://www.sciencedirect.com/science/article/pii/S0967064515002751%22), [2019](%22https://archive.afsc.noaa.gov/refm/docs/2019/EBSmultispp.pdf%22)) that has been updated annually and included as an appendix to the BSAI walleye pollock stock assessment ([Ianelli et al. 2019](%22https://archive.afsc.noaa.gov/refm/docs/2019/GOApollock.pdf%22)) since 2016 as part of the Bering Sea fishery stock assessment process. As part of ACLIM CEATTLE was coupled to the ROMSNPZ model and the ATTACH model (below) to generate projections of species biomass and catch under future climate conditions in the Bering Sea. Methods for this coupling and projection simulation can be found in Holsman et al. submitted and Hollowed et al. 2020. The simulation outputs, scripts, and input data files used to generate these simulations can be found on the ACLIM-CEATTLE gitrepo and figshare sites. Details about the CEATTLE model can be found in the [2018 Multispecies assessment](%22https://archive.fisheries.noaa.gov/afsc/REFM/Docs/2018/BSAI/2018EBSmultispp-508.pdf%22) and [2019 Assessments](%22https://archive.afsc.noaa.gov/refm/docs/2019/EBSmultispp.pdf%22).

Three harvest simulations are included in the available simulations: 1. Catch = ABC where multispecies assessment simulations (run in ADMB) using climate naive reference points for BO but climate specific B40 and projections (climate effects on growth, M2, and recruitment). 2. Catch = ABC + sloping harvest control rule below B40, and with F = 0 when B &lt; B20. 3. As in 2 but where catch~f(ABC,TAC) via the ATTACH package (below).

4.3. ATTACH
-----------

The catchfunction package (which we refer to as the ABC To TAC and Commercial Harvest, aka ATTACH, model: R package rename forthcoming) was created for the Alaska Climate Integrated Modeling Project (ACLIM) by Amanda Faig (University of Washington; School of Aquatic Fisheries and Sciences) and Alan Haynie (NOAA; NMFS). This function, in a nutshell, takes Bering Sea (BS) acceptable biological catch (ABC) as input and uses a series of regression estimates to predict total allowable catch (TAC) and from that the commercial harvest in the Bering Sea, based on ABC, TAC, and catch data from 1992 to 2017. Documentation and code for ATTACH can be found on the [attach github](%22https://github.com/amandafaig/catchfunction%22).