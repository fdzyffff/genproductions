#!/bin/sh

#  customizecards.sh
#  For fD Models, scan over ZD
#
#  Created by Jacob Chesslo on 6/30/20.
#
masspoints=(60 91.11876 100 125 200)
base_dir="2017/13TeV/"
template_dir="ZDfDsD_sDdecay-pythia8/"

for mp in "${masspoints[@]}"
do
    dir="ZDfDsD_M${mp}_sDdecay-pythia8/"
    mkdir -p "$dir"
    
    cp "${template_dir}ZDfDsD_sDdecay-pythia8_extramodels.dat" "${dir}ZDfDsD_sDdecay_M${mp}-pythia8_extramodels.dat"
    cp "${template_dir}ZDfDsD_sDdecay-pythia8_proc_card.dat" "${dir}ZDfDsD_sDdecay_M${mp}-pythia8_proc_card.dat"
    cp "${template_dir}ZDfDsD_sDdecay-pythia8_run_card.dat" "${dir}ZDfDsD_sDdecay_M${mp}-pythia8_run_card.dat"
    cp "${template_dir}ZDfDsD_sDdecay-pythia8_customizecards.dat" "${dir}ZDfDsD_sDdecay_M${mp}-pythia8_customizecards.dat"
    
    
    cd ${dir}
        #customizecard.dat
        sed -i '' "s/MASS/${mp}/g" "ZDfDsD_sDdecay_M${mp}-pythia8_customizecards.dat"

        #run_card.dat
        sed -i '' "s/EVENTS/5000/g" "ZDfDsD_sDdecay_M${mp}-pythia8_run_card.dat"
        
        #param_card.dat
        
        #proc_card.dat
        sed -i '' "s/MASS/M${mp}/g" "ZDfDsD_sDdecay_M${mp}-pythia8_proc_card.dat"
        
        #extramodels.dat
        
    cd ../
    
done

