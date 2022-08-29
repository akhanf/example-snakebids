# example

This is a minimalist BIDS App made using Snakebids (an extension of Snakemake). It's designed to replicate the functionality of the [example BIDS App](https://github.com/bids-apps/example).

For more information about Snakebids, see the [documentation](https://snakebids.readthedocs.io/en/main/).

## Description

This BIDS App uses `bet` to extract the brain from each participant image (at the `participant` level), and finds the average number of voxels in thoses brains (at the `group` level).

## Usage

The run script for this app is `example/run.py`.

```
usage: run.py [-h] [--pybidsdb-dir PYBIDSDB_DIR] [--reset-db] [--force-output]
              [--help-snakemake]
              [--participant-label PARTICIPANT_LABEL [PARTICIPANT_LABEL ...]]
              [--exclude-participant-label EXCLUDE_PARTICIPANT_LABEL [EXCLUDE_PARTICIPANT_LABEL ...]]
              [--derivatives DERIVATIVES [DERIVATIVES ...]]
              [--filter-t1 FILTER_T1 [FILTER_T1 ...]]
              [--wildcards-t1 WILDCARDS_T1 [WILDCARDS_T1 ...]] [--path-t1 PATH_T1]
              bids_dir output_dir {participant,group}

Snakebids helps build BIDS Apps with Snakemake

optional arguments:
  -h, --help            show this help message and exit

STANDARD:
  Standard options for all snakebids apps

  --pybidsdb-dir PYBIDSDB_DIR, --pybidsdb_dir PYBIDSDB_DIR
                        Optional path to directory of SQLite databasefile for PyBIDS.
                        If directory is passed and folder exists, indexing is skipped.
                        If reset_db is called, indexing will persist
  --reset-db, --reset_db
                        Reindex existing PyBIDS SQLite database
  --force-output, --force_output
                        Force output in a new directory that already has contents
  --help-snakemake, --help_snakemake
                        Options to Snakemake can also be passed directly at the
                        command-line, use this to print Snakemake usage

SNAKEBIDS:
  Options for snakebids app

  bids_dir              The directory with the input dataset formatted according to the
                        BIDS standard.
  output_dir            The directory where the output files should be stored. If you
                        are running group level analysis this folder should be
                        prepopulated with the results of the participant level
                        analysis.
  {participant,group}   Level of the analysis that will be performed.
  --participant-label PARTICIPANT_LABEL [PARTICIPANT_LABEL ...], --participant_label PARTICIPANT_LABEL [PARTICIPANT_LABEL ...]
                        The label(s) of the participant(s) that should be analyzed. The
                        label corresponds to sub-<participant_label> from the BIDS spec
                        (so it does not include "sub-"). If this parameter is not
                        provided all subjects should be analyzed. Multiple participants
                        can be specified with a space separated list.
  --exclude-participant-label EXCLUDE_PARTICIPANT_LABEL [EXCLUDE_PARTICIPANT_LABEL ...], --exclude_participant_label EXCLUDE_PARTICIPANT_LABEL [EXCLUDE_PARTICIPANT_LABEL ...]
                        The label(s) of the participant(s) that should be excluded. The
                        label corresponds to sub-<participant_label> from the BIDS spec
                        (so it does not include "sub-"). If this parameter is not
                        provided all subjects should be analyzed. Multiple participants
                        can be specified with a space separated list.
  --derivatives DERIVATIVES [DERIVATIVES ...]
                        Path(s) to a derivatives dataset, for folder(s) that contains
                        multiple derivatives datasets (default: False)

BIDS FILTERS:
  Filters to customize PyBIDS get() as key=value pairs

  --filter-t1 FILTER_T1 [FILTER_T1 ...], --filter_t1 FILTER_T1 [FILTER_T1 ...]
                        (default: suffix=T1w extension=.nii.gz datatype=anat)

INPUT WILDCARDS:
  File path entities to use as wildcards in snakemake

  --wildcards-t1 WILDCARDS_T1 [WILDCARDS_T1 ...], --wildcards_t1 WILDCARDS_T1 [WILDCARDS_T1 ...]
                        (default: subject session acquisition run)

PATH OVERRIDE:
  Options for overriding BIDS by specifying absolute paths that include wildcards,
  e.g.: /path/to/my_data/{subject}/t1.nii.gz

  --path-t1 PATH_T1, --path_t1 PATH_T1
```

## To-do

 - [x] passes dry-run
 - [ ] try running on actual data
 - [ ] update the dockerfile (current one is from the existing example bids app - haven't modified it)
 - [x] add instructions
 - [ ] linting
 - [ ] github actions?
