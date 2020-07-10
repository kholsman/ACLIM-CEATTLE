#run_ACLIM_HarvestMod.R

# First for climate-naive F target
for (scn in scen_set){
  print("_______________________________")
  print(paste0("Amanda Scenario ",scn))
  print("_______________________________")
  
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
    rplac=file.path(f40dat_flnm,"F40In_0_1_9mnF.dat"))
  replace_ctl(
    flin=file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    flout=file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    nm="setF_name",
    rplac=file.path(f40dat_flnm,"F40In_2_1_9mnF.dat"))
  
  # now run models:
  for(h in hcns2){
    #______________________________________________ 
    
    system(paste0(
      "cd ~/GitHub/CEATTLE/src/ceattle-master;
      ./CEATTLE_run_fut.sh 0 -r 5 -h ",h," -f ",modelnm,"_2MT_019_mnFcf",scn," -m ",modelnm," -ctl ",ctl_flnm,"_0B -plot"))
    
    system(paste0(
      "cd ~/GitHub/CEATTLE/src/ceattle-master;
      ./CEATTLE_run_fut.sh 2 -r 5 -h ",h," -f ",modelnm,"_2MT_219_mnFcf",scn," -m ",modelnm," -ctl ",ctl_flnm,"_2B -plot"))
    
    
  }
  print("_______________________________")
  print(paste0("Amanda Scenario ",scn))
  print("_______________________________")
  
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
  
  # now run models:
  
  for(h in hcns2){
    #______________________________________________ 
    system(paste0(
      "cd ~/GitHub/CEATTLE/src/ceattle-master;
      ./CEATTLE_run_fut.sh 0 -r 5 -h ",h," -f ",modelnm,"_2MT_019_CENaivecf",scn," -m ",modelnm," -ctl ",ctl_flnm,"_0B -plot;
      ./CEATTLE_run_fut.sh 2 -r 5 -h ",h," -f ",modelnm,"_2MT_219_CENaivecf",scn," -m ",modelnm," -ctl ",ctl_flnm,"_2B -plot"))
  }
  
  # Now for climate-perfect F target
  
  print("_______________________________")
  print(paste0("Amanda Scenario ",scn))
  print("_______________________________")
  
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
  #copy #setF_name -->file.path(f40dat_flnm, F40In_2_5_9Naive.dat  in each ctl file
  replace_ctl(
    flin=file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    flout=file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    nm="setF_name",
    rplac=file.path(f40dat_flnm,"F40In_0_5_9.dat"))
  replace_ctl(
    flin=file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    flout=file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    nm="setF_name",
    rplac=file.path(f40dat_flnm,"F40In_2_5_9.dat"))
  
  # now run models:
  for(h in hcns2){
    #______________________________________________ 
    system(paste0(
      "cd ~/GitHub/CEATTLE/src/ceattle-master;
        ./CEATTLE_run_fut.sh 0 -r 5 -h ",h," -f ",modelnm,"_2MT_059_CEcf",scn," -m ",modelnm," -ctl ",ctl_flnm,"_0B -plot;
        ./CEATTLE_run_fut.sh 2 -r 5 -h ",h," -f ",modelnm,"_2MT_259_CEcf",scn," -m ",modelnm," -ctl ",ctl_flnm,"_2B -plot"))
  }
}