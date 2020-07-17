#! /bin/bash
#
# This script takes a raw (uncompressed) DICOM directory from the Skyra and creates a
# BIDS-ified directory with the data converted to NIFTIs and JSON files.
#
# Written by Z. Reagh 8/6/18
#
# Usage: ./BIDSify_DICOMs.sh [subject's DICOM directory] [desired subject ID: recommended as sub-xxx]

SUBDIR=/Volumes/dml/ajbarnett/cartoon_recall_fMRI/raw/$1
SUBJECT=$2

# Simple function to display usage of the script, if no arguments are provided.
function Usage {
    cat <<USAGE

Usage:
./BIDSify_DICOMs.sh DICOMdirectory SubjectID

Arguments:
     DICOMdirectory: The (uncompressed) directory where your DICOM files are located.
     SubjectID: The desired subject ID. Strongly recommend use of BIDS naming convention: sub-xxx.

Example:
./BIDSify_DICOMs.sh ds_2018-08-03_16-09 sub-102

script by Zach Reagh

USAGE
    exit 1
}

# Display the USAGE message above, if no arguments are provided when calling the script.
if ((!$#))
	then
		Usage
fi

# First, check if we have AFNI (specifically, the dcm2niix_afni command) available before proceeding.
command -v dcm2niix_afni >/dev/null 2>&1 || { echo "Requires AFNI. If AFNI is installed, check\
 that your path is set up. If not installed, download here: //afni.nimh.nih.gov/" >&2; exit 1; }

# If we pass that check, proceed.
echo "++++++++++++++++++++ BEGINNING ++++++++++++++++++++"

echo "BIDS-ifying" $1 "as" $2 "..."

# Set up the BIDS directory structure.
cd $SUBDIR
mkdir $SUBJECT
cd $SUBJECT
mkdir anat
mkdir func
mkdir fmap

echo "Directories made..."

# N.B. YOU LIKELY NEED TO CUSTOMIZE SCAN NAMES (i.e., the 'cd' lines) FOR YOUR SPECIFIC STUDY!!!

# Start converting and moving over the NIFTIs and JSONs, starting with structurals.
cd $SUBDIR/*mprage*
dcm2niix_afni ./
mv *nii* $SUBJECT\_T1w.nii.gz
mv *json* $SUBJECT\_T1w.json
mv *nii* *json* $SUBDIR/$SUBJECT/anat

echo "Done with structurals..."

# Move to functionals, and stick them in the 'func' directory.
cd $SUBDIR/*localizer_8min*
dcm2niix_afni ./
mv *nii* $SUBJECT\_task-FuncLoc_bold.nii.gz
mv *json* $SUBJECT\_task-FuncLoc_bold.json
mv *nii* *json* $SUBDIR/$SUBJECT/func

cd $SUBDIR/*006_video*
dcm2niix_afni ./
mv *nii* $SUBJECT\_task-Video_run-1_bold.nii.gz
mv *json* $SUBJECT\_task-Video_run-1_bold.json
mv *nii* *json* $SUBDIR/$SUBJECT/func

cd $SUBDIR/*007_video*
dcm2niix_afni ./
mv *nii* $SUBJECT\_task-Video_run-2_bold.nii.gz
mv *json* $SUBJECT\_task-Video_run-2_bold.json
mv *nii* *json* $SUBDIR/$SUBJECT/func

cd $SUBDIR/*008_video*
dcm2niix_afni ./
mv *nii* $SUBJECT\_task-Video_run-3_bold.nii.gz
mv *json* $SUBJECT\_task-Video_run-3_bold.json
mv *nii* *json* $SUBDIR/$SUBJECT/func

cd $SUBDIR/*recall*
dcm2niix_afni ./
mv *nii* $SUBJECT\_task-Recall_bold.nii.gz
mv *json* $SUBJECT\_task-Recall_bold.json
mv *nii* *json* $SUBDIR/$SUBJECT/func

echo "Done with functionals..."

# We will put the reverse encoded BOLD run in 'fmap' for use with unwarping.
cd $SUBDIR/*bold_AP*
dcm2niix_afni ./
mv *nii* $SUBJECT\_acq-01_dir-AP_run-01_epi.nii.gz
mv *json* $SUBJECT\_acq-01_dir-AP_run-01_epi.json
mv *nii* *json* $SUBDIR/$SUBJECT/fmap
echo "Done with reverse phase encoded BOLD and/or fieldmaps..."

echo "++++++++++++++++++++ FINISHED ++++++++++++++++++++"
