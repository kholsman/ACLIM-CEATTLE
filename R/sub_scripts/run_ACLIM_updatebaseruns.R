  
  #-------------------------------------
  # GET F40
  #-------------------------------------  
  
  # get F40 for all the models from step 3
  F40_1_3          <-   F40fun(m=0,r =1, h=3)
  F40_2_3          <-   F40fun(m=0,r =2, h=3)
  # F40_0_3_3<-   F40fun(m=0,r =3, h=3)
  F40_4_3          <-   F40fun(m=0,r =4, h=3)
  F40_5_3          <-   F40fun(m=0,r =5, h=3)
  
  
  # get comparitive F40 rates for each scenario x model
  dev.new(height=6,width=4)
  F40_smry          <-  compareF(sptxt=c("pollock","cod","arrowtooth"),F40_a=F40_1_3,F40_b=F40_5_3)
  quartz.save( file  =  file.path(fl_2,"projections/Fcompare.jpg"),type="jpg")
  save.image(  file  =  file.path(fl_2,"projections/F40_info.Rdata"))
  save.image(  file  =  file.path(fl_0,"projections/F40_info.Rdata"))
  # function to make Fabc dat file
  
  #-------------------------------------
  # WRITE F40 dat files for harvest mode 11-13
  #-------------------------------------     
  
  makeNaive<-function(datIN)
  {
    datOUT<-datIN
    for(mode in 1:2){
      for(s in 1:3){
        rr                          <-  which(datOUT[[1]][[mode]]$sp==s)
        ss                          <-  which(datOUT[[1]][[mode]]$sp==s&datOUT[[1]][[mode]]$Scen[rr]==1)
        datOUT[[1]][[mode]]$F40[rr] <-  datOUT[[1]][[mode]]$F40[ss]
      }
    }
    return(datOUT)
  }
  
  
  makehistMeanF<-function(datIN,pastYRs=1:5){
    datOUT<-datIN
    for(mode in 1:2){
      if(mode==1){
        tt<-   read.csv(file.path(fl_0,"results/ceattle_est.std"),skip=1,sep="",header=F)
      }else{
        tt<-   read.csv(file.path(fl_2,"results/ceattle_est.std"),skip=1,sep="",header=F)
      }
      
      colnames(tt)<-   c("index","names","val","sd")
      mnF<-   tt$val[which(tt$names=="ln_mean_F")]
      nspp<-   length(mnF)
      Fdev<-   tt$val[which(tt$names=="F_dev")]
      nyrs<-   as.numeric(length(Fdev)/nspp)
      start<-   seq(1,nyrs*nspp,nyrs)
      end<-   (start+nyrs-1)
      
      for(s in 1:3){
        nn<-   (-1*(pastYRs-1))+nyrs
        F<-   exp(mean(mnF[s]+Fdev[start[s]:end[s]][nn]))
        rr<-   which(datOUT[[1]][[mode]]$sp==s)
        ss<-   which(datOUT[[1]][[mode]]$sp==s&datOUT[[1]][[mode]]$Scen[rr]==1)
        datOUT[[1]][[mode]]$F40[rr]<-F
      }
    }
    return(datOUT)
  }
  
  F40_1_3_naive    <-   makeNaive(F40_1_3)
  F40_5_3_naive    <-   makeNaive(F40_5_3)
  F40_1_3_mnF      <-   makehistMeanF(F40_1_3)
  F40_5_3_mnF      <-   makehistMeanF(F40_5_3)
  
  make_FabcDat(m=0,F40_In=F40_1_3_naive,fn=file.path(f40fn,"F40In_0_1_9Naive.dat"))
  make_FabcDat(m=0,F40_In=F40_5_3_naive,fn=file.path(f40fn,"F40In_0_5_9Naive.dat"))
  make_FabcDat(m=2,F40_In=F40_1_3_naive,fn=file.path(f40fn,"F40In_2_1_9Naive.dat"))
  make_FabcDat(m=2,F40_In=F40_5_3_naive,fn=file.path(f40fn,"F40In_2_5_9Naive.dat"))
  
  make_FabcDat(m=0,F40_In=F40_1_3_mnF,fn=file.path(f40fn,"F40In_0_1_9mnF.dat"))
  make_FabcDat(m=0,F40_In=F40_5_3_mnF,fn=file.path(f40fn,"F40In_0_5_9mnF.dat"))
  make_FabcDat(m=2,F40_In=F40_1_3_mnF,fn=file.path(f40fn,"F40In_2_1_9mnF.dat"))
  make_FabcDat(m=2,F40_In=F40_5_3_mnF,fn=file.path(f40fn,"F40In_2_5_9mnF.dat"))
  
  make_FabcDat(m=0,F40_In=F40_1_3,fn=file.path(f40fn,"F40In_0_1_9.dat"))
  make_FabcDat(m=0,F40_In=F40_2_3,fn=file.path(f40fn,"F40In_0_2_9.dat"))
  make_FabcDat(m=0,F40_In=F40_4_3,fn=file.path(f40fn,"F40In_0_4_9.dat"))
  make_FabcDat(m=0,F40_In=F40_5_3,fn=file.path(f40fn,"F40In_0_5_9.dat"))
  
  make_FabcDat(m=2,F40_In=F40_1_3,fn=file.path(f40fn,"F40In_2_1_9.dat"))
  make_FabcDat(m=2,F40_In=F40_2_3,fn=file.path(f40fn,"F40In_2_2_9.dat"))
  make_FabcDat(m=2,F40_In=F40_4_3,fn=file.path(f40fn,"F40In_2_4_9.dat"))
  make_FabcDat(m=2,F40_In=F40_5_3,fn=file.path(f40fn,"F40In_2_5_9.dat"))
  
  #-------------------------------------
  # GET ABC for reporting
  #-------------------------------------     
  ABC<-matrix(-999,nspp,2)
  
  ABC[1,]<-c(
    (getsub(tt=F40_1_3[[2]][[1]],sp=1)$Catch_total_biom[1]),
    (getsub(tt=F40_1_3[[2]][[2]],sp=1)$Catch_total_biom[1]))
  
  ABC[2,]<-c(
    (getsub(tt=F40_1_3[[2]][[1]],sp=2)$Catch_total_biom[1]),
    (getsub(tt=F40_1_3[[2]][[2]],sp=2)$Catch_total_biom[1]))
  
  ABC[3,]<-c(
    (getsub(tt=F40_1_3[[2]][[1]],sp=3)$Catch_total_biom[1]),
    (getsub(tt=F40_1_3[[2]][[2]],sp=3)$Catch_total_biom[1]))
  
  ABC2<-matrix(-999,nspp,2)
  
  ABC2[1,]<-c(
    (getsub(tt=F40_5_3[[2]][[1]],sp=1,scn=2)$Catch_total_biom[1]),
    (getsub(tt=F40_5_3[[2]][[2]],sp=1,scn=2)$Catch_total_biom[1]))
  
  ABC2[2,]<-c(
    (getsub(tt=F40_5_3[[2]][[1]],sp=2,scn=2)$Catch_total_biom[1]),
    (getsub(tt=F40_5_3[[2]][[2]],sp=2,scn=2)$Catch_total_biom[1]))
  
  ABC2[3,]<-c(
    (getsub(tt=F40_5_3[[2]][[1]],sp=3,scn=2)$Catch_total_biom[1]),
    (getsub(tt=F40_5_3[[2]][[2]],sp=3,scn=2)$Catch_total_biom[1]))
  
  ABC3<-matrix(-999,nspp,2)
  
  ABC3[1,]<-c(
    (getsub(tt=F40_5_3[[2]][[1]],sp=1,scn=3)$Catch_total_biom[1]),
    (getsub(tt=F40_5_3[[2]][[2]],sp=1,scn=3)$Catch_total_biom[1]))
  
  ABC3[2,]<-c(
    (getsub(tt=F40_5_3[[2]][[1]],sp=2,scn=3)$Catch_total_biom[1]),
    (getsub(tt=F40_5_3[[2]][[2]],sp=2,scn=3)$Catch_total_biom[1]))
  
  ABC3[3,]<-c(
    (getsub(tt=F40_5_3[[2]][[1]],sp=3,scn=3)$Catch_total_biom[1]),
    (getsub(tt=F40_5_3[[2]][[2]],sp=3,scn=3)$Catch_total_biom[1]))
  
  save(ABC,file=file.path(fl_2,"projections/ABC1.Rdata"))
  save(ABC2,file=file.path(fl_2,"projections/ABC2.Rdata"))
  save(ABC3,file=file.path(fl_2,"projections/ABC3.Rdata"))
  
  #-------------------------------------
  # CALCULATE FmaxABC
  #-------------------------------------        
  
  # first get B40 from the no HCR runs:
  #______________________________________________
  r     <-   1
  h     <-   3
  hcrr  <-   hcrset
  m     <-   0
  load(file.path(fl_0,"B0_list.Rdata"))
  BatF40            <-   list()
  BatF40[["B0_0"]]  <-   getB0(mn=main,flname=filenm, rec =r, hvst=h, mode=0,hcr=hcrr)
  BatF40[["B0_2"]]  <-   getB0(mn=main,flname=filenm, rec =r, hvst=h, mode=2,hcr=hcrr)
  
  # get MaxABC in the next 2 years:
  #______________________________________________
  # USE TIER 3 in 2 years forward to set target: OLD don't do now that it is in CEATTLE
  # Calculate target B40 based on sloping HCR - now defunct since TIER3 FUNCT is in CEATTLE
  # BatF40[["B0_0"]]$Fabc<-tier3(
  #       Fin=BatF40[["B0_0"]]$F40_pls2,
  #       Bratio=	BatF40[["B0_0"]]$SSB_pls2/B0_list[["B0_0"]]$targetSSB0)
  
  # BatF40[["B0_2"]]$Fabc<-tier3(
  #       Fin=BatF40[["B0_2"]]$F40_pls2,
  #       Bratio=	BatF40[["B0_2"]]$SSB_pls2/B0_list[["B0_2"]]$targetSSB0)
  
  # NEW set ABC = F40 without HCR - that will come in the next step of the runs
  #______________________________________________
  BatF40[["B0_0"]]$Fabc  <-  BatF40[["B0_0"]]$F40_pls2
  BatF40[["B0_2"]]$Fabc  <-  BatF40[["B0_2"]]$F40_pls2
  
  save(BatF40,file=file.path(fl_0,"BatF40.Rdata"))
  
  
  # CHECK that FP_in is NOT .2 .2 .2!!!
  #-------------------------------------
  # RUN MODELS: F40In_2_5_9, H=12: With sloping HCR but no catch function:
  #-------------------------------------  
  # update setF_name with F40In_x_5_9.dat    
  replace_ctl(
    flin  =  file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    flout =  file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    nm    =  "setF_name",
    rplac =  file.path(f40dat_flnm,"F40In_0_5_9mnF.dat"))
  
  replace_ctl(
    flin  =  file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    flout =  file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    nm    =  "setF_name",
    rplac =  file.path(f40dat_flnm,"F40In_2_5_9mnF.dat"))
  
  # # now run models:
  # system(paste0("cd ~/GitHub/CEATTLE/src/ceattle-master;
  #               ./CEATTLE_run_fut.sh 0 -r 5 -h 12 -f ",modelnm,"_059_mnFcfTEST -m ",modelnm," -ctl ",ctl_flnm,"_0B -plot"))
  # system(paste0("cd ~/GitHub/CEATTLE/src/ceattle-master;
  #               ./CEATTLE_run_fut.sh 2 -r 5 -h 12 -f ",modelnm,"_259_mnFcf -m ",modelnm," -ctl ",ctl_flnm,"_2B -plot"))
  
  for(h in hscns){
    system(paste0("cd ~/GitHub/CEATTLE/src/ceattle-master;
                  ./CEATTLE_run_fut.sh 0 -r 5 -h ",h," -f ",modelnm,"_059_mnFcf -m ",modelnm," -ctl ",ctl_flnm,"_0B -plot"))
    system(paste0("cd ~/GitHub/CEATTLE/src/ceattle-master;
                  ./CEATTLE_run_fut.sh 2 -r 5 -h ",h," -f ",modelnm,"_259_mnFcf -m ",modelnm," -ctl ",ctl_flnm,"_2B -plot"))
    
  }
  
  # update setF_name with F40In_x_5_9.dat
  replace_ctl(
    flin=  file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    flout=  file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    nm=  "setF_name",
    rplac=  file.path(f40dat_flnm,"F40In_0_5_9.dat"))
  
  replace_ctl(
    flin=  file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    flout=  file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    nm=  "setF_name",
    rplac=  file.path(f40dat_flnm,"F40In_2_5_9.dat"))
  
  # now run models:
  for(h in hscns){
    system(paste0("cd ~/GitHub/CEATTLE/src/ceattle-master;
                  ./CEATTLE_run_fut.sh 0 -r 5 -h ",h," -f ",modelnm,"_059_cf -m ",modelnm," -ctl ",ctl_flnm,"_0B -plot"))
    system(paste0("cd ~/GitHub/CEATTLE/src/ceattle-master;
                  ./CEATTLE_run_fut.sh 2 -r 5 -h ",h," -f ",modelnm,"_259_cf -m ",modelnm," -ctl ",ctl_flnm,"_2B -plot"))
  }
  # update setF_name with F40In_x_5_9.dat
  #______________________________________________      
  replace_ctl(
    flin=  file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    flout=  file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    nm=  "setF_name",
    rplac=  file.path(f40dat_flnm,"F40In_0_5_9Naive.dat"))
  
  replace_ctl(
    flin=  file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    flout=  file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    nm=  "setF_name",
    rplac=  file.path(f40dat_flnm,"F40In_2_5_9Naive.dat"))
  
  # now run models:
  #______________________________________________   
  for(h in hscns){
    system(paste0("cd ~/GitHub/CEATTLE/src/ceattle-master;
                  ./CEATTLE_run_fut.sh 0 -r 5 -h ",h," -f ",modelnm,"_059_CENaivecf -m ",modelnm," -ctl ",ctl_flnm,"_0B -plot"))
    system(paste0("cd ~/GitHub/CEATTLE/src/ceattle-master;
                  ./CEATTLE_run_fut.sh 2 -r 5 -h ",h," -f ",modelnm,"_259_CENaivecf -m ",modelnm," -ctl ",ctl_flnm,"_2B -plot"))
  }
  
  
  #-------------------------------------
  # RUN MODELS: USE CLIMATE NIAVE reference point for target:
  #       F40In_2_1_9, H=12: With sloping HCR but no catch function: this is set climate F40
  #-------------------------------------
  # update setF_name with F40In_x_1_9.dat
  #______________________________________________                
  #copy #setF_name -->file.path(f40dat_flnm, F40In_2_1_9.dat  in each ctl file
  
  # USE hist mean F reference point for target
  replace_ctl(
    flin=  file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    flout=  file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    nm=  "setF_name",
    rplac=  file.path(f40dat_flnm,"F40In_0_1_9mnF.dat"))
  
  replace_ctl(
    flin=  file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    flout=  file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    nm=  "setF_name",
    rplac=  file.path(f40dat_flnm,"F40In_2_1_9mnF.dat"))
  
  # now run models:
  for(h in hscns_part2){
    #______________________________________________   
    system(paste0("cd ~/GitHub/CEATTLE/src/ceattle-master;
                  ./CEATTLE_run_fut.sh 0 -r 5 -h ",h," -f ",modelnm,"_019_mnFcf -m ",modelnm," -ctl ",ctl_flnm,"_0B -plot"))
    system(paste0("cd ~/GitHub/CEATTLE/src/ceattle-master;
                  ./CEATTLE_run_fut.sh 2 -r 5 -h ",h," -f ",modelnm,"_219_mnFcf -m ",modelnm," -ctl ",ctl_flnm,"_2B -plot"))  
  }
  
  # update setF_name with F40In_x_1_9.dat
  #______________________________________________                
  #copy #setF_name -->file.path(f40dat_flnm, F40In_2_1_9.dat  in each ctl file
  
  # USE CLIMATE NIAVE reference point for target
  replace_ctl(
    flin=  file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    flout=  file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    nm=  "setF_name",
    rplac=  file.path(f40dat_flnm,"F40In_0_1_9.dat"))
  
  replace_ctl(
    flin=  file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    flout=  file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    nm=  "setF_name",
    rplac=  file.path(f40dat_flnm,"F40In_2_1_9.dat"))
  
  # now run models:
  for(h in hscns_part2){
    #______________________________________________   
    system(paste0("cd ~/GitHub/CEATTLE/src/ceattle-master;
                  ./CEATTLE_run_fut.sh 0 -r 5 -h ",h," -f ",modelnm,"_019_cf -m ",modelnm," -ctl ",ctl_flnm,"_0B -plot"))
    system(paste0("cd ~/GitHub/CEATTLE/src/ceattle-master;
                  ./CEATTLE_run_fut.sh 2 -r 5 -h ",h," -f ",modelnm,"_219_cf -m ",modelnm," -ctl ",ctl_flnm,"_2B -plot"))  
  }
  
  
  # update setF_name with F40In_x_1_9.dat
  #______________________________________________                
  #copy #setF_name -->file.path(f40dat_flnm, F40In_2_1_9.dat  in each ctl file
  # USE CLIMATE NIAVE reference point for target
  replace_ctl(
    flin=  file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    flout=  file.path(ctl_main,paste0(ctl_flnm,"_0B.ctl")),
    nm=  "setF_name",
    rplac=  file.path(f40dat_flnm,"F40In_0_1_9Naive.dat"))
  
  replace_ctl(
    flin=  file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    flout=  file.path(ctl_main,paste0(ctl_flnm,"_2B.ctl")),
    nm=  "setF_name",
    rplac=  file.path(f40dat_flnm,"F40In_2_1_9Naive.dat"))
  
  # now run models:
  # now run models:
  for(h in hscns_part2){
    #______________________________________________   
    system(paste0("cd ~/GitHub/CEATTLE/src/ceattle-master;
                  ./CEATTLE_run_fut.sh 0 -r 5 -h ",h," -f ",modelnm,"_019_CENaivecf -m ",modelnm," -ctl ",ctl_flnm,"_0B -plot"))
    system(paste0("cd ~/GitHub/CEATTLE/src/ceattle-master;
                  ./CEATTLE_run_fut.sh 2 -r 5 -h ",h," -f ",modelnm,"_219_CENaivecf -m ",modelnm," -ctl ",ctl_flnm,"_2B -plot"))  
  }