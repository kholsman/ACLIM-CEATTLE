#compile.natcommruns.R
compile.natcommruns <- function(out=out_dir,sims = c(rcp45_n,rcp85NoBio_n),Rin=5,
                               savelist= c("ssm_noCap","ssm_noCapMC",
                                           "ssm_2mtCap","ssm_2mtCapMC",
                                           "msm_noCap","msm_noCapMC",
                                           "msm_2mtCap","msm_2mtCapMC")){
  cat("loading mean runs...\n")
  # mean RS with climate forcing runs:
  ssm_noCap     <- sim_ssm%>%filter(recMode      == Rin,
                                    hMode        == "12", 
                                    hModev2      =="H12_019_CENaivecf",
                                    is.na(MC_n)  ==T,
                                    Scenario%in%sims)
  ssm_2mtCap     <- sim_ssm%>%filter(recMode     == Rin,
                                    hMode        == "13", 
                                    hModev2      =="H13_2MT_019_CENaivecf1",
                                    is.na(MC_n)  ==T,
                                    Scenario%in%sims)
  msm_noCap     <- sim_msm%>%filter(recMode      == Rin,
                                    hMode        == "12", 
                                    hModev2      =="H12_219_CENaivecf",
                                    is.na(MC_n)  ==T,
                                    Scenario%in%sims)
  msm_2mtCap    <- sim_msm%>%filter(recMode      == Rin,
                                     hMode       == "13", 
                                     hModev2     =="H13_2MT_219_CENaivecf1",
                                     is.na(MC_n) ==T,
                                     Scenario%in%sims)
  
  cat("loading MC runs...\n")
  ssm_noCapMC     <- sim_ssm%>%filter(recMode    == Rin,
                                    hMode        == "12", 
                                    hModev2      =="H12_019_CENaivecf",
                                    MC_n         >  0,
                                    Scenario%in%sims)
  ssm_2mtCapMC     <- sim_ssm%>%filter(recMode    == Rin,
                                     hMode        == "13", 
                                     hModev2      =="H13_2MT_019_CENaivecf1",
                                     MC_n         >  0,
                                     Scenario%in%sims)
  msm_noCapMC     <- sim_msm%>%filter(recMode    == Rin,
                                    hMode        == "12", 
                                    hModev2      =="H12_219_CENaivecf",
                                    MC_n         >  0,
                                    Scenario%in%sims)
  msm_2mtCapMC    <- sim_msm%>%filter(recMode   == Rin,
                                    hMode       == "13", 
                                    hModev2     =="H13_2MT_219_CENaivecf1",
                                    MC_n         >  0,
                                    Scenario%in%sims)
  cat(paste0("Saving files in ",out,"\n"))
  
  for(fn in savelist)
    save(fn,file=file.path(out,paste0(fn,".Rdata")))

}