# setup.R

  #set up paths:
  # ----------------------------------------
      filenm          <- "aclim_00_JunV3_2019"
      modelnm         <- "aclim_00_JunV3_2019"
      filenm_setB0    <- "aclim_00_JunV3_2019_setB0"
      f40dat_flnm     <- "dat_input_files/aclim/setF40_datfiles"
      datapath        <- "dat_input_files/aclim"
      
      DIR_main <-   path.expand("~/GitHub/CEATTLE")
      main     <-   file.path(DIR_main,"runs")
      ctl_main <-   file.path(DIR_main,"src/Control_files")
      f40fn    <-    file.path(DIR_main,paste0("src/Data/",datapath,"/setF40_datfiles"))
     #ctl_0    <-   "aclim2018_0A.ctl"
     #ctl_2    <-   "aclim2018_2A.ctl"
      fl_0     <-   file.path(main,paste0(filenm,"_0"))
      fl_2     <-   file.path(main,paste0(filenm,"_2"))
      ctl_0    <-   strsplit(dir(fl_0)[grep(".ctl",dir(fl_0))[1]],fl_0)[[1]]
      ctl_2    <-   strsplit(dir(fl_2)[grep(".ctl",dir(fl_2))[1]],fl_2)[[1]]
      fn_0     <-   path.expand(file.path(DIR_main,"/src/Data/dat_input_files/set_FabcFofl_0.dat"))
      fn_2     <-   path.expand(file.path(DIR_main,"src/Data/dat_input_files/set_FabcFofl_2.dat"))
      
      
      
      ctl_flnm <-   substr(ctl_0,1,nchar(ctl_0)-7)
      tt       <-   scan(file=file.path(ctl_main,ctl_0),what=character(),sep="\n")
      futfile  <-   tt[grep("futfile_name",tt)+1] #"dat_input_files/aclim/proj_data2018_long_ext_bcs.dat"
      
      # create Aclim ctl file B
      tt       <-   scan(file.path(DIR_main,"src/Data",futfile),what=character(),sep="\n")
      nscen    <-   as.numeric(tt[grep("n_fut_itr",tt)[1]+1])
      st       <-   grep("ncov_fut",tt)+3;ed<-st+nscen-1
      mods     <-   sapply( strsplit(tt[st:ed],split=" "), `[`, 4) # list of scenario names
      
      #load funtions:
      source(file.path(DIR_main,"src/ceattle-master/Scripts/R_code/ASSESSMENT_RUN_FUN.R"))
      
      # get single spp dat filenames
      tt             <-   scan(file=file.path(fl_2,ctl_2),what=character(),sep="\n")
      datafile_name  <-   tt[grep("#datafile_name",tt)+1]
      msmfl          <-   strsplit(datafile_name,".dat")[[1]][1]
      ssfl           <-   paste0(substr(msmfl,1,nchar(msmfl)-1),"0.dat")
      #  ctl_0<-   strsplit(ctlfl,".ctl")[[1]][1]
      
      
  # set up switches
  # ----------------------------------------
      nspp        <-   3
      hcrset      <- 1.8     # Set the control rule to find B40 under no climate
      rec_listIN  <- c(1,6,5,7,2)
      mode_listIN <- c(0,2)
      hcr_listIN  <- c(1,3,12,13)
      
      hscns       <-    12 # base set of status quo
      hscns_part2 <-   c(hscns,15,57:58,70)
      hscns_part2 <-   hscns
      
      updateBaseRuns      <- 1    # Update the fundamental runs?
      run_harvestMod      <- 1    # Run the full set of harvest modes
      run_harvestModMCMC  <- 1    # Run MCMC?
      
      itr_set    <-    28:35 #1:nitr
      mod_set_mc <-    2 #c(2,0)  # models to evaluate in the mc loop
      scen_set   <-    1    #attach scenarios 1:3
      
      hcns2     <-    c(13,20,21,57,58,70)
      hcns2     <-    13
      nitr      <-    100   # Number of MCMC runs
      
      
      
      