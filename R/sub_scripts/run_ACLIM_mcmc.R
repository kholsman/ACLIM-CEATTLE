# run_ACLIM_mcmc.R

# First for climate-naive F target
for (scn in scen_set)
{
  
  
  # update the catch function scenario in the ctl file with scn
  #______________________________________________   
  replace_ctl(
    flin=file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    flout=file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    nm="catch_scen",
    rplac=scn)
  
  replace_ctl(
    flin=file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    flout=file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    nm="catch_scen",
    rplac=scn)
  
  # update setF_name 
  #______________________________________________ 
  #copy #setF_name -->file.path(f40dat_flnm, F40In_2_5_9.dat  in each ctl file
  replace_ctl(
    flin=file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    flout=file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    nm="setF_name",
    rplac=file.path(f40dat_flnm,"F40In_0_1_9Naive.dat"))
  
  replace_ctl(
    flin=file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    flout=file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    nm="setF_name",
    rplac=file.path(f40dat_flnm,"F40In_2_1_9Naive.dat"))
  
  
  
  hSET<-c(12,13,3)
  
  # now run models:
  #______________________________________________ 
  for (MM in mod_set_mc)
  {
    h<-12
    if(scn==scen_set[1])
    {
      # temporary rerun 1:60
      for(itr in itr_set)
      {
        print("_______________________________")
        print(paste0("No 2MT cap , Mode = ",MM,",SCN= ",scn,"; mcmc ",itr))
        print("_______________________________")
        system(paste0(
          "cd ~/GitHub/CEATTLE/src/ceattle-master;
          ./CEATTLE_run_fut.sh ",MM," -r 5 -h 12 --mcmc ",itr," -f ",modelnm,"_",MM,"19_CENaivecf -m ",modelnm," -ctl ",ctl_flnm,"_",MM,"B -plot"))
      }
      # No HCR
      h<-3
      for(itr in itr_set)
      {
        print("_______________________________")
        print(paste0("No 2MT cap, Mode = ",MM,", SCN= ",scn,"; mcmc ",itr))
        print("_______________________________")
        system(paste0(
          "cd ~/GitHub/CEATTLE/src/ceattle-master;
          ./CEATTLE_run_fut.sh ",MM," -r 5 -h 3 --mcmc ",itr," -f ",modelnm,"_",MM,"19_CENaivecf -m ",modelnm," -ctl ",ctl_flnm,"_",MM,"B -plot"))
        
        
      }
      }
  }
  
  #______________________________________________ 
  if(scn==scen_set[1])
  { 
    # temp rerun mode 2 62:nitr
    # rerun mode 0 around 9:50 am June 7
    h<-13
    for(itr in itr_set)
    {
      for (MM in mod_set_mc)
      {
        #2 MCMC 32
        
        print("_______________________________")
        print(paste0("Amanda Scenario mode= ",MM,",SCN= ",scn,"; mcmc ",itr))
        print("_______________________________")  
        
        system(paste0(
          "cd ~/GitHub/CEATTLE/src/ceattle-master; 
          ./CEATTLE_run_fut.sh ",MM," -r 5 -h ",h," --mcmc ",itr," -f ",modelnm,"_2MT_",MM,"19_CENaivecf",scn," -m ",modelnm," -ctl ",ctl_flnm,"_",MM,"B -plot") )
        
      }
    }
    }
  }