salloc -p high -c 8 --mem=10000 --nodes=1 -t 1440
srun -p high -u --pty bash -il
module load singularity fmriprep freesurfer
cd /group/dml/alex/
singularity run --cleanenv /share/apps/fmriprep-1.4.1/fmriprep.simg /group/dml/alex/cartoon_recall /group/dml/alex/cartoon_recall_fmriprep participant --participant_label 120 -w /group/dml/alex/cartoon_recall_workdir --nthreads 8 --mem_mb 9000 --n_cpus 8 --output-spaces anat MNI152NLin2009cAsym fsaverage5 --fs-license-file /group/dml/alex/freesurfer.txt --ignore slicetiming --dvars-spike-threshold 3