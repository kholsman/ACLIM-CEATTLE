CEATTLE ACLIM Repo: [**github.com/kholsman/ACLIM-CEATTLE**](https://github.com/kholsman/ACLIM-CEATTLE)

#### Repo and data files maintained by:

-   Kirstin Holsman
    Alaska Fisheries Science Center
    NOAA Fisheries, Seattle WA
    **<kirstin.holsman@noaa.gov>**
    *Last updated: Aug 12, 2020*

1 Overview
----------

This document summaries the CEATTLE multispecies stock assessment model simulations conducted as part of the Alaska Climate Integrated Modeling (ACLIM) project multimodel comparison. The simulations included in this evaluation are available for download and use with permission from <kirstin.holsman@noaa.gov>.

With permission, please also cite this data as:

\[ TO ADD \]

1.1 ACLIM Overview
------------------

Various simulation outputs were made available for use in this analysis through the interdisciplinary [Alaska Climate Integrated Modeling (ACLIM) project](%22https://www.fisheries.noaa.gov/alaska/ecosystems/alaska-climate-integrated-modeling-project%22). An overview of the project and simulation experiments can be found in [Hollowed et al. 2020](%22https://www.frontiersin.org/articles/10.3389/fmars.2019.00775/full%22).

1.2 Climate scenarios
---------------------

The simulations include the model fit to data from 1979 - 2017 and projections derived from ACLIM suite of CMIP5 downscaled projections under various representative concentration pathways (note bold scenarios are those included in the Holsman et al. 2020 paper):

### Table 1: Climate scenarios:

| CMIPx ARx     | GCM     | Scenario     | Def             | Years       | ROMSNPZ Model | Source     |
|---------------|---------|--------------|-----------------|-------------|---------------|------------|
| na            | CORECFS | hindcast     | ACLIM Hindcast  | 1970 - 2017 | H16           | ACLIM      |
| na            | CORECFS | Persistence  | Avg. 10 y hind. | 2018 - 2100 | H16           | ACLIM      |
| CMIP3 AR4     | MIROC   | A1B          | Med baseline    | 2006 - 2048 | H16           | BSIERP     |
| CMIP3 AR4     | ECHOG   | A1B          | Med baseline    | 2006 - 2048 | H16           | BSIERP     |
| CMIP3 AR4     | CCCMA   | A1B          | Med baseline    | 2006 - 2048 | H16           | BSIERP     |
| CMIP5 AR5     | GFDL    | RCP 4.5      | Med. mitigation | 2006 - 2100 | H16           | ACLIM/FATE |
| **CMIP5 AR5** | MIROC   | RCP 4.5      | Med. mitigation | 2006 - 2100 | H16           | ACLIM/FATE |
| **CMIP5 AR5** | CESM    | RCP 4.5      | Med. mitigation | 2006 - 2100 | H16           | ACLIM/FATE |
| **CMIP5 AR5** | GFDL    | RCP 8.5      | High baseline   | 2006 - 2100 | H16           | ACLIM/FATE |
| **CMIP5 AR5** | MIROC   | RCP 8.5      | High baseline   | 2006 - 2100 | H16           | ACLIM/FATE |
| **CMIP5 AR5** | CESM    | RCP 8.5      | High baseline   | 2006 - 2080 | H16           | ACLIM/FATE |
| CMIP5 AR5     | CESM    | RCP 8.5bio\* | High baseline   | 2006 - 2080 | H16           | ACLIM/FATE |
| CMIP5 AR5     | GFDL    | RCP 8.5bio\* | High baseline   | 2006 - 2100 | H16           | ACLIM/FATE |

For more information about the downscaling models underpinning these simulations see Hermann et al. 2016,2019 and Kearney et al. 2020.

1.3 CEATTLE trophic and harvest scenarios:
------------------------------------------

Included in the simulation set below (see code) are 4 core simulations as part of the Holsman et al. 2020 Nature Communications paper. Those are summarized as:

### Table 2: Managment and model scenarios:

<table style="width:100%;">
<colgroup>
<col width="20%" />
<col width="8%" />
<col width="16%" />
<col width="12%" />
<col width="13%" />
<col width="12%" />
<col width="9%" />
<col width="6%" />
</colgroup>
<thead>
<tr class="header">
<th>Simulation</th>
<th>Trophic</th>
<th>HCR</th>
<th>Harvest Scenario</th>
<th>Recruitment</th>
<th>Model</th>
<th>Source</th>
<th>MC</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>ssm_noCap</td>
<td>No</td>
<td>CNaive B0 &amp; B40, CE-SL_HCR</td>
<td>C = ABC</td>
<td>ricker + covars</td>
<td>CEATTLE</td>
<td>ACLIM</td>
<td>no (mean)</td>
</tr>
<tr class="even">
<td>msm_noCap</td>
<td>Yes</td>
<td>CNaive B0 &amp; B40, CE-SL_HCR</td>
<td>C = ABC</td>
<td>ricker + covars</td>
<td>CEATTLE</td>
<td>ACLIM</td>
<td>no (mean)</td>
</tr>
<tr class="odd">
<td>ssm_2mtCap</td>
<td>No</td>
<td>CNaive B0 &amp; B40, CE-SL_HCR</td>
<td>C = ATTACH (f~ABC)</td>
<td>ricker + covars</td>
<td>CEATTLE</td>
<td>ACLIM</td>
<td>no (mean)</td>
</tr>
<tr class="even">
<td>msm_2mtCap</td>
<td>Yes</td>
<td>CNaive B0 &amp; B40, CE-SL_HCR</td>
<td>C = ATTACH (f~ABC)</td>
<td>ricker + covars</td>
<td>CEATTLE</td>
<td>ACLIM</td>
<td>no (mean)</td>
</tr>
<tr class="odd">
<td>ssm_noCapMC</td>
<td>No</td>
<td>CNaive B0 &amp; B40, CE-SL_HCR</td>
<td>C = ABC</td>
<td>ricker + covars</td>
<td>CEATTLE</td>
<td>ACLIM</td>
<td>1-100</td>
</tr>
<tr class="even">
<td>msm_noCapMC</td>
<td>Yes</td>
<td>CNaive B0 &amp; B40, CE-SL_HCR</td>
<td>C = ABC</td>
<td>ricker + covars</td>
<td>CEATTLE</td>
<td>ACLIM</td>
<td>1-100</td>
</tr>
<tr class="odd">
<td>ssm_2mtCapMC</td>
<td>No</td>
<td>CNaive B0 &amp; B40, CE-SL_HCR</td>
<td>C = ATTACH (f~ABC)</td>
<td>ricker + covars</td>
<td>CEATTLE</td>
<td>ACLIM</td>
<td>1-100</td>
</tr>
<tr class="even">
<td>msm_2mtCapMC</td>
<td>Yes</td>
<td>CNaive B0 &amp; B40, CE-SL_HCR</td>
<td>C = ATTACH (f~ABC)</td>
<td>ricker + covars</td>
<td>CEATTLE</td>
<td>ACLIM</td>
<td>1-31</td>
</tr>
</tbody>
</table>

Where "Trophic" indicates if multispecies interactions where included (i.e., single or multispecies modes); "HCR" is the approach to the harvest control rule indicating whether reference points (B0 and B40) and the sloping harvest control rule (SL\_HCR) were determined from persistence scenarios (i.e., climate naive or 'CNaive') or from scenarios with climate acting on growth, predation, and recruitment (i.e., climate-enhanced or 'CE'); the harvest scenario applied (i.e., Catch = ABC or Catch is a function of TAC and ABC via the ATTACH() model); Recruitment relationship; the multispecies model used, the source of the simulations, and whether the simulations include random draws from the recruitment relationship parameters (MC&gt;0).

2 Getting started:
==================

2.1. Download the code from the github repository:
--------------------------------------------------

``` r
    # download the code:
    main_nm       <- "ACLIM-CEATTLE-Master"
    download_path <- path.expand("~/desktop")
    main          <- file.path(download_path,main_nm)
   
    # download the code:
    dest_file     <- file.path(download_path,paste0(main_nm,".zip"))
    url           <-"https://github.com/kholsman/ACLIM-CEATTLE/archive/master.zip"
    download.file(url=url, destfile=dest_file)
    
    # unzip the .zip file
    setwd(download_path)
    unzip (dest_file, exdir = "./",overwrite = T)
    setwd(main)
```

2.2. Download data from figshare:
---------------------------------

To run the analyses or create the paper figures you will now need to download the large zipped data folder here:
<https://figshare.com/s/bc27693d6b9002425bff> (DOI: ) and copy - paste the contents (folders "in" and "out"") it in the directory:
'\[your local directory path\]/EBM\_Holsman\_NatComm/data' or simply run the following script to download and place the data in the correct sub-folders:

``` r
    cat("The download takes a few mins (large data files)...\n")

    url       <- "https://ndownloader.figshare.com/files/24216482?private_link=bc27693d6b9002425bff"
    dest_path  <-  file.path(main,"Data/summary_files.zip")
    download.file(url=url, destfile=dest_path,method="libcurl")
    
    cat("\nDownload complete...\n")
    
    unzip (file.path(main,"Data/summary_files.zip"), exdir = "./",overwrite=T)
    cat("\nFiles unzipped successfully...\n")
```

3.1. Set things up:
-------------------

The first step is to run the make.R script to load the data, packages, and setup (where various options are specified). Note that the scripts depend on a number of packages that will be installed the first time through running make.R if they are not already included. *A list of those packages can be found in 'EBM\_Holsman\_NatComm/R/packages.R'.*

``` r
    # set your local path:
    # main        <-  file.path(download_path,"ACLIM-CEATTLE/")
    # e.g., main  <-  getwd()
    setwd(main)
    
    
    # load data, packages, setup, etc.
    source("R/make.R")

    # preview the simulation file:
    head(msm_noCapMC)
    
  #------------------------------------------------------------------    
  # plot Catch from the multispecies run without the cap (catch == ABC):
  #------------------------------------------------------------------
  
   dat2          <- as_tibble(msm_noCap)%>%filter(age==1)
    unique(dat2$hModev2)
    dat2$legend<-""
    for(i in 1:dim(run_def)[1]){
      tt <- grepl(run_def[i,]$`Run title`,dat2$hModev2,fixed=T)
      if(any(tt)){
        dat2[which(tt),]$legend <- run_def[i,]$Legend
      }
    }
    dat2$Scenario <- as.factor(Scenarios[dat2$Scenario])
    dat2$spp      <- factor(names(sppINFO)[dat2$species],levels=names(sppINFO))
     
    dev.new()
    ggplot(data=dat2) +
      geom_line(aes(x=future_year,y=Catch_total_biom,color=Scenario)) +
      facet_grid(spp~factor(hModev2),scales="free_y")+
      theme_minimal()
    
    
  #------------------------------------------------------------------
  # plot Catch from the multispecies run with the cap (catch == ABC):
  #------------------------------------------------------------------
   dat2          <- as_tibble(msm_2mtCap)%>%filter(age==1)
    unique(dat2$hModev2)
    dat2$legend<-""
    for(i in 1:dim(run_def)[1]){
      tt <- grepl(run_def[i,]$`Run title`,dat2$hModev2,fixed=T)
      if(any(tt)){
        dat2[which(tt),]$legend <- run_def[i,]$Legend
      }
    }
    dat2$Scenario <- as.factor(Scenarios[dat2$Scenario])
    dat2$spp      <- factor(names(sppINFO)[dat2$species],levels=names(sppINFO))
     
    dev.new()
    ggplot(data=dat2) +
      geom_line(aes(x=future_year,y=Catch_total_biom,color=Scenario)) +
      facet_grid(spp~factor(hModev2),scales="free_y")+
      theme_minimal()
```

4 Primary and Intermediate Data sources and models
==================================================

Various simulation outputs were made available for use in this analysis through the interdisciplinary [Alaska Climate Integrated Modeling (ACLIM) project](%22https://www.fisheries.noaa.gov/alaska/ecosystems/alaska-climate-integrated-modeling-project%22). An overview of the project and simulation experiments can be found in [Hollowed et al. 2020](%22https://www.frontiersin.org/articles/10.3389/fmars.2019.00775/full%22).

Hollowed, A. B., K. K. Holsman, A. C. Haynie, A. J. Hermann, A. E. Punt, K. Aydin, J. N. Ianelli, S. Kasperski, W. Cheng, A. Faig, K. A. Kearney, J. C. P. Reum, P. Spencer, I. Spies, W. Stockhausen, C. S. Szuwalski, G. A. Whitehouse, and T. K. Wilderbuer. 2020. Integrated Modeling to Evaluate Climate Change Impacts on Coupled Social-Ecological Systems in Alaska .

4.1. Bering10K ROMSNPZ model
----------------------------

ACLIM indices used in this analysis can be viewed interactively online at: <https://kholsman.shinyapps.io/aclim>. The indices were produced for the ACLIM project and derived from the outputs of the Bering10K ROMSNPZ model. Downscaled hindcasts and CMIP5 projections of oceanographic and lower trophic conditions from the Bering10K model were developed as part of the ACLIM project. An overview of these projections and the Bering10K ROMSNPZ model can be found in [Hermann et al. 2019](%22https://academic.oup.com/icesjms/article/76/5/1280/5477847%22), [Kearney et al. 2020](%22https://gmd.copernicus.org/articles/13/597/2020/%22), and [Hollowed et al. 2020](%22https://www.frontiersin.org/articles/10.3389/fmars.2019.00775/full%22). An overview of the Bering10K ROMSNPZ model can be found [here](%22https://beringnpz.github.io/roms-bering-sea/intro/%22).

Citation:

Hermann, A. J., G. A. Gibson, W. Cheng, I. Ortiz, K. Aydin, M. Wang, A. B. Hollowed, and K. K. Holsman. 2019. Projected biophysical conditions of the Bering Sea to 2100 under multiple emission scenarios. ICES Journal of Marine Science.

Kearney K, Hermann A, Cheng W, Ortiz I, Aydin K (2020) A coupled pelagic-benthic-sympagic biogeochemical model for the Bering Sea: documentation and validation of the BESTNPZ model (v2019.08.23) within a high-resolution regional ocean model. Geosci Model Dev 13:597-650. <DOI:10.5194/gmd-13-597-2020>.

4.2. CEATTLE multispecies model
-------------------------------

CEATTLE is a climate-enhanced multispecies stock assessment model for walleye pollock, Pacific cod, and arrowtooth flounder ([Holsman et al. 2016](%22https://www.sciencedirect.com/science/article/pii/S0967064515002751%22), [2019](%22https://archive.afsc.noaa.gov/refm/docs/2019/EBSmultispp.pdf%22)) that has been updated annually and included as an appendix to the BSAI walleye pollock stock assessment ([Ianelli et al. 2019](%22https://archive.afsc.noaa.gov/refm/docs/2019/GOApollock.pdf%22)) since 2016 as part of the Bering Sea fishery stock assessment process. As part of ACLIM CEATTLE was coupled to the ROMSNPZ model and the ATTACH model (below) to generate projections of species biomass and catch under future climate conditions in the Bering Sea. Methods for this coupling and projection simulation can be found in Holsman et al. submitted and Hollowed et al. 2020. The simulation outputs, scripts, and input data files used to generate these simulations can be found on the ACLIM-CEATTLE gitrepo and figshare sites. Details about the CEATTLE model can be found in the [2018 Multispecies assessment](%22https://archive.fisheries.noaa.gov/afsc/REFM/Docs/2018/BSAI/2018EBSmultispp-508.pdf%22) and [2019 Assessments](%22https://archive.afsc.noaa.gov/refm/docs/2019/EBSmultispp.pdf%22).

Citation:

Holsman, K. K., J. N. Ianelli, K. Aydin, and I. Spies. 2019. Multi-species supplement: 2019 Climate-enhanced multi-species Stock Assessment for walleye pollock, Pacific cod, and arrowtooth flounder in the Eastern Bering Sea. Pages 1–43 NPFMC Stock Assessment and Fishery Evaluation Report for the Groundfish Resources of the Bering Sea/Aleutian Islands Regions.

Holsman, K. K., J. Ianelli, K. Aydin, A. E. Punt, and E. A. Moffitt. 2016. A comparison of fisheries biological reference points estimated from temperature-specific multi-species and single-species climate-enhanced stock assessment models. Deep-Sea Research Part II: Topical Studies in Oceanography 134:360–378.

Three harvest simulations are included in the available simulations:
1. Catch = ABC where multispecies assessment simulations (run in ADMB) using climate naive reference points for BO but climate specific B40 and projections (climate effects on growth, M2, and recruitment).
2. Catch = ABC + sloping harvest control rule below B40, and with F = 0 when B &lt; B20.
3. As in 2 but where catch~f(ABC,TAC) via the ATTACH package (below).

4.3. ATTACH model
-----------------

The catchfunction package (which we refer to as the ABC To TAC and Commercial Harvest, aka ATTACH, model: R package rename forthcoming) was created for the Alaska Climate Integrated Modeling Project (ACLIM) by Amanda Faig (University of Washington; School of Aquatic Fisheries and Sciences) and Alan Haynie (NOAA; NMFS). This function, in a nutshell, takes Bering Sea (BS) acceptable biological catch (ABC) as input and uses a series of regression estimates to predict total allowable catch (TAC) and from that the commercial harvest in the Bering Sea, based on ABC, TAC, and catch data from 1992 to 2017. Version 1.6.0 ATTACH code and documentation used in this study can be found at: <http://doi.org/10.5281/zenodo.3966545>. Updated documentation and code for ATTACH can be found on the [attach github](%22https://github.com/amandafaig/catchfunction%22).

Faig, A., and A. Haynie. 2020. The ATTACH model Package Version 1.6.0 <http://doi.org/10.5281/zenodo.3966545>.
