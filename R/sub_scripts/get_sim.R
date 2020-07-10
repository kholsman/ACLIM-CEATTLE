# get_sim()
# produce derived products for EBM paper from raw simulation output from CEATTLE

get_sim <- function(fldr=fldr_nm,sim_p="data/ignore_this/runs",save_fldr = "data/ignore_this/summary_files/sim_files"){
    
    simlist0  <-  dir(file.path(main,sim_p,paste0(fldr,"_0/projections/summaryFigs")))
    simlist2  <-  dir(file.path(main,sim_p,paste0(fldr,"_2/projections/summaryFigs")))
    
    # get target_B_2 and target_B_0:
    txt             <- c("no cap"="_219_CENaivecf_2_5_12","2 MT cap"="_2MT_219_CENaivecf1_2_5_13")
    target_B_2      <- get_targetB(fldIN=(paste0(file.path(sim_p,fldr),"_2/projections/",fldr,txt,"/",fldr,txt,".ctl")))
    txt             <- c("no cap"="_019_CENaivecf_0_5_12","2 MT cap"="_2MT_019_CENaivecf1_0_5_13")
    target_B_0      <- get_targetB(fldIN=(paste0(file.path(sim_p,fldr),"_0/projections/",fldr,txt,"/",fldr,txt,".ctl")))
    
    save(target_B_0,file=file.path(main,save_fldr,"target_B_0.Rdata"))
    save(target_B_2,file=file.path(main,save_fldr,"target_B_2.Rdata"))
    
    mclist0   <-  simlist0[grep("_mc",simlist0)]
    mclist2   <-  simlist2[grep("_mc",simlist2)]
    datlist0  <-  datlist2  <-  ""
    for(i in 1:length(mclist0))
      mclist0[i]   <-  getnm(mclist0[i])
    for(i in 1:length(mclist2))
      mclist2[i]   <-  getnm(mclist2[i])
    mclist0   <-   unique(mclist0)
    mclist2   <-   unique(mclist2)
    empty0    <-   data.frame(nm=simlist0,empty=FALSE)
    empty2    <-   data.frame(nm=simlist2,empty=FALSE)
    
    
    datlist0 <- datlist2 <- ""
    if(status) cat("read in main dat single spp projections\n")
    mode      <-  0
    for(i in 1:length(simlist0)){
      tmpnm   <-  substr(simlist0[i],14,nchar(simlist0[i])-4)
      tmpflnm <-  file.path(sim_p,paste0(fldr,"_0/projections/",tmpnm,"/results/ceattle_R_projection.rep"))
      
      if(file.exists(tmpflnm)){
        ttt     <-  read.csv(tmpflnm,sep=" ")
        nn      <-  strsplit(tmpnm,split=fldr)[[1]][2]
        nn2     <-  strsplit(nn,split="_mc")
        ttt$MC_n<-  as.numeric(nn2[[1]][2])
        nn3     <-  strsplit(nn2[[1]][1],split="_")[[1]]
        ttt$ID     <- i
        ttt$mode    <- rev(nn3)[3]
        ttt$recMode <- rev(nn3)[2]
        ttt$hMode   <- rev(nn3)[1]
        ttt$hModev2 <- paste0("H",rev(nn3)[1],paste0(nn3[1:(length(nn3)-3)],collapse="_"))
        #eval(parse(text=paste0("dat",strsplit(tmpnm,split=fldr)[[1]][2],"  <-  ttt") ))
        #datlist2<-c(datlist2,paste0("dat",strsplit(tmpnm,split=fldr)[[1]][2]))
        datlist0 <- c(datlist0, paste0("dat",nn))
        empty0$empty[i]  <-  FALSE
        
        if(i==1)  {
            #write.table(ttt, file=file.path(main,save_fldr,"sim_ssm.csv"),append=F,col.names = TRUE,sep=",")
            OUT  <- ttt
        }
        if(!i==1) {
           # write.table(ttt, file=file.path(main,save_fldr,"sim_ssm.csv"),append=T,col.names = FALSE,sep=",")
            OUT  <- rbind(OUT,ttt)
        }
        rm(ttt)
        
      }else{
        empty0$empty[i]  <-  TRUE  
      }
      if(status) progress(100*round(i/length(simlist2),2))
    }
    OUT$note   <-  ""
    OUT$note[grep("19",OUT$hModev2)]  <-  "based on B0 assuming no climate effects on persistence"
    OUT$note[grep("59",OUT$hModev2)]  <-  "based B0 assuming climate effects on persistence"
    sim_ssm <- OUT
    save(sim_ssm,file=file.path(main,save_fldr,"sim_ssm.Rdata"))
    rm(OUT)
    
    mode  <-  2
    if(status) cat("read in main dat multi spp projections\n")
    for(i in 1:length(simlist2)){
      tmpnm   <-  substr(simlist2[i],14,nchar(simlist2[i])-4)
      tmpflnm <-  file.path(sim_p,paste0(fldr,"_2/projections/",
                         tmpnm,"/results/ceattle_R_projection.rep"))
      
      
        if(file.exists(tmpflnm)){
          ttt     <-  read.csv(tmpflnm,sep=" ")
          nn      <-  strsplit(tmpnm,split=fldr)[[1]][2]
          nn2     <-  strsplit(nn,split="_mc")
          ttt$MC_n<-  as.numeric(nn2[[1]][2])
          nn3     <-  strsplit(nn2[[1]][1],split="_")[[1]]
          ttt$ID      <- i
          ttt$mode    <- rev(nn3)[3]
          ttt$recMode <- rev(nn3)[2]
          ttt$hMode   <- rev(nn3)[1]
          ttt$hModev2 <- paste0("H",rev(nn3)[1],paste0(nn3[1:(length(nn3)-3)],collapse="_"))
          #eval(parse(text=paste0("dat",strsplit(tmpnm,split=fldr)[[1]][2],"  <-  ttt") ))
          #datlist2<-c(datlist2,paste0("dat",strsplit(tmpnm,split=fldr)[[1]][2]))
          datlist2         <- c(datlist2, paste0("dat",nn))
          empty2$empty[i]  <-  FALSE
          
          if(i==1)  {
          #  write.table(ttt, file=file.path(main,save_fldr,"sim_msm.csv"),append=F,col.names = TRUE,sep=",")
            OUT  <- ttt
          }
          if(!i==1) {
          #  write.table(ttt, file=file.path(main,save_fldr,"sim_msm.csv"),append=T,col.names = FALSE,sep=",")
            OUT  <- rbind(OUT,ttt)
          }
          rm(ttt)
          
      }else{
        empty2$empty[i]  <-  TRUE  
      }
      if(status) progress(100*round(i/length(simlist2),2))
    }
    OUT$note   <-  ""
    OUT$note[grep("19",OUT$hModev2)]  <-  "based on B0 assuming no climate effects on persistence"
    OUT$note[grep("59",OUT$hModev2)]  <-  "based B0 assuming climate effects on persistence"
    sim_msm <- OUT
    save(sim_msm,file=file.path(main,save_fldr,"sim_msm.Rdata"))
    rm(OUT)
    
    
    save(simlist0,file=file.path(main,save_fldr,"simlist0.Rdata"))
    save(simlist2,file=file.path(main,save_fldr,"simlist2.Rdata"))
    save(mclist0,file=file.path(main,save_fldr,"mclist0.Rdata"))
    save(mclist2,file=file.path(main,save_fldr,"mclist2.Rdata"))
    save(empty0,file=file.path(main,save_fldr,"empty0.Rdata"))
    save(empty2,file=file.path(main,save_fldr,"empty2.Rdata"))
    
    if(update.inputs){
      rset<-5
      # save(list=c("dat_2_5_3"
      # ),file=file.path(out_dir,"2_5_3_nohcr_simulations.Rdata")) 
      # save(list=c("dat_0_5_3"
      # ),file=file.path(out_dir,"0_5_3_nohcr_simulations.Rdata")) 
      # 
      # Catch = F40 (hcr =1.8) scenarios
      # dat_2_5_3 <- sim_msm%>%filter(recMode==as.character(rset),hMode=="3", is.na(MC_n)==T)
      # dat_0_5_3 <- sim_ssm%>%filter(recMode==as.character(rset),hMode=="3", is.na(MC_n)==T)
      # Catch = ABC scenarios
      dat_2_5_12 <- sim_msm%>%filter(recMode==as.character(rset),hMode=="12", is.na(MC_n)==T)
      
      # Catch = attach(ABC) , i.e. simulated ABC  --> TAC --> Catch
      dat_2_5_13 <- sim_msm%>%filter(recMode==as.character(rset),hMode=="13", is.na(MC_n)==T)
      
      # Random recruitment draws included as MC:
      #dat_2_5_3_mc  <- sim_msm%>%filter(recMode==as.character(rset),hMode=="3", MC_n>0)
      dat_2_5_12_mc <- sim_msm%>%filter(recMode==as.character(rset),hMode=="12", MC_n>0)
      dat_2_5_13_mc <- sim_msm%>%filter(recMode==as.character(rset),hMode=="13", MC_n>0)
      
      save(list=c("dat_2_5_12",
                  "dat_2_5_12_mc"
      ),file=file.path(main,save_fldr,"multispp_nocap_simulations.Rdata"))   
      save(list=c("dat_2_5_13",
                  "dat_2_5_13_mc"
      ),file=file.path(main,save_fldr,"multispp_cap_simulations.Rdata"))  
    }
    
    
}