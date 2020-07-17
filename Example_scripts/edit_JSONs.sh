#! /usr/bin/env bash
#
# Requires: jq (https://stedolan.github.io/jq/)
# Usage: pass in subject as a variable in the terminal (can loop through subjects if desired).
# Example: for i in sub-101 sub-102; do ./edit_JSONs.sh $i; done

# Set the top directory for the project
TOPDIR=/Users/zreagh/Desktop/8vid_fMRI

# Take our subject ID variable as an command line input
SUBJ=$1;

# Enter the subject directory
SUBJDIR=/Users/zreagh/Desktop/8vid_fMRI/$SUBJ
cd $SUBJDIR

echo "Modifying the fmap JSON file..."

# Enter the directory with the fmap JSON file
cd fmap

# Use the 'jq' package to interface with the JSON file, replacing the
# 'EffectiveEchoSpacing' key as 'TotalReadoutTime' as BIDS expects.
# Write this modified JSON file to a temp file.
cat $SUBJ\_acq-01_dir-AP_run-01_epi.json | 
  jq 'to_entries | 
       map(if .key == "EffectiveEchoSpacing" 
          then . + {"key":"TotalReadoutTime"} 
          else . 
          end
         ) | 
      from_entries' > tmp.json

# Replace the original file with the temp file.
mv tmp.json $SUBJ\_acq-01_dir-AP_run-01_epi.json

# Define our file names (not sure how to do this in the command below, quoting scheme is picky)
# N.B. YOU WILL NEED TO DEFINE THESE ACCORDING TO YOUR PARTICULAR STUDY!
F1=func/$SUBJ\_task-FuncLoc_bold.nii.gz
F2=func/$SUBJ\_task-Video_run-1_bold.nii.gz
F3=func/$SUBJ\_task-Video_run-2_bold.nii.gz
F4=func/$SUBJ\_task-Video_run-3_bold.nii.gz
F5=func/$SUBJ\_task-Recall_bold.nii.gz

# Modify the JSON file to include the IntendedFor section
jq '. + { "IntendedFor": ["'$F1'", "'$F2'", "'$F3'", "'$F4'", "'$F5'"] }' $SUBJ\_acq-01_dir-AP_run-01_epi.json >> tmp.json && mv tmp.json $SUBJ\_acq-01_dir-AP_run-01_epi.json

echo "Done with the fmap JSON file..."