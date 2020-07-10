# mclist <- c(mclist0,mclist2)
# empty  <- rbind(empty0,empty2)
collate_MCMC <- function(mclist   = mclist2,
                         simlist  = simlist2,
                         empty    = empty2){
  if(status) print("read in MCMC files")

  for(i in 1:length(mclist)){
    ix  <-  mclist[i]
    ix  <-  strsplit(ix,split="dat_")[[1]][2]
    if(i==1){ 
      nitr<-length(which(grepl(ix,simlist)))
    }else{ 
      nitr<-c(nitr,length(which(grepl(ix,simlist))))
    }
  }
  
  dat_2_5_3_mc  <- sim_msm%>%filter(recMode==as.character(rset),hMode=="3", is.na(MC_n)==F)
  dat_2_5_12_mc <- sim_msm%>%filter(recMode==as.character(rset),hMode=="12", is.na(MC_n)==F)
  dat_2_5_13_mc <- sim_msm%>%filter(recMode==as.character(rset),hMode=="13", is.na(MC_n)==F)
  
  for(i in 1:length(mclist)){
    ix  <-  mclist[i]
    ix  <-  strsplit(ix,split="dat_")[[1]][2]
    if(any(empty$empty[grep(ix,empty[,1])])){
      print(paste("empty folder for ",ix))
    }else{
      
      eval(parse(text=paste0("dat_",ix,"  <-  getMCMC(datin=mclist[i],nitr=nitr[i],agein=1)") ))
      eval(parse(text=paste0("C_",ix,"    <-  getMCMC(datin=mclist[i],nitr=nitr[i],valin='Catch_total_biom',agein=1)") ))
      eval(parse(text=paste0("abc_",ix,"  <-  getMCMC(datin=mclist[i],nitr=nitr[i],valin='ABC_total_biom',agein=1)") )) 
      eval(parse(text=paste0("B_",ix,"    <-  getMCMC(datin=mclist[i],nitr=nitr[i],valin='SSB_total_biom',agein=1)") )) 
      eval(parse(text=paste0("B0_",ix,"   <-  getMCMC(datin=mclist[i],nitr=nitr[i],valin='SSB0_total_biom',agein=1)") )) 
      eval(parse(text=paste0("TempC_",ix,"<-  getMCMC(datin=mclist[i],nitr=nitr[i],valin='bottomT_C',agein=1)") )) 
    }
    
    if(status) progress(100*(round(1/length(mclist),2)))
  }
  
  for(i in 1:length(mclist)){
    ix  <-  mclist[i]
    ix  <-  strsplit(ix,split="dat_")[[1]][2]
    if(any(rbind(empty0,empty2)$empty[grep(ix,rbind(empty0,empty2)[,1])])){
      print(paste("empty folder for ",ix))
    }else{
      
      eval(parse(text=paste0("W4_",ix,"         <-  getMCMC(datin=mclist[i],nitr=nitr[i],valin='wt_at_age',agein=4)" ))) 
      eval(parse(text=paste0("F_",ix,"          <-  getMCMC(datin=mclist[i],nitr=nitr[i],valin='F',agein=1)") )) 
      eval(parse(text=paste0("ABC_",ix,"        <-  getMCMC(datin=mclist[i],nitr=nitr[i],valin='ABC_total_biom',agein=1)") )) 
      eval(parse(text=paste0("Fabc_",ix,"       <-  getMCMC(datin=mclist[i],nitr=nitr[i],valin='Fabc',agein=1)") )) 
      eval(parse(text=paste0("F40_",ix,"        <-  getMCMC(datin=mclist[i],nitr=nitr[i],valin='F40',agein=1)") )) 
      eval(parse(text=paste0("M2_",ix,"         <-  getMCMC(datin=mclist[i],nitr=nitr[i],valin='M2',agein=1)") )) 
      eval(parse(text=paste0("ration_",ix,"     <-  getMCMC(datin=mclist[i],nitr=nitr[i],valin='Ration_g_fish',agein=4)") )) 
    }
    
    if(status) progress(100*(round(1/length(mclist),2)))
  } 
  
  # get Btarget for each mclist
  for(i in 1:length(mclist)){
    ix  <-  mclist[i]
    ix  <-  strsplit(ix,split="dat_")[[1]][2]
    if(any(rbind(empty0,empty2)$empty[grep(ix,rbind(empty0,empty2)[,1])])){
      print(paste("empty folder for ",ix))
    }else{
      paste("tmpdir<-",fldr,ix)
    }
    
    if(status) progress(100*(round(1/length(mclist),2)))
  } 
  
  mclist_nomc<-c(
    "dat_0_5_3","dat_0_5_12","dat_0_5_13",
    "dat_2_5_3","dat_2_5_12","dat_2_5_13")
  
  for(i in 1:length(mclist_nomc)){
    B_0_5_3   <-  grabDat(datIn=dat_0_5_3,valIn="SSB_total_biom")
    ix  <-  mclist_nomc[i]
    ix  <-  strsplit(ix,split="dat_")[[1]][2]
    eval(parse(text=paste0("B_",ix,"      <-  grabDat(datIn=",mclist_nomc[i],",valIn='SSB_total_biom')") )) 
    eval(parse(text=paste0("B0_",ix,"     <-  grabDat(datIn=",mclist_nomc[i],",valIn='SSB0_total_biom')") )) 
    eval(parse(text=paste0("C_",ix,"      <-  grabDat(datIn=",mclist_nomc[i],",valIn='Catch_total_biom')") )) 
    eval(parse(text=paste0("abc_",ix,"    <-  grabDat(datIn=",mclist_nomc[i],",valIn='ABC_total_biom')") ))
    eval(parse(text=paste0("F_",ix,"      <-  grabDat(datIn=",mclist_nomc[i],",valIn='F')") ))
  }
  
}