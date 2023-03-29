#!/bin/bash
module load singularity
singularity run -B /grand/projects/determined_eval/scratch/determined_db:/var/lib/postgresql/data -B /grand/projects/determined_eval/scratch/pgrun:/var/run/postgresql -e -C --env-file /grand/projects/determined_eval/bin/pg.env /grand/projects/determined_eval/images/postgres:10.14.sif