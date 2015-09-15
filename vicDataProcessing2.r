# the script does all the process of the precipitation data from collection to pre-processing

comnibedPrcpNCDC{


# process precipitation data from study area
processncdcPrcp("run_convert_prcp.scr", "")


# formatting the combined data
readPreprocDly("inputPrcp.scr", "/home/billah/vicFiles/vicModeling/vicDataProcessing/Prcp/prcp.daily /home/billah/vicFiles/vicModeling/vicDataProcessing/Prcp/prcp.inf /home/billah/vicFiles/vicModeling/vicDataProcessing/Prcp/basin_prcp.fmt \"1998 2007\"")


# time of adjustment of the combined data
precTobAdj("prcp_tobAdj.scr", "/home/billah/vicFiles/vicModeling/vicDataProcessing/Prcp/prec_tob_adj.input")


# create mask (ascii file) for the study area
createMask("run_convert_tif_ascii.scr", "")


# regridding the precipitation data for the basin
regridPrcp("regrd_prcp.scr", "")


# estimate monthly precipitation from NCDC data
mkMonthlyPrcp("mk_monthly_ir.scr", "")


# estimate monthly PRISM data 
mkPrism("get_prism_ir.scr", "")


# rescaling the precipitation data
mkRescale("rescale_ir.scr", "")


# process maximum temperature data from study area
processncdcTmax("run_convert_tmax.scr", "")


# formatting the combined data
readPreprocTmaxDly("inputTmax.scr", "/home/billah/vicFiles/vicModeling/vicDataProcessing/Tmax/tmax.daily /home/billah/vicFiles/vicModeling/vicDataProcessing/Tmax/tmax.inf /home/billah/vicFiles/vicModeling/vicDataProcessing/Tmax/basin_tmax.fmt \"1998 2007\"")


# time of adjustment of the combined data
tmaxTobAdj("tmax_tobAdj.scr", "/home/billah/vicFiles/vicModeling/vicDataProcessing/Tmax/tmax_tob_adj.input")


# regridding the maximum temperature data for the basin
regridTmax("regrd_tmax.scr", "")


# process minimum temperature data from study area
processncdcTmin("run_convert_tmin.scr", "")


# formatting the combined data
readPreprocTminDly("inputTmin.scr", "/home/billah/vicFiles/vicModeling/vicDataProcessing/Tmin/tmin.daily /home/billah/vicFiles/vicModeling/vicDataProcessing/Tmin/tmin.inf /home/billah/vicFiles/vicModeling/vicDataProcessing/Tmin/basin_tmin.fmt \"1998 2007\"")


# time of adjustment of the combined data
tminTobAdj("tmin_tobAdj.scr", "/home/billah/vicFiles/vicModeling/vicDataProcessing/Tmin/tmin_tob_adj.input")


# regridding the minimum temperature data for the basin
regridTmin("regrd_tmin.scr", "")

# run meteorological data (prcp_grid.rsc, tmax_grid.grd and tmin_grid.grd) to create gridded data for the study area.
vicInputMeteoData("run_vicinput2_ir.scr", "")


# collect wind speed data from NCEP/NCAR 
#getNCARwind("getwind.scr", "")


# regridding the NCEP/NCAR wind speed data
regridNCARwind("run_regrid_wind_ir.scr", "")


# combine the wind data with meteorological data
combineWind("run_combine_wind_ir.scr","")

# adding preproc and append data into a combined file.
latlonSoil("ldas_latlon.scr", "/home/billah/vicFiles/vicModeling/vicDataProcessing/Basin/mask_125.asc /home/billah/vicFiles/vicModeling/vicDataProcessing/LDAS/soil/latlon.txt")

# prepare soil data
ldasSoil("ldas_soil.scr", "/home/billah/vicFiles/vicModeling/vicDataProcessing/LDAS/soil/soil_ldas.txt /home/billah/vicFiles/vicModeling/vicDataProcessing/LDAS/soil/latlon.txt /home/billah/vicFiles/vicModeling/vicDataForSimulation/soil/ldassoildata.txt")

# prepare vegetation data
ldasVeg("ldas_veg.scr", "/home/billah/vicFiles/vicModeling/vicDataProcessing/LDAS/vegetation/ldas_lai.expanded.vegparams /home/billah/vicFiles/vicModeling/vicDataForSimulation/soil/ldassoildata.txt /home/billah/vicFiles/vicModeling/vicDataForSimulation/vegetation/ldasvegdata.txt")

}



# process precipitation data from study area
processncdcPrcp(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);

}

# processing historical input data and output a single file
readPreprocDly(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}


# time of observation of the combined precipitation data
precTobAdj(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}


# create mask (ascii file) for the study area
createMask(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}


# regirdding the precipitation data 
regridPrcp(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}


# making monthly averaged precipitation data 
mkMonthlyPrcp(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}


# get monthly averaged PRISM precipitation data 
mkPrism(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}


# rescale the precipitation data 
mkRescale(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}



# process maximum temperature data from study area
processncdcTmax(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);

}


# processing historical input data and output a single file
readPreprocTmaxDly(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}

# time of observation of the combined maximum temperature data
tmaxTobAdj(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}


# regirdding the maximum temperature data 
regridTmax(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}


# process minimum temperature data from study area
processncdcTmin(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}

# processing historical input data and output a single file
readPreprocTminDly(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}

# time of observation of the combined minimum temperature data
tminTobAdj(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}


# regirdding the minimum temperature data 
regridTmin(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}


# run meteorological data (prcp_grid.rsc, tmax_grid.grd and tmin_grid.grd) to create gridded data for the study area.
vicInputMeteoData(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);

}


# collect wind speed data from NCEP/NCAR 
getNCARwind(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);

}

# regridding the NCEP/NCAR wind speed data
regridNCARwind(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);

}

# combine the wind data with meteorological data
combineWind(*Cmd, *Arg){
   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);

}

latlonSoil(*Cmd, *Arg){
# adding latlon of the study region.

   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}




ldasSoil(*Cmd, *Arg){
# adding soil data from LDAS.

   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}



ldasVeg(*Cmd, *Arg){
# adding vegetation data from LDAS.

   msiExecCmd(*Cmd,*Arg,"null","null","null",*Result);
   msiGetStdoutInExecCmdOut(*Result,*Out);
}


INPUT null
OUTPUT ruleExecOut


