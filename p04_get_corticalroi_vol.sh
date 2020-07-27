#!/bin/sh
# converts labels from freesurfer average to subject volumetric native space
export FREESURFER_HOME=/usr/local/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh

# uncomment to run on other cortical ROIS scroll down to see non destructive version of added motro and pfc ROIS
for isub in sub-01 sub-02 sub-03 sub-04 sub-05 sub-06 sub-07 sub-08 sub-09 sub-10 sub-11 sub-12 sub-13 sub-14 sub-15 sub-16 sub-17 sub-18 sub-19 sub-20 sub-21
	do
		SUBJECTS_DIR=/home/jordan/studyforrest-data-freesurfer/ # set subject specific driectory
		OUTDIR=$SUBJECTS_DIR/$isub/ROIs/

		## cortical ROIs - one line per region
		# sanity check for RSC and Temporal Pole and Occipital Pole and parahippocampal gyrus
		## LH
		# ACC 
		mri_label2vol --label $OUTDIR/lh.G&S_cingul-Ant.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_ACC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# RSC
		mri_label2vol --label $OUTDIR/lh.G_cingul-Post-ventral.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_RSC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# ANG 
		mri_label2vol --label $OUTDIR/lh.G_pariet_inf-Angular.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_ANG.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# Tpole
		mri_label2vol --label $OUTDIR/lh.Pole_temporal.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_TPole.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# PCC
		mri_label2vol --label $OUTDIR/lh.G_cingul-Post-dorsal.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_PCC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# Prec
		mri_label2vol --label $OUTDIR/lh.G_precuneus.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_Prec.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# OCC pole
		mri_label2vol --label $OUTDIR/lh.Pole_occipital.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_occ_pole.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# PHG ERC + PRC + COMBINED
		mri_label2vol --label $OUTDIR/lh.G_oc-temp_med-Parahip.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_PHG.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# VTC 
		mri_label2vol --label $OUTDIR/lh.S_oc-temp_med_and_lingual.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_VTC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# VMPFC
		mri_label2vol --label $OUTDIR/lh.G_subcallosal.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_VMPFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# MPFC
		mri_label2vol --label $OUTDIR/lh.S_suborbital.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_MPFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# Rectus
		mri_label2vol --label $OUTDIR/lh.G_rectus.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_mOFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# lOFC
		mri_label2vol --label $OUTDIR/lh.G_orbital.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_lOFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# HPC 
		
		## RH 
		# ACC 
		mri_label2vol --label $OUTDIR/rh.G&S_cingul-Ant.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_ACC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# RSC
		mri_label2vol --label $OUTDIR/rh.G_cingul-Post-ventral.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_RSC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# ANG 
		mri_label2vol --label $OUTDIR/rh.G_pariet_inf-Angular.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_ANG.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# Tpole
		mri_label2vol --label $OUTDIR/rh.Pole_temporal.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_TPole.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# PCC
		mri_label2vol --label $OUTDIR/rh.G_cingul-Post-dorsal.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_PCC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# Prec
		mri_label2vol --label $OUTDIR/rh.G_precuneus.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_Prec.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# OCC pole
		mri_label2vol --label $OUTDIR/rh.Pole_occipital.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_occ_pole.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# PHG ERC + PRC + COMBINED
		mri_label2vol --label $OUTDIR/rh.G_oc-temp_med-Parahip.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_PHG.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# VTC
		mri_label2vol --label $OUTDIR/rh.S_oc-temp_med_and_lingual.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_VTC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# VMPFC
		mri_label2vol --label $OUTDIR/rh.G_subcallosal.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_VMPFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# MPFC
		mri_label2vol --label $OUTDIR/rh.S_suborbital.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_MPFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# Rectus
		mri_label2vol --label $OUTDIR/rh.G_rectus.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_mOFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		# lOFC
		mri_label2vol --label $OUTDIR/rh.G_orbital.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_lOFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat

done

