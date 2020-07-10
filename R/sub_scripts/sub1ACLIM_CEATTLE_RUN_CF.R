  
### Use climate naive B0 and climate naive F:
    killrun  <-  scan(paste0(strsplit(main,"/runs")[[1]],"/src/ceattle-master/main/killrun.dat"))
    
    if(killrun==1)  stop("KILL RUN FILE SET TO 1! \n src/ceattle-master/main/killrun.dat")

    # SET UP
    #-------------------------------------
    nyrs_fut  <-    getF40(hcr=hcrset)$nyrs_fut

    # Update Base Runs
    #-------------------------------------
    if(updateBaseRuns==1)
      source(file.path(code_dir,"R/sub_scripts/run_ACLIM_updatebaseruns.R"))
     
    # AMANDA'S CATCH FUNCTION:  H=13
    #-------------------------------------
    #catch_scen: ADDED scenario for Amanda's catch function
    
     if(run_harvestMod)
       source(file.path(code_dir,"R/sub_scripts/ run_ACLIM_harvestMod.R"))

    # AMANDA'S CATCH FUNCTION:  H=13, just on x_5_9
    #-------------------------------------
    #catch_scen: ADDED scenario for Amanda's catch function
    scen_set <- 1    # Just do this now for status quo

    if(run_harvestModMCMC)
      source(file.path(code_dir,"R/sub_scripts/run_ACLIM_mcmc.R"))








