#!/bin/sh
export FREESURFER_HOME=/usr/local/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh

for isub in sub-01 sub-02 sub-03 sub-04 sub-05 sub-06 sub-07 sub-08 sub-09 sub-10 sub-11 sub-12 sub-13 sub-14 sub-15 sub-16 sub-17 sub-18 sub-19 sub-20 sub-21
	do
		SUBJECTS_DIR=/home/jordan/studyforrest-data-freesurfer/ # set subject specific driectory
		OUTDIR=$SUBJECTS_DIR/$isub/ROIs/
		echo $OUTDIR # print subject specific direct
		# each vertex in the annotation gets a label
		# only grabs cortical ROIs
		mri_annotation2label --subject $isub --hemi lh --outdir $OUTDIR
		mri_annotation2label --subject $isub --hemi rh --outdir $OUTDIR
		mri_annotation2label --subject $isub --hemi lh --outdir $OUTDIR --annotation aparc.a2009s
		mri_annotation2label --subject $isub --hemi rh --outdir $OUTDIR --annotation aparc.a2009s
done


mri_annotation2label --subject $isub --hemi lh --outdir $OUTDIR --annotation aparc.a2009s