# # non destructively ROI
# for isub in sub01 sub02 sub03 sub04 sub05 sub06 sub07 sub08 sub09 sub10 sub11 sub12 sub13 sub14 sub15 sub16 sub17 sub18 sub19 sub20 sub21
# 	do
# 		SUBJECTS_DIR=/home/jordan/studyforrest-data-freesurfer/$isub/ # set subject specific driectory
# 		OUTDIR=$SUBJECTS_DIR/ROIs/
# 		# LH
# 		# VMPFC
# 		mri_label2vol --label $OUTDIR/lh.G_subcallosal.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_VMPFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
# 		# MPFC
# 		mri_label2vol --label $OUTDIR/lh.S_suborbital.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_MPFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
# 		# Rectus
# 		mri_label2vol --label $OUTDIR/lh.G_rectus.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_mOFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
# 		# lOFC
# 		mri_label2vol --label $OUTDIR/lh.G_orbital.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_lOFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
# 		# precentral
# 		mri_label2vol --label $OUTDIR/lh.G_precentral.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_precentral.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
# 		# central
# 		mri_label2vol --label $OUTDIR/lh.S_central.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_central.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
# 		# postcentral
# 		mri_label2vol --label $OUTDIR/lh.G_postcentral.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi lh --o $OUTDIR/${isub}_lh_postcentral.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
# 		# RH
# 		# VMPFC
# 		mri_label2vol --label $OUTDIR/rh.G_subcallosal.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_VMPFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
# 		# MPFC
# 		mri_label2vol --label $OUTDIR/rh.S_suborbital.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_MPFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
# 		# Rectus
# 		mri_label2vol --label $OUTDIR/rh.G_rectus.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_mOFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
# 		# lOFC
# 		mri_label2vol --label $OUTDIR/rh.G_orbital.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_lOFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
# 		# precentral
# 		mri_label2vol --label $OUTDIR/rh.G_precentral.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_precentral.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
# 		# central
# 		mri_label2vol --label $OUTDIR/rh.S_central.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_central.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
# 		# postcentral
# 		mri_label2vol --label $OUTDIR/rh.G_postcentral.label --temp $SUBJECTS_DIR/$isub/mri/rawavg.mgz --subject $isub --hemi rh --o $OUTDIR/${isub}_rh_postcentral.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/${isub}_register.dat
		
# done






## can inspect in tkmedit or itk snap
# note in above make sure you use rawavg.mgz in both regeister labels and  mri_label2vol



# ctx_rh_Pole_temporal
# ctx_lh_Pole_temporal


# tcsh
# setenv FREESURFER_HOME /Applications/freesurfer
# source $FREESURFER_HOME/SetUpFreeSurfer.csh
# setenv SUBJECTS_DIR /Volumes/dml/frank/hires_landmark4_EEG_fMRI/data_fMRI/MPRAGES/all_subs/

# foreach isub (s01 s03 s04 s05 s06 s07 s08 s09 s10 s11 s12 s13 s14 s15 s16 s17 s19)
# ## set ecah loop
# set OUTDIR=$SUBJECTS_DIR${isub}

# ## step 4
# ## cortical ROIs - one line per region
# ## LH 
# mri_label2vol --label $OUTDIR/corticalroi/lh.G_and_S_cingul-Ant.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi lh --o $OUTDIR/corticalroi/${isub}_lh_ACC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat
# mri_label2vol --label $OUTDIR/corticalroi/lh.G_cingul-Post-ventral.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi lh --o $OUTDIR/corticalroi/${isub}_lh_RSC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat
# mri_label2vol --label $OUTDIR/corticalroi/lh.G_pariet_inf-Angular.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi lh --o $OUTDIR/corticalroi/${isub}_lh_ANG.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat
# mri_label2vol --label $OUTDIR/corticalroi/lh.Pole_temporal.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi lh --o $OUTDIR/corticalroi/${isub}_lh_TPole.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat
# mri_label2vol --label $OUTDIR/corticalroi/lh.G_cingul-Post-dorsal.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi lh --o $OUTDIR/corticalroi/${isub}_lh_PCC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat
# mri_label2vol --label $OUTDIR/corticalroi/lh.G_precuneus.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi lh --o $OUTDIR/corticalroi/${isub}_lh_Prec.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat
# mri_label2vol --label $OUTDIR/corticalroi/lh.G_subcallosal.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi lh --o $OUTDIR/corticalroi/${isub}_lh_VMPFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat
# mri_label2vol --label $OUTDIR/corticalroi/lh.S_suborbital.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi lh --o $OUTDIR/corticalroi/${isub}_lh_MPFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat
# mri_label2vol --label $OUTDIR/corticalroi/lh.G_precentral.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi lh --o $OUTDIR/corticalroi/${isub}_lh_precentral.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat

# ## RH
# mri_label2vol --label $OUTDIR/corticalroi/rh.G_and_S_cingul-Ant.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi rh --o $OUTDIR/corticalroi/${isub}_rh_ACC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat
# mri_label2vol --label $OUTDIR/corticalroi/rh.G_cingul-Post-ventral.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi rh --o $OUTDIR/corticalroi/${isub}_rh_RSC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat
# mri_label2vol --label $OUTDIR/corticalroi/rh.G_pariet_inf-Angular.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi rh --o $OUTDIR/corticalroi/${isub}_rh_ANG.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat
# mri_label2vol --label $OUTDIR/corticalroi/rh.Pole_temporal.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi rh --o $OUTDIR/corticalroi/${isub}_rh_TPole.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat
# mri_label2vol --label $OUTDIR/corticalroi/rh.G_cingul-Post-dorsal.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi rh --o $OUTDIR/corticalroi/${isub}_rh_PCC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat
# mri_label2vol --label $OUTDIR/corticalroi/rh.G_precuneus.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi rh --o $OUTDIR/corticalroi/${isub}_rh_Prec.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat
# mri_label2vol --label $OUTDIR/corticalroi/rh.G_subcallosal.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi rh --o $OUTDIR/corticalroi/${isub}_rh_VMPFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat
# mri_label2vol --label $OUTDIR/corticalroi/rh.S_suborbital.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi rh --o $OUTDIR/corticalroi/${isub}_rh_MPFC.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat
# mri_label2vol --label $OUTDIR/corticalroi/rh.G_precentral.label --temp $OUTDIR/mri/orig.mgz --subject ${isub} --hemi rh --o $OUTDIR/corticalroi/${isub}_rh_precentral.nii --proj frac 0 1 .1 --fillthresh .3 --reg $OUTDIR/corticalroi/${isub}_register.dat

# end

# ## WANT TO EXAMINE
# # change regions/subjects accordingly 
# # this was using orig.mgz 
# tkmedit -f $SUBJECTS_DIR/s01/mri/orig.mgz -overlay $SUBJECTS_DIR/s01/corticalroi/s01_lh_precentral.nii -overlay-reg $SUBJECTS_DIR/s01/corticalroi/s01_register.dat -fthresh 0.5
# # using rawavg.mgz
# tkmedit -f $SUBJECTS_DIR/s01/mri/rawavg.mgz -overlay $SUBJECTS_DIR/s01/corticalroi/s01_lh_precentral.nii -fthresh 0.5

# foreach isub (s07 s08 s09 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19)

# #LH 
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_lh_ACC.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_lh_RSC.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_lh_ANG.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_lh_TPole.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_lh_PCC.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_lh_Prec.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_lh_VMPFC.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_lh_MPFC.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_lh_precentral.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5

# #RH 
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_rh_ACC.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_rh_RSC.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_rh_ANG.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_rh_TPole.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_rh_PCC.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_rh_Prec.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_rh_VMPFC.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_rh_MPFC.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5
# tkmedit -f $SUBJECTS_DIR/${isub}/mri/orig.mgz -overlay $SUBJECTS_DIR/${isub}/corticalroi/${isub}_rh_precentral.nii -overlay-reg $SUBJECTS_DIR/${isub}/corticalroi/${isub}_register.dat -fthresh 0.5

# end
